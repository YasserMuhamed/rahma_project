import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/config/routing/app_routes.dart';
import 'package:rahma_project/config/routing/not_found.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rahma_project/core/di/dependency_injection.dart';
import 'package:rahma_project/features/azkar/presentation/pages/azkar_categories_screen.dart';
import 'package:rahma_project/features/azkar/presentation/pages/azkar_category_details_screen.dart';
import 'package:rahma_project/features/prayer/presentation/cubit/prayer_cubit.dart';
import 'package:rahma_project/features/home/presentation/pages/home_screen.dart';
import 'package:rahma_project/features/quibla/presentation/pages/quibla_screen.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/add_tasbeeh/add_tasbeeh_cubit.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/delete_tasbeeh/delete_tasbeeh_cubit.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/tasbeeh/tasbeeh_cubit.dart';
import 'package:rahma_project/features/tasbeeh/presentation/pages/tasbeeh_details_screen.dart';
import 'package:rahma_project/features/tasbeeh/presentation/pages/tasbeeh_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.homeScreen,

  routes: [
    GoRoute(
      path: Routes.homeScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<PrayerCubit>()
          ..loadPrayersWithUserLocation()
          ..isLocationChanged(),
        child: const HomeScreen(),
      ),
    ),
    GoRoute(path: Routes.azkarCategoriesScreen, builder: (context, state) => const AzkarCategoriesScreen()),
    GoRoute(
      path: Routes.azkarDetailsScreen,
      builder: (context, state) => AzkarCategoryDetailsScreen(category: state.extra as String),
    ),
    GoRoute(path: Routes.quiblaScreen, builder: (context, state) => const QuiblaScreen()),
    GoRoute(
      path: Routes.tasbeehDetailsScreen,
      builder: (context, state) => TasbeehDetailsScreen(item: state.extra as TasbeehEntity),
    ),
    GoRoute(
      path: Routes.tasabeehScreen,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<TasbeehCubit>()..getTasbeeh()),
          BlocProvider(create: (context) => getIt<AddTasbeehCubit>()),
          BlocProvider(create: (context) => getIt<DeleteTasbeehCubit>()),
        ],
        child: const TasbeehScreen(),
      ),
    ),
    GoRoute(path: '/:path(.*)', builder: (context, state) => const NotFound()),
  ],
);
