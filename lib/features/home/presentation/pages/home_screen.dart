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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: () {
            HapticFeedback.lightImpact();
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
    );
  }
}
