import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sustainaville/components/character_component.dart';
import 'package:sustainaville/components/thinking_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/data/party.dart';
import 'package:sustainaville/utils/animations/character_animation.dart';

enum PartyOfficeComponentAction {
  enter,
  talking,
  exit,
}

class PartyOfficeComponent extends StatefulWidget {
  final Party party;
  final Character? visitor;
  final PartyOfficeComponentAction action;
  final bool isThinking;

  const PartyOfficeComponent({
    super.key,
    required this.party,
    this.visitor,
    this.action = PartyOfficeComponentAction.enter,
    this.isThinking = false,
  });

  @override
  State<PartyOfficeComponent> createState() => _PartyOfficeComponentState();
}

class _PartyOfficeComponentState extends State<PartyOfficeComponent> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<Offset> _enterAnimation;
  late final Animation<Offset> _exitAnimation;
  late final Animation<Offset> _talkingAnimation;

  static const _start = Offset(0, 4 * 48);
  static const _end = Offset(3 * 48, 4 * 48);

  AudioPlayer? _audioPlayer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    _enterAnimation = Tween<Offset>(begin: _start, end: _end).animate(_controller);
    _exitAnimation = Tween<Offset>(begin: _end, end: _start).animate(_controller);
    _talkingAnimation = Tween<Offset>(begin: _end, end: _end).animate(_controller);
    _setupAction();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.dispose();
    _audioPlayer?.stop();
    _audioPlayer?.release();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PartyOfficeComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.action != widget.action) {
      _setupAction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        height: 480,
        width: 480,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/ui/party_offices/office_${widget.party.fixedOfficeStyle.name}.png',
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 6 * 48,
              top: 3.5 * 48,
              child: CharacterComponent(
                character: widget.party.leader,
                play: true,
                animation: CharacterAnimationEnum.idleLeft,
              ),
            ),
            if (widget.isThinking) _buildThinking(),
            if (widget.visitor != null) _buildAction(),
          ],
        ),
      ),
    );
  }

  Widget _buildThinking() {
    return const Positioned(
      left: 6.5 * 48,
      top: 2.5 * 48,
      child: ThinkingComponent(
        play: true,
      ),
    );
  }

  Widget _buildAction() {
    Animation<Offset> animation;
    CharacterAnimationEnum animationEnum;
    switch (widget.action) {
      case PartyOfficeComponentAction.enter:
        animation = _enterAnimation;
        animationEnum = CharacterAnimationEnum.walkRight;
        break;
      case PartyOfficeComponentAction.talking:
        animation = _talkingAnimation;
        animationEnum = CharacterAnimationEnum.idleRight;
        break;
      case PartyOfficeComponentAction.exit:
        animation = _exitAnimation;
        animationEnum = CharacterAnimationEnum.walkLeft;
        break;
    }

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Positioned(
          left: animation.value.dx,
          top: animation.value.dy,
          child: child!,
        );
      },
      child: CharacterComponent(
        character: widget.visitor!,
        play: true,
        animation: animationEnum,
        animationSet: const {CharacterAnimationSet.idle, CharacterAnimationSet.walk},
      ),
    );
  }

  void _setupAction() {
    if (widget.visitor == null) return;

    _audioPlayer?.stop();
    _audioPlayer?.release();
    _audioPlayer = null;

    // setup the effects
    switch (widget.action) {
      case PartyOfficeComponentAction.enter:
        FlameAudio.play('sfx/door_open.mp3', volume: 0.4);
        FlameAudio.loop('sfx_loops/walking.mp3', volume: 0.6).then((player) {
          if (!mounted) {
            player.stop();
            player.release();
            return;
          }
          if (widget.action != PartyOfficeComponentAction.enter) {
            player.stop();
            player.release();
          }
          _audioPlayer = player;
        });
        break;
      case PartyOfficeComponentAction.talking:
        FlameAudio.loop('sfx_loops/talking.mp3', volume: 0.2).then((player) {
          if (!mounted) {
            player.stop();
            player.release();
            return;
          }
          if (widget.action != PartyOfficeComponentAction.talking) {
            player.stop();
            player.release();
            return;
          }
          _audioPlayer = player;
        });
        break;
      case PartyOfficeComponentAction.exit:
        _audioPlayer?.stop();
        _audioPlayer?.release();
        _audioPlayer = null;
        FlameAudio.loop('sfx_loops/walking.mp3', volume: 0.6).then((player) {
          if (!mounted) {
            player.stop();
            player.release();
            return;
          }
          if (widget.action != PartyOfficeComponentAction.exit) {
            player.stop();
            player.release();
            return;
          }
          _audioPlayer = player;
        });
        break;
    }

    _controller.value = 0;
    _controller.forward().then((_) {
      _audioPlayer?.stop();
      _audioPlayer?.release();
      _audioPlayer = null;
      switch (widget.action) {
        case PartyOfficeComponentAction.enter:
          break;
        case PartyOfficeComponentAction.talking:
          break;
        case PartyOfficeComponentAction.exit:
          FlameAudio.play('sfx/door_close.mp3', volume: 0.4);
          break;
      }
    }).onError((_, __) {
      _audioPlayer?.stop();
      _audioPlayer?.release();
      _audioPlayer = null;
    });
  }
}
