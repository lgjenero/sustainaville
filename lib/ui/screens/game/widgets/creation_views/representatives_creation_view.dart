import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:sustainaville/components/parliament_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/ui/widgets/loading_text_widget.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class RepresentativesCreationView extends StatefulWidget {
  const RepresentativesCreationView({super.key});

  @override
  State<RepresentativesCreationView> createState() => _RepresentativesCreationViewState();
}

class _RepresentativesCreationViewState extends State<RepresentativesCreationView> {
  late final Timer _timer;
  final List<Character> _characters = [];
  Character? _speaker;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      _characters.add(Character.random());
    }
    _speaker = _characters[_random.nextInt(_characters.length)];
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _switchSpeaker();
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
            child: ParliamentComponent(
              speaker: _speaker,
              listeners: _characters.whereNot((e) => e.id == _speaker?.id).toList(),
              runDiscussion: true,
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
              text: 'Creating Representatives',
              style: TextStyle(fontSize: 32),
            ),
          ),
        ],
      ),
    );
  }

  void _switchSpeaker() {
    final speakerCandidates = _characters.whereNot((e) => e.id == _speaker?.id);
    final newSpeaker = speakerCandidates.elementAt(_random.nextInt(speakerCandidates.length));
    setState(() {
      _speaker = newSpeaker;
    });
  }
}
