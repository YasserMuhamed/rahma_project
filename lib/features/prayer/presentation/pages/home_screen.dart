import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:rahma_project/features/prayer/presentation/cubit/prayer_cubit.dart';
import 'package:rahma_project/features/prayer/presentation/widgets/home_prayer_consumer.dart';
import 'package:rahma_project/features/prayer/presentation/widgets/home_sliver_app_bar.dart';
import 'package:rahma_project/core/services/workmanager/schedule_midnight_fetch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
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
          child: CustomScrollView(
            slivers: [
              HomeSliverAppBar(),
              SliverToBoxAdapter(child: HomePrayersConsumer()),
              SliverGrid(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), delegate: SliverChildListDelegate([])),
            ],
          ),
        ),
      ),
    );
  }
}
