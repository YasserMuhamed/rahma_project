import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/core/utils/app_snack_bar.dart';
import 'package:rahma_project/core/widgets/app_text_form_field.dart';
import 'package:rahma_project/core/widgets/drag_widget.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/delete_tasbeeh/delete_tasbeeh_cubit.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/tasbeeh/tasbeeh_cubit.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/update_tasbeeh/update_tasbeeh_cubit.dart';
import 'package:rahma_project/features/tasbeeh/presentation/widgets/show_delete_dialog.dart';
import 'package:rahma_project/features/tasbeeh/presentation/widgets/tasbeeh_card.dart';
import 'package:rahma_project/features/tasbeeh/presentation/widgets/update_tasbeeh_bloc_consumer.dart';

import '../../../../core/di/dependency_injection.dart';

class TasbeehCardTile extends StatelessWidget {
  const TasbeehCardTile({super.key, required this.item});
  final TasbeehEntity item;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteTasbeehCubit, DeleteTasbeehState>(
      listener: (context, state) {
        if (state is DeleteTasbeehSuccess) {
          AppSnackbar.show(context: context, message: context.t.tasbeeh_deleted, type: SnackbarType.success);
          context.read<TasbeehCubit>().getTasbeeh();
        }
        if (state is DeleteTasbeehFailure) {
          AppSnackbar.show(context: context, message: state.error, type: SnackbarType.error);
        }
      },
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) async {
                final bool? shouldDelete = await showDeleteDialog(context, item);
                if ((shouldDelete ?? false) && context.mounted) {
                  context.read<DeleteTasbeehCubit>().deleteTasbeeh(item: item);
                }
              },
              backgroundColor: AppColors.pineNeedle,
              icon: Icons.delete,
              label: context.t.delete,
              foregroundColor: Colors.red.shade400,
              borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
            ),
            SlidableAction(
              onPressed: (_) async {
                final bool? shouldUpdate = await showUpdateDialog(context, item);
                if ((shouldUpdate ?? false) && context.mounted) {
                  context.read<TasbeehCubit>().getTasbeeh();
                }
              },
              backgroundColor: AppColors.pineNeedle,
              icon: Icons.edit,
              label: context.t.edit,
              foregroundColor: Colors.grey.shade500,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
            ),
          ],
        ),
        child: TasbeehCard(item: item),
      ),
    );
  }
}

Future<dynamic> showUpdateDialog(BuildContext context, TasbeehEntity item) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    builder: (modalContext) => Padding(
      padding: MediaQuery.of(modalContext).viewInsets,
      child: UpdateTasbeehForm(item: item),
    ),
  );
}

class UpdateTasbeehForm extends StatefulWidget {
  const UpdateTasbeehForm({super.key, required this.item});
  final TasbeehEntity item;

  @override
  State<UpdateTasbeehForm> createState() => _UpdateTasbeehFormState();
}

class _UpdateTasbeehFormState extends State<UpdateTasbeehForm> {
  final TextEditingController tasbeehController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  initState() {
    tasbeehController.text = widget.item.content;
    descriptionController.text = widget.item.description;
    super.initState();
  }

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
        create: (context) => getIt<UpdateTasbeehCubit>(),
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

                UpdateTasbeehBlocConsumer(
                  formKey: formKey,
                  id: widget.item.id,
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
