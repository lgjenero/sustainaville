import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_bubble.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';

class ConfirmationDialog extends StatelessWidget {
  final String message;
  final String cancelText;
  final String confirmText;

  const ConfirmationDialog({super.key, required this.message, this.cancelText = 'No', this.confirmText = 'Yes'});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Builder(builder: (context) {
        var width = MediaQuery.of(context).size.width;
        return SizedBox(
          width: min(600, width - 64),
          child: IntrinsicHeight(
            child: ChatBubble(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message, style: const TextStyle(fontSize: 24)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppButton.text(
                        cancelText,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      AppButton.text(
                        confirmText,
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  static Future<bool?> show(
    BuildContext context,
    String message, {
    String cancelText = 'No',
    String confirmText = 'Yes',
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ConfirmationDialog(message: message, cancelText: cancelText, confirmText: confirmText),
    );
  }
}
