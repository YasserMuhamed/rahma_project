import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rahma_project/features/home/presentation/widgets/home_mobile_content.dart';
import 'package:rahma_project/features/home/presentation/widgets/home_tablet_content.dart';
import 'package:rahma_project/features/prayer/presentation/cubit/prayer_cubit.dart';
import 'package:rahma_project/features/home/presentation/widgets/home_sliver_app_bar.dart';
import 'package:rahma_project/core/services/workmanager/schedule_midnight_fetch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    scheduleMidnightFetch();
    super.initState();
  }

  bool _hasVibrated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator(); // Optional: removes glow effect
            return false;
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels <= notification.metrics.minScrollExtent - 80) {
                if (!_hasVibrated) {
                  HapticFeedback.heavyImpact();
                  setState(() => _hasVibrated = true);
                }
              } else if (notification.metrics.pixels > notification.metrics.minScrollExtent - 50) {
                setState(() => _hasVibrated = false);
              }
              return false;
            },
            child: RefreshIndicator.adaptive(
              onRefresh: () {
                return context.read<PrayerCubit>().refresh();
              },
              // 💡 FIX 1: CustomScrollView is now the main layout widget
              child: CustomScrollView(
                slivers: [
                  const HomeSliverAppBar(),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverLayoutBuilder(
                    builder: (context, constraints) {
                      final bool isTabletLayout = constraints.crossAxisExtent > 768;
                      if (isTabletLayout) {
                        return HomeTabletContent();
                      } else {
                        return HomeMobileContent();
                      }
                    },
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
