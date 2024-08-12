import 'package:flutter/material.dart';
import 'package:sustainaville/components/character_component.dart';
import 'package:sustainaville/components/thinking_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/utils/animations/character_animation.dart';

class ThinkingCharacterComponent extends StatelessWidget {
  final Character character;
  final bool play;
  final CharacterAnimationEnum animation;
  final ThinkingType? thinkingType;

  const ThinkingCharacterComponent({
    required this.character,
    this.play = false,
    this.animation = CharacterAnimationEnum.idleDown,
    this.thinkingType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CharacterComponent(character: character, play: play, animation: animation),
        if (thinkingType != null)
          Positioned(
            left: 24,
            bottom: 48,
            child: ThinkingComponent(animation: thinkingType!, play: play),
          )
      ],
    );
  }
}
