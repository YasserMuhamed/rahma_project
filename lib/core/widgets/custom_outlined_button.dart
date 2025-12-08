import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:rahma_project/generated/l10n.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        minimumSize: Size(double.infinity, 0),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 26),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(64.r),
        ),
        side: BorderSide(color: Theme.of(context).primaryColor),
      ),
      child: Text(
        S.of(context).previous,
        style: AppTextStyles.w600_18().copyWith(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
