import 'package:flutter/material.dart';
import 'package:rahma_project/config/routing/app_routes.dart';
import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:rahma_project/core/helpers/extensions.dart';

class AzkarCategoryCard extends StatelessWidget {
  const AzkarCategoryCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(Routes.azkarDetailsScreen, extra: title),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Theme.of(context).primaryColor),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(title, style: AppTextStyles.w600_16().copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
