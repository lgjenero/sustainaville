import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:sustainaville/components/thinking_character_component.dart';
import 'package:sustainaville/components/thinking_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/utils/animations/character_animation.dart';

class ParliamentComponent extends StatefulWidget {
  final List<Character>? listeners;
  final Character? speaker;
  final bool play;
  final bool runDiscussion;

  const ParliamentComponent({
    this.listeners,
    this.speaker,
    this.play = false,
    this.runDiscussion = false,
    super.key,
  });

  @override
  State<ParliamentComponent> createState() => _ParliamentComponentState();
}

class _ParliamentComponentState extends State<ParliamentComponent> {
  static const _speakerPostion = Offset(5, 0);
  static const _listenerPositions = [
    Offset(1, 5),
    Offset(3, 5),
    Offset(5, 5),
    Offset(7, 5),
    Offset(9, 5),
  ];

  final Map<Character, Offset> _positionsPerListener = {};
  final Map<Character, ThinkingType> _talkingAnimationPerCharacter = {};

  Timer? _discussionTimer;
  late final _random = Random();

  @override
  void initState() {
    super.initState();
    _setupListernersInPostions();
    _setupDiscusison();
  }

  @override
  void didUpdateWidget(covariant ParliamentComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!const ListEquality().equals(oldWidget.listeners, widget.listeners)) {
      _setupListernersInPostions();
      _setupDiscusison();
    }
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
        height: 48 * 9,
        width: 48 * 11,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/ui/parliament/parliament_bottom.png',
                fit: BoxFit.contain,
              ),
            ),
            if (widget.speaker != null)
              Positioned(
                left: _speakerPostion.dx * 48,
                top: _speakerPostion.dy * 48,
                child: ThinkingCharacterComponent(
                  character: widget.speaker!,
                  play: true,
                  animation: CharacterAnimationEnum.idleDown,
                  thinkingType: _talkingAnimationPerCharacter[widget.speaker!],
                ),
              ),
            ..._positionsPerListener.entries.map((entry) {
              final listener = entry.key;
              final position = entry.value;

              return Positioned(
                left: position.dx * 48,
                top: position.dy * 48,
                child: ThinkingCharacterComponent(
                  character: listener,
                  play: true,
                  animation: CharacterAnimationEnum.idleUp,
                  thinkingType: _talkingAnimationPerCharacter[listener],
                ),
              );
            }),
            Positioned.fill(
              child: Image.asset(
                'assets/images/ui/parliament/parliament_top.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setupListernersInPostions() {
    _positionsPerListener.clear();

    final availablePositions = [..._listenerPositions]..shuffle();
    for (final listener in widget.listeners ?? []) {
      if (availablePositions.isEmpty) break;
      _positionsPerListener[listener] = availablePositions.removeAt(0);
    }
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
    final characters = [...(widget.listeners ?? []), if (widget.speaker != null) widget.speaker!];
    final updatedTalkingAnimationPerCharacter = <Character, ThinkingType>{};
    for (final character in characters) {
      updatedTalkingAnimationPerCharacter[character] = ThinkingType.values[_random.nextInt(ThinkingType.values.length)];
    }

    setState(() {
      _talkingAnimationPerCharacter.addAll(updatedTalkingAnimationPerCharacter);
    });
  }
}
