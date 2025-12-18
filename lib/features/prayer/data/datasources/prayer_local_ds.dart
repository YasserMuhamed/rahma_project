import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:rahma_project/core/helpers/hive_keys.dart';

import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';

class PrayerLocalDs {
  static const String _currentPrayerKey = 'current_prayer';

  Future<PrayerEntity?> getPrayer() async {
    try {
      var box = Hive.box<PrayerEntity>(HiveKeys.dailyPrayers);
      return box.get(_currentPrayerKey);
    } catch (e) {
      Logger().e("Failed to get prayer from local database: $e");
      return null;
    }
  }

  Future<void> savePrayerLocally(PrayerEntity prayer) async {
    try {
      var box = Hive.box<PrayerEntity>(HiveKeys.dailyPrayers);
      await box.put(_currentPrayerKey, prayer);
      Logger().i("Prayer times saved to local database");
    } catch (e) {
      Logger().e("Failed to save prayer to local database: $e");
      rethrow;
    }
  }

  Future<void> clearPrayers() async {
    try {
      var box = Hive.box<PrayerEntity>(HiveKeys.dailyPrayers);
      await box.clear();
      Logger().i("Prayer cache cleared");
    } catch (e) {
      Logger().e("Failed to clear prayer cache: $e");
    }
  }
}
