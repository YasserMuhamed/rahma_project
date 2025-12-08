import 'package:dartz/dartz.dart';
import 'package:rahma_project/core/error/failure.dart';
import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';

abstract class PrayerRepository {
  Future<Either<Failure, PrayerEntity>> getDailyPrayer({bool forceRefresh = false});

  Future<bool> isLocationChanged();
}
