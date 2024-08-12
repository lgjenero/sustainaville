import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/ui/widgets/nine_patch_container.dart';

class ChatName extends StatelessWidget {
  final Character character;

  const ChatName({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return NinePatchContainer(
      imagePath: 'assets/images/ui/chat_bubble.9.png',
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
      child: Text(
        character.name,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
