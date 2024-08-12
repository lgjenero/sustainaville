import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_bubble.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';

class MessageDialog extends StatelessWidget {
  final String message;

  const MessageDialog({super.key, required this.message});

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
                  Expanded(child: SingleChildScrollView(child: Text(message, style: const TextStyle(fontSize: 24)))),
                  const SizedBox(height: 12),
                  AppButton.text(
                    'Close',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  static Future<void> show(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (context) => MessageDialog(message: message),
    );
  }
}
