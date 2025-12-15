import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:rahma_project/core/di/dependency_injection.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/core/widgets/app_text_form_field.dart';
import 'package:rahma_project/core/widgets/drag_widget.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/add_tasbeeh/add_tasbeeh_cubit.dart';
import 'package:rahma_project/features/tasbeeh/presentation/widgets/add_tasbeeh_bloc_consumer.dart';

class AddTasbeehForm extends StatefulWidget {
  const AddTasbeehForm({super.key});

  @override
  State<AddTasbeehForm> createState() => _AddTasbeehFormState();
}

class _AddTasbeehFormState extends State<AddTasbeehForm> {
  final TextEditingController tasbeehController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    tasbeehController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: BlocProvider(
        create: (context) => getIt<AddTasbeehCubit>(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.pineNeedle,

            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: .start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: .start,
              children: [
                Center(child: DragWidget()),
                const SizedBox(height: 16),

                Center(
                  child: Text(context.t.add_tasbehah, style: AppTextStyles.w600_20(), textAlign: TextAlign.center),
                ),

                const SizedBox(height: 32),

                Text(context.t.tasbehah, style: AppTextStyles.w500_18()),
                const SizedBox(height: 8),
                AppTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى كتابة التسبيحة';
                    }
                    return null;
                  },
                  controller: tasbeehController,
                  maxLines: 2,
                  hintText: context.t.enter_tasbehah_hint,
                ),

                const SizedBox(height: 16),

                Text(context.t.description, style: AppTextStyles.w500_18()),
                const SizedBox(height: 8),

                AppTextFormField(controller: descriptionController, maxLines: 3, hintText: context.t.enter_tasbehah_description),

                const SizedBox(height: 24),

                AddTasbeehBlocConsumer(
                  formKey: formKey,
                  tasbeehController: tasbeehController,
                  descriptionController: descriptionController,
                  onValidationModeChanged: () {
                    setState(() {
                      autovalidateMode = AutovalidateMode.onUserInteraction;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
