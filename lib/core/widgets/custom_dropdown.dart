// import 'package:flutter/material.dart';
// import 'package:rahma_project/config/theming/app_colors.dart';
// import 'package:rahma_project/config/theming/app_text_styles.dart';

// class CustomDropdown<T> extends StatelessWidget {
//   final String label;
//   final T? value;
//   final List<T> items;
//   final ValueChanged<T?>? onChanged;
//   final String? Function(T?)? validator;
//   final String Function(T)? itemDisplayText;

//   const CustomDropdown({
//     super.key,
//     required this.label,
//     required this.items,
//     this.value,
//     this.onChanged,
//     this.validator,
//     this.itemDisplayText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<T>(
//       value: value,
//       onChanged: onChanged,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: AppTextStyles.w600_14().copyWith(color: AppColors.black300),
//         border: const OutlineInputBorder(),
//         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
//         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.lightGray500)),
//       ),
//       items: items.map((item) {
//         return DropdownMenuItem<T>(value: item, child: Text(itemDisplayText?.call(item) ?? item.toString()));
//       }).toList(),

//       validator: validator,
//     );
//   }
// }
