import 'package:flutter/material.dart';
import 'package:rahma_project/config/theming/app_colors.dart';

class Neumorphism extends StatelessWidget {
  const Neumorphism({
    super.key,
    required this.child,
    this.distance = 30,
    this.blur = 50,
    this.padding,
    this.margin,
    this.isReverse = false,
    this.innerShadow = false,
    this.outerShadow = true,
  });
  final Widget child;
  final double distance;
  final double blur;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool isReverse;
  final bool innerShadow;
  final bool outerShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
        boxShadow: outerShadow
            ? isReverse
                  ? [
                      // Dark shadow
                      BoxShadow(color: AppColors.pineNeedle.withOpacity(.5), offset: Offset(-distance, -distance), blurRadius: blur),
                      // Light highlight
                      BoxShadow(color: AppColors.badgeBlue.withOpacity(.4), offset: Offset(distance, distance), blurRadius: blur),
                    ]
                  : [
                      // Light highlight
                      BoxShadow(color: AppColors.badgeBlue.withOpacity(.4), offset: Offset(-distance, -distance), blurRadius: blur),
                      // Dark shadow
                      BoxShadow(color: AppColors.pineNeedle.withOpacity(.5), offset: Offset(distance, distance), blurRadius: blur),
                    ]
            : null,
      ),
      child: innerShadow ? TopGradientBox(child: child) : child,
    );
  }
}

class TopGradientBox extends StatelessWidget {
  const TopGradientBox({super.key, required this.child, this.padding, this.margin});

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.hunterGreen.withOpacity(.8), AppColors.vibrantEmerald.withOpacity(.4)],
        ),
      ),
      child: child,
    );
  }
}
