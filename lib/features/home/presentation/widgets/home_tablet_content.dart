import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:rahma_project/config/routing/app_routes.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/features/home/presentation/widgets/feature_card.dart';
import 'package:rahma_project/features/prayer/presentation/widgets/home_prayer_consumer.dart';

class HomeTabletContent extends StatelessWidget {
  const HomeTabletContent({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget featureCards = SizedBox(
      height: 400,
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final List<Widget> cards = [
            FeatureCard(
              title: context.t.azkar,
              icon: Icon(Icons.book),
              onTap: () => GoRouter.of(context).push(Routes.azkarCategoriesScreen),
            ),
            FeatureCard(
              title: context.t.qibla,
              icon: Icon(Icons.navigation_outlined),
              onTap: () => GoRouter.of(context).push(Routes.quiblaScreen),
            ),
            // FeatureCard(title: context.t.prayer_times, icon: Icon(Icons.watch_later_outlined)),
            FeatureCard(
              title: context.t.tasabeeh,
              icon: Icon(Icons.checklist_rtl_rounded),
              onTap: () => GoRouter.of(context).push(Routes.tasabeehScreen),
            ),
            FeatureCard(title: context.t.quraan, icon: Icon(Icons.menu_book_rounded)),
          ];
          return cards[index];
        },
      ),
    );

    // 2. Build the Row layout
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side: Features Grid
            Expanded(flex: 6, child: const HomePrayersConsumer()),
            const SizedBox(width: 16),
            Expanded(flex: 4, child: featureCards),
            // Right side: Prayer Consumer (Orange Box)
          ],
        ),
      ),
    );
  }
}
