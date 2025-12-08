// import 'package:rahma_project/config/theming/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rahma_project/config/theming/app_text_styles.dart';
// import 'package:rahma_project/generated/l10n.dart';

// class RetryErrorWidget extends StatelessWidget {
//   const RetryErrorWidget({
//     super.key,
//     required this.errorMessage,
//     this.onRetryPressed,
//     this.textColor = AppColors.black300,
//     this.buttonColor = AppColors.background,
//     this.buttonTextColor = AppColors.primary,
//   });

//   final Color textColor;
//   final Color buttonColor;
//   final Color buttonTextColor;
//   final String errorMessage;
//   final VoidCallback? onRetryPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(),
//           Text(
//             errorMessage,
//             textAlign: TextAlign.center,
//             style: AppTextStyles.w400_16().copyWith(color: textColor),
//           ),
//           8.verticalSpace,
//           ElevatedButton(
//             onPressed: onRetryPressed,
//             style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
//             child: Text(S.of(context).try_again, style: AppTextStyles.w500_16().copyWith(color: buttonTextColor)),
//           ),
//         ],
//       ),
//     );
//   }
// }
