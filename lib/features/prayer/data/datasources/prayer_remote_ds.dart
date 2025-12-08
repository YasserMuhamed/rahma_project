import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:rahma_project/core/helpers/hive_keys.dart';
import 'package:rahma_project/core/helpers/latlng.dart';
import 'package:rahma_project/features/prayer/data/models/daily_prayer_response/daily_prayer_response.dart';
import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';

class PrayerRemoteDs {
  final Dio dio;

  PrayerRemoteDs({required this.dio});

  Future<PrayerEntity> getPrayer(LatLng location) async {
    final now = DateTime.now();
    final dateString = DateFormat('dd-MM-yyyy', 'en_US').format(now);
    final result = await dio.get(
      "https://api.aladhan.com/v1/timings/$dateString",
      queryParameters: {'latitude': location.latitude, 'longitude': location.longitude, 'method': 5},
    );

    PrayerEntity prayer = DailyPrayerResponse.fromJson(result.data);
    await _savePrayerLocally(prayer);

    return prayer;
  }

  Future<void> _savePrayerLocally(PrayerEntity prayer) async {
    try {
      var box = Hive.box<PrayerEntity>(HiveKeys.dailyPrayers);
      await box.add(prayer);
      Logger().i("Prayer times saved to local database");
    } catch (e) {
      Logger().e("Failed to save prayer to local database: $e");
    }
  }
}
