import 'package:bloc/bloc.dart';
import 'package:rahma_project/core/utils/functions/get_address_from_coordinates.dart';
import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';
import 'package:rahma_project/features/prayer/domain/repositories/prayer_repository.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit({required this.prayerRepository}) : super(PrayerInitial());
  final PrayerRepository prayerRepository;

  PrayerEntity? prayerEntity;

  /// Load prayers with user's actual location
  Future<void> loadPrayersWithUserLocation({bool forceRefresh = false}) async {
    emit(PrayerLoading());

    final result = await prayerRepository.getDailyPrayer(forceRefresh: forceRefresh);

    result.fold((failure) => emit(PrayerError(message: failure.error)), (prayer) async {
      final address = await getAddressFromCoordinates(prayer.location?.latitude ?? 0, prayer.location?.longitude ?? 0);

      emit(PrayerLoaded(prayer: prayer, address: address));
    });
  }

  Future<void> loadRemotePrayers() async {
    emit(PrayerLoading());

    final result = await prayerRepository.getDailyPrayer();

    result.fold((failure) => emit(PrayerError(message: failure.error)), (prayer) async {
      final address = await getAddressFromCoordinates(prayer.location?.latitude ?? 0, prayer.location?.longitude ?? 0);
      emit(PrayerLoaded(prayer: prayer, address: address));
    });
  }

  Future<void> isLocationChanged() async {
    final isLocationChanged = await prayerRepository.isLocationChanged();

    if (isLocationChanged) {
      emit(PrayerLocationChanged());
    }
  }

  /// Refresh prayer times
  Future<void> refresh() async {
    await loadPrayersWithUserLocation();
  }
}
