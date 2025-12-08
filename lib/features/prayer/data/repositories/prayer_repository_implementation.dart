import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rahma_project/core/error/failure.dart';
import 'package:rahma_project/core/helpers/latlng.dart';
import 'package:rahma_project/core/utils/functions/determine_current_location.dart';
import 'package:rahma_project/features/prayer/data/datasources/prayer_local_ds.dart';
import 'package:rahma_project/features/prayer/data/datasources/prayer_remote_ds.dart';
import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';
import 'package:rahma_project/features/prayer/domain/repositories/prayer_repository.dart';

class PrayerRepositoryImplementation implements PrayerRepository {
  final PrayerLocalDs prayerLocalDs;
  final PrayerRemoteDs prayerRemoteDs;

  static const double significantDistanceKm = 30.0;

  PrayerRepositoryImplementation({
    required this.prayerLocalDs,
    required this.prayerRemoteDs,
  });

  @override
  Future<Either<Failure, PrayerEntity>> getDailyPrayer({
    bool forceRefresh = false,
  }) async {
    if (forceRefresh) {
      return await getRemotePrayer();
    }
    PrayerEntity? localPrayer = await prayerLocalDs.getPrayer();
    if (localPrayer != null) {
      final shouldFetchNewPrayerData = _shouldFetchNewPrayerData(localPrayer);
      if (!shouldFetchNewPrayerData) return Right(localPrayer);
    }
    return await getRemotePrayer();
  }

  Future<Either<Failure, PrayerEntity>> getRemotePrayer() async {
    try {
      Position targetLocation = await determinePosition();
      PrayerEntity prayer = await prayerRemoteDs.getPrayer(
        LatLng(targetLocation.latitude, targetLocation.longitude),
      );
      return Right(prayer);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(error: e.toString()));
      }
    }
  }

  bool _shouldFetchNewPrayerData(PrayerEntity localPrayer) {
    if (!_isSameDay(localPrayer.date?.timestamp)) return true;
    return false;
  }

  /// Checks if the stored prayer is for today
  bool _isSameDay(DateTime? storedDate) {
    if (storedDate == null) return false;

    final now = DateTime.now();
    return storedDate.year == now.year &&
        storedDate.month == now.month &&
        storedDate.day == now.day;
  }

  /// Checks if location changed by more than 10km
  bool _isSignificantLocationChange(LatLng? oldLocation, LatLng newLocation) {
    if (oldLocation?.latitude == null || oldLocation?.longitude == null) {
      return false;
    }

    double distanceInMeters = Geolocator.distanceBetween(
      oldLocation!.latitude!,
      oldLocation.longitude!,
      newLocation.latitude!,
      newLocation.longitude!,
    );

    double distanceInKm = distanceInMeters / 1000;
    return distanceInKm >= significantDistanceKm;
  }

  @override
  Future<bool> isLocationChanged() async {
    PrayerEntity? localPrayer = await prayerLocalDs.getPrayer();
    if (localPrayer == null) return false;
    Position targetLocation = await determinePosition();
    return _isSignificantLocationChange(
      LatLng(localPrayer.location?.latitude, localPrayer.location?.longitude),
      LatLng(targetLocation.latitude, targetLocation.longitude),
    );
  }
}
