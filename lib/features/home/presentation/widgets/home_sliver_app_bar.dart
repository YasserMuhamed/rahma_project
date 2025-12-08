import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/generated/l10n.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 170.h,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            centerTitle: true,
            title: Text(S.of(context).app_name, style: TextStyle(fontWeight: FontWeight.w600)),
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
                    top: -40.h,
                    right: -40.w,
                    child: Container(
                      width: 120.w,
                      height: 120.w,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.05)),
                    ),
                  ),
                  Positioned(
                    bottom: -20.h,
                    left: -20.w,
                    child: Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.08)),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 10.h,
                        bottom: 50.h, // Space for the collapsed title
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon or logo
                          Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(14.r),
                              border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1.5.w),
                            ),
                            child: Icon(Icons.mosque_outlined, color: Colors.white, size: 32.sp),
                          ),

                          // App name (only shows when expanded)
                          SizedBox(height: 4.h),
                          // Subtitle
                          Text(
                            S.of(context).prayer_times,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 12.sp,
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
  }
}
