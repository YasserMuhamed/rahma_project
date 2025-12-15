import 'package:flutter/material.dart';

enum SnackbarType { success, error, warning, info }

class AppSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    String? title,
    SnackbarType type = SnackbarType.info,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: duration,
      content: _SnackbarBody(title: title, message: message, type: type, actionLabel: actionLabel, onActionPressed: onActionPressed),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class _SnackbarBody extends StatelessWidget {
  final String? title;
  final String message;
  final SnackbarType type;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  const _SnackbarBody({this.title, required this.message, required this.type, this.actionLabel, this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    final config = _SnackbarConfig.fromType(type);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: config.backgroundColor.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          Icon(config.icon, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null && title!.isNotEmpty)
                  Text(
                    title!,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                Text(message, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          if (actionLabel != null && onActionPressed != null)
            TextButton(
              onPressed: onActionPressed,
              child: Text(actionLabel!, style: const TextStyle(color: Colors.white)),
            ),
        ],
      ),
    );
  }
}

class _SnackbarConfig {
  final Color backgroundColor;
  final IconData icon;

  _SnackbarConfig({required this.backgroundColor, required this.icon});

  static _SnackbarConfig fromType(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return _SnackbarConfig(backgroundColor: const Color.fromARGB(255, 61, 90, 62), icon: Icons.check_circle);
      case SnackbarType.error:
        return _SnackbarConfig(backgroundColor: const Color.fromARGB(255, 133, 40, 33), icon: Icons.error);
      case SnackbarType.warning:
        return _SnackbarConfig(backgroundColor: const Color.fromARGB(255, 166, 134, 83), icon: Icons.warning);
      case SnackbarType.info:
        return _SnackbarConfig(backgroundColor: const Color.fromARGB(255, 77, 94, 108), icon: Icons.info);
    }
  }
}
