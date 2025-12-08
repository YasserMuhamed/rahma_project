import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar backAppBar(
  BuildContext context,
  String title, {
  Color? backgroundColor,
  Color? foregroundColor,
  List<Widget>? actions,
}) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: backgroundColor,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new, color: foregroundColor),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text(title),
    titleTextStyle: AppTextStyles.w600_20().copyWith(color: foregroundColor),
    actions: actions,
  );
}
