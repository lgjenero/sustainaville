import 'package:flutter/material.dart';
import 'package:sustainaville/components/portrait_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/ui/dialogs/chat/portrait_bubble.dart';

class ChatAvatar extends StatelessWidget {
  final Character character;

  const ChatAvatar({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return PortraitBubble(
      child: PortraitComponent(character: character),
    );
  }
}
