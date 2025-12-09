import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rahma_project/core/di/dependency_injection.dart';
import 'package:rahma_project/core/observer/bloc_observer.dart';
import 'package:rahma_project/features/azkar/domain/entities/azkar_entity.dart';
import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';
import 'package:rahma_project/rahma_app.dart';
import 'package:rahma_project/core/helpers/hive_keys.dart';
import 'package:rahma_project/core/services/workmanager/workmanager.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PrayerEntityAdapter());
  Hive.registerAdapter(PrayerTimingsAdapter());
  Hive.registerAdapter(PrayerDateAdapter());
  Hive.registerAdapter(PrayerLocationAdapter());
  Hive.registerAdapter(AzkarEntityAdapter());
  await Hive.openBox<PrayerEntity>(HiveKeys.dailyPrayers);
  await Hive.openBox<String>(HiveKeys.azkarCategories);
  await Hive.openBox(HiveKeys.azkar);

  await Workmanager().initialize(callbackDispatcher);

  await Future.wait<void>([ScreenUtil.ensureScreenSize(), setupGetIt()]);

  Bloc.observer = MyBlocObserver();
  runApp(const RahmaApp());
}
