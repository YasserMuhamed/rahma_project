import 'package:hive/hive.dart';
import 'package:rahma_project/core/helpers/hive_keys.dart';

import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';

class PrayerLocalDs {
  Future<PrayerEntity?> getPrayer() async {
    var box = Hive.box<PrayerEntity>(HiveKeys.dailyPrayers);

    if (box.isEmpty) return null;

    return box.get(box.keys.last);
  }
}
