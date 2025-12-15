import 'package:rahma_project/config/cubits/navigation/navigation_cubit.dart';
import 'package:rahma_project/config/cubits/theme/theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:rahma_project/core/api/dio_factory.dart';
import 'package:rahma_project/config/cubits/translation/localization_cubit.dart';
import 'package:rahma_project/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:rahma_project/features/azkar/data/datasources/azkar_local_ds.dart';
import 'package:rahma_project/features/azkar/data/repositories/azkar_repository_implementation.dart';
import 'package:rahma_project/features/azkar/domain/repositories/azkar_repository.dart';
import 'package:rahma_project/features/prayer/data/datasources/prayer_local_ds.dart';
import 'package:rahma_project/features/prayer/data/datasources/prayer_remote_ds.dart';
import 'package:rahma_project/features/prayer/data/repositories/prayer_repository_implementation.dart';
import 'package:rahma_project/features/prayer/domain/repositories/prayer_repository.dart';
import 'package:rahma_project/features/prayer/presentation/cubit/prayer_cubit.dart';
import 'package:rahma_project/features/tasbeeh/data/datasources/tasbeeh_local_ds.dart';
import 'package:rahma_project/features/tasbeeh/data/repositories/tasbeeh_repository_implementation.dart';
import 'package:rahma_project/features/tasbeeh/domain/repositories/tasbeeh_repository.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/add_tasbeeh/add_tasbeeh_cubit.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/tasbeeh/tasbeeh_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // ignore: unused_local_variable
  final dio = await DioFactory.getDio();
  // getIt.registerLazySingleton<SocketService>(() => SocketService());

  getIt.registerSingleton<PrayerRemoteDs>(PrayerRemoteDs(dio: dio));
  getIt.registerSingleton<PrayerLocalDs>(PrayerLocalDs());
  getIt.registerSingleton<AzkarLocalDs>(AzkarLocalDs());
  getIt.registerSingleton<TasbeehLocalDs>(TasbeehLocalDs());
  getIt.registerSingleton<PrayerRepository>(
    PrayerRepositoryImplementation(prayerLocalDs: getIt<PrayerLocalDs>(), prayerRemoteDs: getIt<PrayerRemoteDs>()),
  );
  getIt.registerSingleton<AzkarRepository>(AzkarRepositoryImplementation(azkarLocalDs: getIt<AzkarLocalDs>()));
  getIt.registerSingleton<TasbeehRepository>(TasbeehRepositoryImplementation(tasbeehLocalDs: getIt<TasbeehLocalDs>()));
  getIt.registerFactory<PrayerCubit>(() => PrayerCubit(prayerRepository: getIt<PrayerRepository>()));
  getIt.registerFactory<AzkarCubit>(() => AzkarCubit(azkarRepository: getIt<AzkarRepository>()));
  getIt.registerFactory<TasbeehCubit>(() => TasbeehCubit(tasbeehRepository: getIt<TasbeehRepository>()));
  getIt.registerFactory<AddTasbeehCubit>(() => AddTasbeehCubit(tasbeehRepository: getIt<TasbeehRepository>()));
  getIt.registerFactory<NavigationCubit>(() => NavigationCubit());
  getIt.registerSingleton<ThemeCubit>(ThemeCubit());
  getIt.registerSingleton<LocaleCubit>(LocaleCubit());
}
