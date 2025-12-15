import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/core/utils/app_snack_bar.dart';
import 'package:rahma_project/core/widgets/custom_button.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/update_tasbeeh/update_tasbeeh_cubit.dart';

class UpdateTasbeehBlocConsumer extends StatelessWidget {
  const UpdateTasbeehBlocConsumer({
    super.key,
    required this.id,
    required this.formKey,
    required this.tasbeehController,
    required this.onValidationModeChanged,
    required this.descriptionController,
  });
  final String id;
  final GlobalKey<FormState> formKey;
  final TextEditingController tasbeehController;
  final TextEditingController descriptionController;
  final VoidCallback onValidationModeChanged;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateTasbeehCubit, UpdateTasbeehState>(
      listener: (context, state) {
        if (state is UpdateTasbeehSuccess) {
          context.pop(true);
          AppSnackbar.show(context: context, message: context.t.tasbeeh_updated, type: SnackbarType.success);
        }
        if (state is UpdateTasbeehFailure) {
          context.pop();
          AppSnackbar.show(context: context, message: state.error, type: SnackbarType.error);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is UpdateTasbeehLoading,
          onPressed: state is! UpdateTasbeehLoading
              ? () {
                  if (formKey.currentState!.validate()) {
                    context.read<UpdateTasbeehCubit>().updateTasbeeh(
                      id: id,
                      content: tasbeehController.text,
                      description: descriptionController.text,
                    );
                  } else {
                    onValidationModeChanged();
                  }
                }
              : null,
          buttonText: context.t.edit,
        );
      },
    );
  }
}
