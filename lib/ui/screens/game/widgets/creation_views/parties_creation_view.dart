import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sustainaville/components/thinking_character_component.dart';
import 'package:sustainaville/components/thinking_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/ui/widgets/loading_text_widget.dart';
import 'package:sustainaville/utils/animations/character_animation.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class PartiesCreationView extends StatefulWidget {
  const PartiesCreationView({super.key});

  @override
  State<PartiesCreationView> createState() => _PartiesCreationViewState();
}

class _PartiesCreationViewState extends State<PartiesCreationView> {
  late final Timer _timer;
  final List<Character> _characters = [];
  final Map<String, Offset> _charactersPosition = {};
  final Map<String, GlobalKey> _charactersKeys = {};
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _addCharacter();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _addCharacter();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            top: 100,
            left: 32,
            right: 32,
            bottom: 32,
            child: FittedBox(
              child: SizedBox(
                width: 480,
                height: 480,
                child: Stack(
                  children: _characters.map((e) {
                    return Positioned(
                      left: _charactersPosition[e.id]?.dx ?? 0,
                      top: _charactersPosition[e.id]?.dy ?? 0,
                      child: ThinkingCharacterComponent(
                        key: _charactersKeys[e.id],
                        character: e,
                        play: true,
                        animation: _charactersPosition[e.id]!.dx > 240
                            ? CharacterAnimationEnum.idleLeft
                            : CharacterAnimationEnum.idleRight,
                        thinkingType: _charactersPosition[e.id]!.dx > 240
                            ? ThinkingType.exclamationRed
                            : ThinkingType.exclamationYellow,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: 180,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.gameBackground,
                    AppColors.gameBackground.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 12,
            right: 32,
            left: 32,
            child: LoadingTextWidget(
              text: 'Creating Parties',
              style: TextStyle(fontSize: 32),
            ),
          ),
        ],
      ),
    );
  }

  void _addCharacter() {
    if (_characters.length > 48) return;
    setState(() {
      final character = Character.random();
      _characters.add(character);
      final isLeft = _characters.length % 2 == 0;

      Offset position = Offset(
        ((isLeft ? 0 : 6) + _random.nextInt(4)) * 48,
        _random.nextInt(8) * 48,
      );
      while (_charactersPosition.values.any((element) => element == position)) {
        position = Offset(
          ((isLeft ? 0 : 6) + _random.nextInt(4)) * 48,
          _random.nextInt(8) * 48,
        );
      }

      _charactersPosition[character.id] = position;
      _characters.sort((a, b) => (_charactersPosition[a.id]!.dy - _charactersPosition[b.id]!.dy).toInt());
      _charactersKeys[character.id] = GlobalKey();
    });
  }
}
