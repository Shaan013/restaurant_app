import 'package:flutter/material.dart';

/// A truly general-purpose dialog utility
Future<T?> showCustomDialog<T>(
  BuildContext context, {
  required String title,
  required Widget content,
  String? cancelLabel,
  String? confirmLabel,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  Color? confirmColor,
  bool barrierDismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return AlertDialog(
        // Uses standard theme colors, but allows primary container override
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(child: content),
        actions: [
          // Cancel Button
          TextButton(
            onPressed: () {
              if (onCancel != null) onCancel();
              Navigator.pop(context, false);
            },
            child: Text(cancelLabel ?? "Cancel"),
          ),

          // Confirm Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  confirmColor ?? Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              if (onConfirm != null) onConfirm();
              Navigator.pop(context, true);
            },
            child: Text(confirmLabel ?? "Confirm"),
          ),
        ],
      );
    },
  );
}
