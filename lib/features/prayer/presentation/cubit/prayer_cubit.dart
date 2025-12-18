import 'package:bloc/bloc.dart';
import 'package:rahma_project/core/helpers/latlng.dart';
import 'package:rahma_project/core/utils/functions/get_address_from_coordinates.dart';
import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';
import 'package:rahma_project/features/prayer/domain/repositories/prayer_repository.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit({required this.prayerRepository}) : super(PrayerInitial());

  final PrayerRepository prayerRepository;

  /// Main method: Load prayers with intelligent fallback strategy
  Future<void> loadPrayers({bool forceRefresh = false}) async {
    emit(PrayerLoading());

    // Strategy 1: Try to get cached prayer first (if not forcing refresh)
    if (!forceRefresh) {
      final cachedResult = await _tryLoadFromCache();
      if (cachedResult != null) return; // Success! We're done
    }

    // Strategy 2: Try to fetch fresh prayer with current location
    final freshResult = await _tryLoadFreshPrayer();
    if (freshResult) return; // Success! We're done

    // Strategy 3: Fallback to cached prayer (even if stale)
    await _fallbackToCachedPrayer();
  }

  /// Try to load valid cached prayer
  Future<PrayerEntity?> _tryLoadFromCache() async {
    final localResult = await prayerRepository.getLocalPrayer();

    return localResult.fold(
      (failure) => null, // Cache read failed
      (cachedPrayer) async {
        if (cachedPrayer == null) return null; // No cached data

        // Check if cached data is still valid
        final isValid = await _isCachedPrayerValid(cachedPrayer);

        if (isValid) {
          await _emitPrayerLoaded(cachedPrayer);
          return cachedPrayer;
        }

        return null; // Cached data is stale
      },
    );
  }

  /// Try to fetch fresh prayer from remote
  Future<bool> _tryLoadFreshPrayer() async {
    String? warningMessage;

    // Step 1: Get current location
    final locationResult = await prayerRepository.getCurrentLocation();

    final position = locationResult.fold((failure) {
      warningMessage = "Location unavailable";
      return null;
    }, (pos) => pos);

    if (position == null) {
      return false; // Will fallback to cache
    }

    // Step 2: Fetch prayer with the location
    final location = LatLng(position.latitude, position.longitude);
    final prayerResult = await prayerRepository.getRemotePrayer(location);

    return await prayerResult.fold(
      (failure) {
        warningMessage = "Network error";
        return false; // Will fallback to cache
      },
      (prayer) async {
        // Success! Save to cache and emit
        await prayerRepository.savePrayerLocally(prayer);
        await _emitPrayerLoaded(prayer, warningMessage: warningMessage);
        return true;
      },
    );
  }

  /// Fallback: Load any cached prayer (even if stale)
  Future<void> _fallbackToCachedPrayer() async {
    final localResult = await prayerRepository.getLocalPrayer();

    localResult.fold(
      (failure) {
        // Complete failure - no data at all
        emit(PrayerError(message: "Unable to load prayer times. Please check your connection and try again."));
      },
      (cachedPrayer) async {
        if (cachedPrayer != null) {
          // We have stale data - better than nothing
          await _emitPrayerLoaded(cachedPrayer, isStale: true);
        } else {
          // No cached data at all
          emit(PrayerError(message: "No prayer data available. Please check your connection."));
        }
      },
    );
  }

  /// Check if cached prayer is still valid (not expired, location hasn't changed)
  Future<bool> _isCachedPrayerValid(PrayerEntity cachedPrayer) async {
    // Check 1: Is the prayer data for today?
    final isToday = _isPrayerForToday(cachedPrayer);
    if (!isToday) return false;

    // Check 2: Has location changed significantly?
    final locationResult = await prayerRepository.getCurrentLocation();

    return locationResult.fold(
      (failure) {
        // Can't verify location - assume cached data is valid
        return true;
      },
      (currentPosition) async {
        if (cachedPrayer.location == null) return true; // No location to compare

        final currentLocation = LatLng(currentPosition.latitude, currentPosition.longitude);
        final cachedLocation = LatLng(cachedPrayer.location!.latitude, cachedPrayer.location!.longitude);

        final hasChanged = await prayerRepository.hasLocationChanged(cachedLocation, currentLocation);

        return !hasChanged; // Valid if location hasn't changed
      },
    );
  }

  /// Check if prayer is for today
  bool _isPrayerForToday(PrayerEntity prayer) {
    if (prayer.date == null) return false;

    final now = DateTime.now();
    final prayerDate = prayer.date!.timestamp;

    return now.year == prayerDate.year && now.month == prayerDate.month && now.day == prayerDate.day;
  }

  /// Emit prayer loaded state with address
  Future<void> _emitPrayerLoaded(PrayerEntity prayer, {bool isStale = false, String? warningMessage}) async {
    final address = await getAddressFromCoordinates(prayer.location?.latitude ?? 0, prayer.location?.longitude ?? 0);

    emit(PrayerLoaded(prayer: prayer, address: address, isStale: isStale, warningMessage: warningMessage));
  }

  /// Force refresh from remote
  Future<void> refresh() async {
    await loadPrayers(forceRefresh: true);
  }

  /// Check if location has changed and notify user
  Future<void> checkLocationChange() async {
    final localResult = await prayerRepository.getLocalPrayer();
    final locationResult = await prayerRepository.getCurrentLocation();

    localResult.fold((failure) => null, (cachedPrayer) async {
      if (cachedPrayer?.location == null) return;

      locationResult.fold((failure) => null, (currentPosition) async {
        final hasChanged = await prayerRepository.hasLocationChanged(
          LatLng(cachedPrayer!.location!.latitude, cachedPrayer.location!.longitude),
          LatLng(currentPosition.latitude, currentPosition.longitude),
        );

        if (hasChanged) {
          emit(PrayerLocationChanged());
        }
      });
    });
  }
}
