import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rahma_project/core/di/dependency_injection.dart';
import 'package:rahma_project/core/observer/bloc_observer.dart';
import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';
import 'package:rahma_project/rahma_app.dart';
import 'package:rahma_project/core/helpers/hive_keys.dart';
import 'package:rahma_project/core/services/workmanager/workmanager.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  Hive.registerAdapter(PrayerEntityAdapter());
  Hive.registerAdapter(PrayerTimingsAdapter());
  Hive.registerAdapter(PrayerDateAdapter());
  Hive.registerAdapter(HijriDateAdapter());
  Hive.registerAdapter(HijriMonthAdapter());
  Hive.registerAdapter(HijriWeekdayAdapter());
  Hive.registerAdapter(GregorianDateAdapter());
  Hive.registerAdapter(GregorianMonthAdapter());
  Hive.registerAdapter(GregorianWeekdayAdapter());
  Hive.registerAdapter(PrayerLocationAdapter());
  await Hive.openBox<PrayerEntity>(HiveKeys.dailyPrayers);

  await Workmanager().initialize(callbackDispatcher);

  await Future.wait<void>([ScreenUtil.ensureScreenSize(), setupGetIt()]);

  Bloc.observer = MyBlocObserver();
  runApp(const RahmaApp());
}
