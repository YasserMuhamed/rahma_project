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

  PrayerRepositoryImplementation({required this.prayerLocalDs, required this.prayerRemoteDs});

  @override
  Future<Either<Failure, PrayerEntity?>> getLocalPrayer() async {
    try {
      final prayer = await prayerLocalDs.getPrayer();
      return Right(prayer);
    } catch (e) {
      return Left(CacheFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PrayerEntity>> getRemotePrayer(LatLng location) async {
    try {
      final prayer = await prayerRemoteDs.getPrayer(location);
      return Right(prayer);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Position>> getCurrentLocation() async {
    try {
      final position = await determinePosition();
      return Right(position);
    } catch (e) {
      return Left(LocationFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> savePrayerLocally(PrayerEntity prayer) async {
    try {
      await prayerLocalDs.savePrayerLocally(prayer);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(error: e.toString()));
    }
  }

  @override
  Future<bool> hasLocationChanged(LatLng oldLocation, LatLng newLocation) async {
    // Check if distance between locations is > threshold (e.g., 10km)
    const threshold = 10.0; // km
    final distance = _calculateDistance(oldLocation, newLocation);
    return distance > threshold;
  }

  double _calculateDistance(LatLng l1, LatLng l2) {
    // Haversine formula implementation
    // ... your distance calculation
    return 0.0; // placeholder
  }
}
