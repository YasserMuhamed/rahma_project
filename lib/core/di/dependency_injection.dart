import 'package:rahma_project/config/cubits/navigation/navigation_cubit.dart';
import 'package:rahma_project/config/cubits/theme/theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:rahma_project/core/api/dio_factory.dart';
import 'package:rahma_project/config/cubits/translation/localization_cubit.dart';
import 'package:rahma_project/features/prayer/data/datasources/prayer_local_ds.dart';
import 'package:rahma_project/features/prayer/data/datasources/prayer_remote_ds.dart';
import 'package:rahma_project/features/prayer/data/repositories/prayer_repository_implementation.dart';
import 'package:rahma_project/features/prayer/domain/repositories/prayer_repository.dart';
import 'package:rahma_project/features/prayer/presentation/cubit/prayer_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // ignore: unused_local_variable
  final dio = await DioFactory.getDio();
  // getIt.registerLazySingleton<SocketService>(() => SocketService());

  getIt.registerSingleton<PrayerRemoteDs>(PrayerRemoteDs(dio: dio));
  getIt.registerSingleton<PrayerLocalDs>(PrayerLocalDs());
  getIt.registerSingleton<PrayerRepository>(
    PrayerRepositoryImplementation(prayerLocalDs: getIt<PrayerLocalDs>(), prayerRemoteDs: getIt<PrayerRemoteDs>()),
  );
  getIt.registerFactory<PrayerCubit>(() => PrayerCubit(prayerRepository: getIt<PrayerRepository>()));
  getIt.registerFactory<NavigationCubit>(() => NavigationCubit());
  getIt.registerSingleton<ThemeCubit>(ThemeCubit());
  getIt.registerSingleton<LocaleCubit>(LocaleCubit());
}
