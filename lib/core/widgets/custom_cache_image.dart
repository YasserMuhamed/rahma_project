// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:rahma_project/config/theming/app_colors.dart';
// import 'package:flutter/material.dart';

// class CustomCacheImage extends StatelessWidget {
//   const CustomCacheImage({
//     super.key,
//     required this.iconUrl,
//     this.width = 40,
//     this.height = 40,
//     this.errorWidget,
//   });

//   final String? iconUrl;
//   final double? width;
//   final double? height;
//   final Widget? errorWidget;

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: iconUrl ?? '',
//       width: width,
//       height: height,
//       fit: BoxFit.fill,
//       progressIndicatorBuilder: (context, url, progress) =>
//           CircularProgressIndicator.adaptive(
//             value: progress.progress,
//             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//             backgroundColor: AppColors.lightGray100,
//             strokeWidth: 2,
//           ),
//       fadeOutDuration: Duration(milliseconds: 500),
//       errorWidget: (context, url, error) =>
//           errorWidget ?? const Icon(Icons.error_outline_rounded),
//     );
//   }
// }
