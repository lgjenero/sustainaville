import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_avatar.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_bubble.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_name.dart';

class ChatPlayer extends ConsumerWidget {
  final Character character;

  const ChatPlayer({required this.character, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Padding(padding: const EdgeInsets.only(top: 44), child: _buildContainer()),
        Positioned(
          top: 0,
          left: 10,
          child: ChatName(character: character),
        ),
      ],
    );
  }

  Widget _buildContainer() {
    return ChatBubble(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChatAvatar(character: character),
          const SizedBox(width: 12),
          const Expanded(child: Text("Somethign to say ....")),
        ],
      ),
    );
  }
}
