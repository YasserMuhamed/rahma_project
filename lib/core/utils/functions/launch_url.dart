// import 'package:logger/logger.dart';
// import 'package:url_launcher/url_launcher.dart';

// Future<void> launchUrlHelper({
//   required String url,
//   bool? isPhone,
//   bool? isEmail,
// }) async {
//   if (isPhone == true) {
//     url = 'tel:$url';
//   }
//   if (isEmail == true) {
//     url = 'mailto:$url';
//   }
//   final Uri uri = Uri.parse(url);
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri, mode: LaunchMode.externalApplication);
//     Logger().d('Launched $url');
//   } else {
//     Logger().e('⛔ Could not launch ${uri.toString()}');
//   }
// }
