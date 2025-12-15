import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:rahma_project/config/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.width = double.infinity,
  });

  final String buttonText;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: Size(width, 0),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 26),
        backgroundColor: backgroundColor ?? AppTheme.primary(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
              width: 24,
              height: 24,
              child: Center(child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)),
            )
          : Text(
              buttonText,
              style: AppTextStyles.w600_16().copyWith(color: textColor, fontFamily: "Almarai", fontSize: 16),
            ),
    );
  }
}
