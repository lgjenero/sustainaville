import 'package:flutter/material.dart';
import 'package:sustainaville/components/character_component.dart';
import 'package:sustainaville/components/lobby_money_component.dart';
import 'package:sustainaville/components/thinking_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/utils/animations/character_animation.dart';

class LobbyGroupsCharacterComponent extends StatefulWidget {
  final Character character;
  final bool play;
  final CharacterAnimationEnum animation;
  final ThinkingType? thinkingType;

  const LobbyGroupsCharacterComponent({
    required this.character,
    this.play = false,
    this.animation = CharacterAnimationEnum.idleDown,
    this.thinkingType,
    super.key,
  });

  @override
  State<LobbyGroupsCharacterComponent> createState() => _LobbyGroupsCharacterComponentState();
}

class _LobbyGroupsCharacterComponentState extends State<LobbyGroupsCharacterComponent> {
  final GlobalKey _moneyKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final fixedAnimation =
        widget.animation == CharacterAnimationEnum.idleLeft || widget.animation == CharacterAnimationEnum.idleRight
            ? widget.animation
            : CharacterAnimationEnum.idleDown;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        CharacterComponent(character: widget.character, play: widget.play, animation: fixedAnimation),
        if (widget.thinkingType != null)
          Positioned(
            left: 24,
            bottom: 48,
            child: ThinkingComponent(animation: widget.thinkingType!, play: widget.play),
          ),
        _buildMoney(fixedAnimation)
      ],
    );
  }

  Widget _buildMoney(CharacterAnimationEnum animation) {
    double? left;
    double? right;
    double? top;
    double? bottom;

    switch (animation) {
      case CharacterAnimationEnum.idleLeft:
        left = -(2.5 * 48);
        top = -(0.5 * 58);
        break;
      case CharacterAnimationEnum.idleRight:
        right = -(2.5 * 48);
        top = -(0.5 * 58);
        break;
      default:
        top = 2.0 * 48;
        left = -(0.5 * 48);
    }

    return Positioned(
      left: left,
      right: right,
      bottom: bottom,
      top: top,
      child: LobbyMoneyComponent(key: _moneyKey, play: widget.play),
    );
  }
}
