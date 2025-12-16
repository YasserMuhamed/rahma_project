import 'package:hive_flutter/adapters.dart';
import 'package:rahma_project/core/helpers/hive_keys.dart';
import 'package:rahma_project/features/azkar/domain/entities/azkar_entity.dart';
import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  // Adapters
  Hive.registerAdapter(PrayerEntityAdapter());
  Hive.registerAdapter(PrayerTimingsAdapter());
  Hive.registerAdapter(PrayerDateAdapter());
  Hive.registerAdapter(PrayerLocationAdapter());
  Hive.registerAdapter(AzkarEntityAdapter());
  Hive.registerAdapter(TasbeehEntityAdapter());

  // Boxes
  await Hive.openBox<PrayerEntity>(HiveKeys.dailyPrayers);
  await Hive.openBox<String>(HiveKeys.azkarCategories);
  await Hive.openBox(HiveKeys.azkar);
  await Hive.openBox(HiveKeys.tasabeeh);
}
