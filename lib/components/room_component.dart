import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:sustainaville/components/character_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/utils/animations/character_animation.dart';

enum RoomComponentAction {
  enter,
  talking,
  exit,
}

class RoomComponent extends StatefulWidget {
  final Character? owner;
  final Character? visitor;
  final int roomIndex;
  final RoomComponentAction action;

  const RoomComponent({
    super.key,
    this.owner,
    this.visitor,
    required this.roomIndex,
    this.action = RoomComponentAction.enter,
  });

  @override
  State<RoomComponent> createState() => _RoomComponentState();
}

class _RoomComponentState extends State<RoomComponent> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<Offset> _enterAnimation;
  late final Animation<Offset> _exitAnimation;
  late final Animation<Offset> _talkingAnimation;

  static const _start = Offset(4.5 * 48, 10 * 48);
  static const _end = Offset(4.5 * 48, 5 * 48);

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
    _audioPlayer?.stop();
    _audioPlayer?.release();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant RoomComponent oldWidget) {
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
                'assets/images/ui/rooms/room_bottom_${widget.roomIndex}.png',
                fit: BoxFit.contain,
              ),
            ),
            if (widget.owner != null)
              Positioned(
                left: 5 * 48,
                top: 2 * 48 - 0,
                child: CharacterComponent(
                  character: widget.owner!,
                  play: true,
                ),
              ),
            if (widget.visitor != null) _buildAction(),
            Positioned.fill(
              child: Image.asset(
                'assets/images/ui/rooms/room_top_${widget.roomIndex}.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAction() {
    Animation<Offset> animation;
    CharacterAnimationEnum animationEnum;
    switch (widget.action) {
      case RoomComponentAction.enter:
        animation = _enterAnimation;
        animationEnum = CharacterAnimationEnum.walkUp;
        break;
      case RoomComponentAction.talking:
        animation = _talkingAnimation;
        animationEnum = CharacterAnimationEnum.idleUp;
        break;
      case RoomComponentAction.exit:
        animation = _exitAnimation;
        animationEnum = CharacterAnimationEnum.walkDown;
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
      child: CharacterComponent(character: widget.visitor!, play: true, animation: animationEnum),
    );
  }

  void _setupAction() {
    if (widget.visitor == null) return;

    _audioPlayer?.stop();
    _audioPlayer?.release();
    _audioPlayer = null;

    // setup the effects
    switch (widget.action) {
      case RoomComponentAction.enter:
        FlameAudio.play('sfx/door_open.mp3', volume: 0.4);
        FlameAudio.loop('sfx_loops/walking.mp3', volume: 0.6).then((player) {
          if (!mounted) {
            player.stop();
            player.release();
            return;
          }
          if (widget.action != RoomComponentAction.enter) {
            player.stop();
            player.release();
          }
          _audioPlayer = player;
        });
        break;
      case RoomComponentAction.talking:
        FlameAudio.loop('sfx_loops/talking.mp3', volume: 0.2).then((player) {
          if (!mounted) {
            player.stop();
            player.release();
            return;
          }
          if (widget.action != RoomComponentAction.talking) {
            player.stop();
            player.release();
            return;
          }
          _audioPlayer = player;
        });
        break;
      case RoomComponentAction.exit:
        _audioPlayer?.stop();
        _audioPlayer?.release();
        _audioPlayer = null;
        FlameAudio.loop('sfx_loops/walking.mp3', volume: 0.6).then((player) {
          if (!mounted) {
            player.stop();
            player.release();
            return;
          }
          if (widget.action != RoomComponentAction.exit) {
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
        case RoomComponentAction.enter:
          break;
        case RoomComponentAction.talking:
          break;
        case RoomComponentAction.exit:
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
