// import 'package:flutter/material.dart';
// import 'package:rahma_project/config/theming/app_colors.dart';
// import 'package:rahma_project/config/theming/app_text_styles.dart';

// class SecondaryDropdown<T> extends StatelessWidget {
//   final String label;
//   final T? value;
//   final List<DropdownMenuItem<T>>? items;
//   final Function(T?)? onChanged;
//   final String? Function(T?)? validator;
//   final String Function(T)? itemDisplayText;
//   final List<Widget> Function(BuildContext)? selectedItemBuilder;
//   final Widget? icon;

//   const SecondaryDropdown({
//     super.key,
//     required this.label,
//     required this.items,
//     this.value,
//     this.onChanged,
//     this.validator,
//     this.itemDisplayText,
//     this.selectedItemBuilder,
//     this.icon = const Icon(Icons.arrow_drop_down),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<T>(
//       icon: icon,
//       value: value,
//       onChanged: onChanged,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: AppTextStyles.w600_14().copyWith(color: AppColors.black300),
//         border: const OutlineInputBorder(),
//         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
//         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.lightGray500)),
//       ),
//       items: items,
//       selectedItemBuilder: selectedItemBuilder,
//       validator: validator,
//     );
//   }
// }
