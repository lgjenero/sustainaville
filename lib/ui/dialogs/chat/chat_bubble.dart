import 'package:flutter/material.dart';
import 'package:sustainaville/ui/widgets/nine_patch_container.dart';

class ChatBubble extends StatelessWidget {
  final Widget child;

  const ChatBubble({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return NinePatchContainer(
      imagePath: 'assets/images/ui/chat_bubble.9.png',
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
      child: child,
    );
  }
}
