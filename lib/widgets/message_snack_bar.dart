import 'package:flutter/material.dart';

enum MessageType { success, error, info, warning }

void showMessage(
  BuildContext context,
  String message, {
  MessageType type = MessageType.info,
}) {
  final colorScheme = Theme.of(context).colorScheme;

  Color backgroundColor;
  IconData icon;

  switch (type) {
    case MessageType.success:
      backgroundColor = Colors.green.shade700;
      icon = Icons.check_circle_outline;
      break;
    case MessageType.error:
      backgroundColor = colorScheme.error;
      icon = Icons.error_outline;
      break;
    case MessageType.warning:
      backgroundColor = Colors.orange.shade800;
      icon = Icons.warning_amber_rounded;
      break;
    case MessageType.info:
    default:
      backgroundColor = colorScheme.secondary;
      icon = Icons.info_outline;
      break;
  }

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    ),
  );
}

// Keep the old name for compatibility but redirect to the new one
void messageSnackBar(BuildContext context, {required String message}) {
  showMessage(context, message);
}
