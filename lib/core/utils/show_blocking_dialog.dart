// import 'package:rahma_project/config/routing/app_router.dart';
// import 'package:rahma_project/core/helpers/extensions.dart';
// import 'package:rahma_project/config/routing/app_routes.dart';
// import 'package:rahma_project/generated/l10n.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void showBlockingDialog({String content = ""}) {
//   final context = navigatorKey.currentState!.overlay!.context;

//   showDialog(
//     context: context,
//     barrierDismissible: false, // ممنوع يقفل بالضغط برة
//     builder: (_) {
//       return PopScope(
//         canPop: false,
//         child: AlertDialog(
//           title: Text(S.of(context).attention),
//           content: Text(content.isEmpty == true ? S.of(context).session_expired : content),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Future.delayed(Duration(milliseconds: 100), () {
//                   SystemNavigator.pop();
//                 });
//               },
//               child: Text(S.of(context).exit_app),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 context.pushNamedAndRemoveUntil(Routes.loginScreen, predicate: (route) => false);
//               },
//               child: Text(S.of(context).login),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
