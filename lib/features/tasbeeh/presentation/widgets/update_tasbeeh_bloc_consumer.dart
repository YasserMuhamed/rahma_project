import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/core/utils/app_snack_bar.dart';
import 'package:rahma_project/core/widgets/custom_button.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/update_tasbeeh/update_tasbeeh_cubit.dart';

class UpdateTasbeehBlocConsumer extends StatelessWidget {
  const UpdateTasbeehBlocConsumer({
    super.key,
    required this.formKey,
    required this.id,
    required this.createdAt,
    required this.tasbeehController,
    required this.onValidationModeChanged,
    required this.descriptionController,
  });
  final GlobalKey<FormState> formKey;
  final String id;
  final DateTime createdAt;
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
                    final tasbeeh = TasbeehEntity(
                      category: "تسابيح",
                      count: "0",
                      description: descriptionController.text,
                      content: tasbeehController.text,
                      id: id,
                      createdAt: createdAt,
                    );
                    context.read<UpdateTasbeehCubit>().updateTasbeeh(item: tasbeeh);
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
