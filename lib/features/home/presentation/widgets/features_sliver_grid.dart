import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/features/home/presentation/widgets/feature_card.dart';

class FeaturesSliverGrid extends StatelessWidget {
  const FeaturesSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverMasonryGrid(
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        delegate: SliverChildListDelegate([
          FeatureCard(title: context.t.azkar, icon: Icon(Icons.book)),
          FeatureCard(title: context.t.qibla, icon: Icon(Icons.navigation_outlined)),
        ]),
      ),
    );
  }
}
