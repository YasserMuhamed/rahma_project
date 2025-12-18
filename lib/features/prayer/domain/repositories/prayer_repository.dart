import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rahma_project/core/error/failure.dart';
import 'package:rahma_project/core/helpers/latlng.dart';
import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';

abstract class PrayerRepository {
  /// Get prayer from local storage (cache)
  Future<Either<Failure, PrayerEntity?>> getLocalPrayer();

  /// Get prayer from remote API with specific location
  Future<Either<Failure, PrayerEntity>> getRemotePrayer(LatLng location);

  /// Get current device location
  Future<Either<Failure, Position>> getCurrentLocation();

  /// Save prayer to local storage
  Future<Either<Failure, void>> savePrayerLocally(PrayerEntity prayer);

  /// Check if location has changed significantly
  Future<bool> hasLocationChanged(LatLng oldLocation, LatLng newLocation);
}
