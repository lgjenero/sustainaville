import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:sustainaville/components/character_component.dart';
import 'package:sustainaville/components/thinking_character_component.dart';
import 'package:sustainaville/components/thinking_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/utils/animations/character_animation.dart';

class TvStudioComponent extends StatefulWidget {
  final Character guest;
  final bool play;
  final bool runDiscussion;

  const TvStudioComponent({
    required this.guest,
    this.play = false,
    this.runDiscussion = false,
    super.key,
  });

  @override
  State<TvStudioComponent> createState() => _TvStudioComponentState();
}

class _TvStudioComponentState extends State<TvStudioComponent> {
  static const _guestPostion = Offset(4.5, 2);
  static const _hostPostion = Offset(6.9, 2.45);
  static const _cameramanPostion = Offset(0.5, 2.9);
  static const _audiencePositions = [
    Offset(4, 8),
    Offset(5, 8),
    Offset(6, 8),
    Offset(7, 8),
    Offset(8, 8),
  ];

  late final Character _host = Character.random();
  late final Character _cameraman = Character.random();
  late final List<Character> _audience = List.generate(5, (_) => Character.random());
  final Map<Character, ThinkingType> _talkingAnimationPerCharacter = {};

  Timer? _discussionTimer;
  late final _random = Random();

  @override
  void initState() {
    super.initState();
    _setupDiscusison();
  }

  @override
  void didUpdateWidget(covariant TvStudioComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.runDiscussion != widget.runDiscussion) {
      _setupDiscusison();
    }
  }

  @override
  void dispose() {
    _discussionTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        height: 48 * 10,
        width: 48 * 10,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/ui/tv_studio/tv_studio_bottom.png',
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: _cameramanPostion.dx * 48,
              top: _cameramanPostion.dy * 48,
              child: CharacterComponent(
                character: _cameraman,
                play: true,
                animation: CharacterAnimationEnum.idleRight,
              ),
            ),
            Positioned(
              left: _guestPostion.dx * 48,
              top: _guestPostion.dy * 48,
              child: ThinkingCharacterComponent(
                character: widget.guest,
                play: true,
                animation: CharacterAnimationEnum.idleDown,
                thinkingType: _talkingAnimationPerCharacter[widget.guest],
              ),
            ),
            Positioned(
              left: _hostPostion.dx * 48,
              top: _hostPostion.dy * 48,
              child: ThinkingCharacterComponent(
                character: _host,
                play: true,
                animation: CharacterAnimationEnum.sitLeftNoLegs,
                thinkingType: _talkingAnimationPerCharacter[_host],
                animationSet: const {CharacterAnimationSet.sit},
              ),
            ),
            ..._audience.mapIndexed((index, e) {
              return Positioned(
                left: _audiencePositions[index].dx * 48,
                top: _audiencePositions[index].dy * 48,
                child: CharacterComponent(
                  character: e,
                  play: true,
                  animation: CharacterAnimationEnum.idleUp,
                ),
              );
            }),
            Positioned.fill(
              child: Image.asset(
                'assets/images/ui/tv_studio/tv_studio_top.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setupDiscusison() {
    if (widget.runDiscussion) {
      if (_discussionTimer != null) return;
      _discussionChange();
      _discussionTimer = Timer.periodic(const Duration(milliseconds: 5000), (_) => _discussionChange());
    } else {
      _talkingAnimationPerCharacter.clear();
      _discussionTimer?.cancel();
      _discussionTimer = null;
    }
  }

  void _discussionChange() {
    final characters = [widget.guest, _host];
    final updatedTalkingAnimationPerCharacter = <Character, ThinkingType>{};
    for (final character in characters) {
      updatedTalkingAnimationPerCharacter[character] = ThinkingType.values[_random.nextInt(ThinkingType.values.length)];
    }

    setState(() {
      _talkingAnimationPerCharacter.addAll(updatedTalkingAnimationPerCharacter);
    });
  }
}
