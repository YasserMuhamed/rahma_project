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
    GoRoute(path: '/:path(.*)', builder: (context, state) => const NotFound()),
  ],
);
