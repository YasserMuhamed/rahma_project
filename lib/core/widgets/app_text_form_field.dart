import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahma_project/config/theming/app_colors.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.label,
    this.keyboardType,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.maxLines,
    this.hintText,
  });
  final String? label;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? _obscureText : false,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: AppColors.pineNeedle,

        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.vibrantEmerald)),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: AppColors.vibrantEmerald, size: 20),
              )
            : widget.suffixIcon,
        labelText: widget.label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
