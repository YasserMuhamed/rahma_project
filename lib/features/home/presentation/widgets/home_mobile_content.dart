import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahma_project/features/home/presentation/widgets/features_sliver_grid.dart';
import 'package:rahma_project/features/prayer/presentation/widgets/home_prayer_consumer.dart';

class HomeMobileContent extends StatelessWidget {
  const HomeMobileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(delegate: SliverChildListDelegate([HomePrayersConsumer(), 16.verticalSpace, const FeaturesSliverGrid()])),
    );
  }
}
