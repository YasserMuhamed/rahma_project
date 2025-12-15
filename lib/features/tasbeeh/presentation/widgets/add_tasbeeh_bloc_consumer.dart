import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/core/utils/app_snack_bar.dart';
import 'package:rahma_project/core/widgets/custom_button.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/add_tasbeeh/add_tasbeeh_cubit.dart';

class AddTasbeehBlocConsumer extends StatelessWidget {
  const AddTasbeehBlocConsumer({
    super.key,
    required this.formKey,
    required this.tasbeehController,
    required this.onValidationModeChanged,
    required this.descriptionController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController tasbeehController;
  final TextEditingController descriptionController;
  final VoidCallback onValidationModeChanged;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTasbeehCubit, AddTasbeehState>(
      listener: (context, state) {
        if (state is AddTasbeehSuccess) {
          context.pop(true);
        }
        if (state is AddTasbeehFailure) {
          context.pop();
          AppSnackbar.show(context: context, message: state.error, type: SnackbarType.error);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is AddTasbeehLoading,
          onPressed: state is! AddTasbeehLoading
              ? () {
                  if (formKey.currentState!.validate()) {
                    context.read<AddTasbeehCubit>().createTasbeeh(content: tasbeehController.text, description: descriptionController.text);
                  } else {
                    onValidationModeChanged();
                  }
                }
              : null,
          buttonText: "إضافة",
        );
      },
    );
  }
}
