import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/generated/l10n.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        return SliverAppBar(
          pinned: true,
          expandedHeight: constraints.crossAxisExtent > 481 ? 200 : 150,
          backgroundColor: Theme.of(context).primaryColor,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return FlexibleSpaceBar(
                centerTitle: true,
                title: Text(context.t.app_name, style: TextStyle(fontWeight: FontWeight.w600)),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.vibrantEmerald, AppColors.forestGreen],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Decorative circles - responsive sizes
                      Positioned(
                        top: -40,
                        right: -40,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.05)),
                        ),
                      ),
                      Positioned(
                        bottom: -20,
                        left: -20,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.08)),
                        ),
                      ),
                      Positioned.fill(
                        child: Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10, bottom: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1.5),
                                ),
                                child: Icon(Icons.mosque_outlined, color: Colors.white, size: 32),
                              ),

                              // App name (only shows when expanded)
                              SizedBox(height: 4.h),
                              // Subtitle
                              Text(
                                S.of(context).prayer_times,
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  fontSize: 12,
                                  fontFamily: "Tajawal",
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
