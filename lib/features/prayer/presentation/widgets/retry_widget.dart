import 'package:flutter/material.dart';
import 'package:rahma_project/generated/l10n.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget({super.key, required this.message, this.onRetry});
  final String message;
  final Function? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          TextButton(onPressed: onRetry != null ? () => onRetry!() : null, child: Text(S.of(context).retry)),
        ],
      ),
    );
  }
}
