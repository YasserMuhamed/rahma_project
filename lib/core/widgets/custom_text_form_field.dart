// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rahma_project/config/theming/app_colors.dart';
// import 'package:rahma_project/config/theming/app_text_styles.dart';

// class CustomTextFormField extends StatefulWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.label,
//     this.keyboardType,
//     this.isPassword = false,
//     this.controller,
//     this.validator,
//     this.suffixIcon,
//   });
//   final String label;
//   final Widget? suffixIcon;
//   final TextInputType? keyboardType;
//   final bool isPassword;
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;

//   @override
//   State<CustomTextFormField> createState() => _CustomTextFormFieldState();
// }

// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   late bool _obscureText;

//   @override
//   void initState() {
//     super.initState();
//     _obscureText = widget.isPassword;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: widget.validator,
//       controller: widget.controller,
//       keyboardType: widget.keyboardType,
//       obscureText: widget.isPassword ? _obscureText : false,
//       decoration: InputDecoration(
//         suffixIcon: widget.isPassword
//             ? IconButton(
//                 onPressed: () {
//                   setState(() {
//                     _obscureText = !_obscureText;
//                   });
//                 },
//                 icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: AppColors.black300, size: 24.sp),
//               )
//             : widget.suffixIcon,
//         labelText: widget.label,
//         labelStyle: AppTextStyles.w600_14().copyWith(color: AppColors.black300),
//         border: const OutlineInputBorder(),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Theme.of(context).primaryColor),
//           borderRadius: BorderRadius.circular(8.r),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.lightGray500),
//           borderRadius: BorderRadius.circular(8.r),
//         ),
//       ),
//     );
//   }
// }
