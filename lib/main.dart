import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahma_project/core/di/dependency_injection.dart';
import 'package:rahma_project/core/observer/bloc_observer.dart';
import 'package:rahma_project/core/services/hive/hive_setup.dart';
import 'package:rahma_project/rahma_app.dart';
import 'package:rahma_project/core/services/workmanager/workmanager.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait<void>([initHive(), ScreenUtil.ensureScreenSize(), setupGetIt()]);
  await Workmanager().initialize(callbackDispatcher);
  Bloc.observer = MyBlocObserver();
  runApp(const RahmaApp());
}
