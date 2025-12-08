import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/config/theming/app_text_styles.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({super.key, required this.title, this.icon, this.onTap});
  final String title;
  final Widget? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        if (onTap != null) onTap!();
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).primaryColor,
          gradient: LinearGradient(
            colors: [AppColors.vibrantEmerald, AppColors.forestGreen],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          boxShadow: [BoxShadow(color: AppColors.vibrantEmerald.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 0))],
        ),
        child: Row(
          crossAxisAlignment: .start,
          children: [
            if (icon != null) icon!,
            8.horizontalSpace,
            Text(title, style: AppTextStyles.w500_20()),
          ],
        ),
      ),
    );
  }
}
