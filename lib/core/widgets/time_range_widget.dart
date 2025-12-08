// import 'package:flutter/material.dart';
// import 'package:rahma_project/config/theming/app_colors.dart';
// import 'package:rahma_project/config/theming/app_text_styles.dart';

// class TimeRangeWidget extends StatelessWidget {
//   const TimeRangeWidget({super.key, required this.startTime, this.endTime});
//   final String startTime;
//   final String? endTime;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       spacing: 4,
//       children: [
//         Icon(Icons.access_time_outlined, color: AppColors.black300),
//         Text(startTime, style: AppTextStyles.w500_14().copyWith(color: AppColors.black300)),
//         endTime == null ? const SizedBox.shrink() : Text('- $endTime', style: AppTextStyles.w500_14().copyWith(color: AppColors.black300)),
//       ],
//     );
//   }
// }
