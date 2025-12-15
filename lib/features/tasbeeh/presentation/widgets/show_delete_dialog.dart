import 'package:flutter/material.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';

Future<dynamic> showDeleteDialog(BuildContext context, TasbeehEntity item) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(context.t.delete_tasbeeh),
      content: Text(context.t.confirm_delete_tasbeeh),
      actions: [
        TextButton(onPressed: () => context.pop(), child: Text(context.t.cancel)),
        TextButton(
          onPressed: () {
            context.pop(true);
          },
          child: Text(context.t.delete),
        ),
      ],
    ),
  );
}
