// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:flutter/material.dart';

// enum SnackbarType { success, failure, help, warning }

// void showCustomSnackbar({
//   required BuildContext context,
//   required String message,
//   String title = "",
//   SnackbarType type = SnackbarType.help,
// }) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: AwesomeSnackbarContent(
//         title: title,
//         message: message,
//         contentType: _getContentType(type),
//       ),
//       behavior: SnackBarBehavior.floating,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//     ),
//   );
// }

// /// Maps SnackbarType to AwesomeSnackbarContent's ContentType
// ContentType _getContentType(SnackbarType type) {
//   switch (type) {
//     case SnackbarType.success:
//       return ContentType.success;
//     case SnackbarType.failure:
//       return ContentType.failure;
//     case SnackbarType.help:
//       return ContentType.help;
//     case SnackbarType.warning:
//       return ContentType.warning;
//   }
// }
