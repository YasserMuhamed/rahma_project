// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rahma_project/config/theming/app_colors.dart';
// import 'package:rahma_project/config/theming/app_text_styles.dart';

// class CustomHorizontalStepper extends StatefulWidget {
//   const CustomHorizontalStepper({
//     super.key,
//     required this.steps,
//     required this.currentStep,
//     this.activeColor,
//     this.inactiveColor,
//     this.completedColor,
//   });

//   final List<StepperItem> steps;
//   final int currentStep;
//   final Color? activeColor;
//   final Color? inactiveColor;
//   final Color? completedColor;

//   @override
//   State<CustomHorizontalStepper> createState() => _CustomHorizontalStepperState();
// }

// class _CustomHorizontalStepperState extends State<CustomHorizontalStepper> with TickerProviderStateMixin {
//   late AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
//     _animationController.forward();
//   }

//   @override
//   void didUpdateWidget(CustomHorizontalStepper oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.currentStep != widget.currentStep) {
//       _animationController.reset();
//       _animationController.forward();
//     }
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final activeStepColor = widget.activeColor ?? AppColors.orange200;
//     final inactiveStepColor = widget.inactiveColor ?? AppColors.lightGray100;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Stepper row
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               // Connector lines (behind circles)
//               Positioned(
//                 child: Row(
//                   children: List.generate(widget.steps.length - 1, (index) {
//                     return Expanded(
//                       child: AnimatedContainer(
//                         duration: const Duration(milliseconds: 300),
//                         height: 4.h,
//                         margin: EdgeInsets.symmetric(horizontal: 20.w),
//                         color: index < widget.currentStep ? activeStepColor : inactiveStepColor,
//                       ),
//                     );
//                   }),
//                 ),
//               ),
//               // Circles (on top of lines)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ...List.generate(widget.steps.length, (index) {
//                     final isActive = index == widget.currentStep;
//                     final isCompleted = index < widget.currentStep;

//                     Color stepColor;
//                     if (isCompleted || isActive) {
//                       stepColor = activeStepColor;
//                     } else {
//                       stepColor = inactiveStepColor;
//                     }

//                     return AnimatedContainer(
//                       duration: const Duration(milliseconds: 300),
//                       width: 40.w,
//                       height: 40.h,
//                       decoration: BoxDecoration(shape: BoxShape.circle, color: stepColor),
//                       child: isActive || isCompleted
//                           ? Center(
//                               child: AnimatedDefaultTextStyle(
//                                 duration: const Duration(milliseconds: 300),
//                                 style: AppTextStyles.w600_16().copyWith(color: AppColors.orange600),
//                                 child: Text('${index + 1}'),
//                               ),
//                             )
//                           : null,
//                     );
//                   }),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 12.h),
//         // Animated Step title
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: List.generate(widget.steps.length, (index) {
//               final isActive = index == widget.currentStep;

//               return Flexible(
//                 child: AnimatedOpacity(
//                   duration: const Duration(milliseconds: 300),
//                   opacity: isActive ? 1.0 : 0.0,
//                   child: widget.steps[index].title != null
//                       ? FittedBox(
//                           child: Text(
//                             widget.steps[index].title!,
//                             style: AppTextStyles.w500_14().copyWith(color: AppColors.black300),
//                             textAlign: TextAlign.center,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         )
//                       : const SizedBox.shrink(),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class StepperItem {
//   final String? title;
//   final Widget content;

//   const StepperItem({this.title, required this.content});
// }
