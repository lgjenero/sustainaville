import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_character.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_player.dart';

class ChatDialog extends ConsumerWidget {
  const ChatDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final representatives = ref.watch(gameStateProvider).representatives;

    if (representatives.length < 2) return const SizedBox();

    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChatCharacter(character: Character.fromRepresentative(representatives[1])),
              ChatPlayer(character: Character.fromRepresentative(representatives[0])),
            ],
          ),
        ),
      ),
    );
  }
}
