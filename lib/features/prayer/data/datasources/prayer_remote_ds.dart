import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
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

    return prayer.copyWith(
      location: PrayerLocation(latitude: location.latitude, longitude: location.longitude),
      date: PrayerDate(readable: dateString, timestamp: now),
    );
  }
}
