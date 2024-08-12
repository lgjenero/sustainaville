import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';

class LobbyMoneyComponent extends StatefulWidget {
  final bool play;

  const LobbyMoneyComponent({
    this.play = false,
    super.key,
  });

  @override
  State<LobbyMoneyComponent> createState() => _LobbyMoneyComponentState();
}

class _LobbyMoneyComponentState extends State<LobbyMoneyComponent> {
  SpriteAnimation? _animation;
  SpriteAnimationTicker? _animationTicker;

  @override
  void initState() {
    super.initState();
    _createAnimation().then((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_animation == null) {
      return SizedBox(width: _frameSize.x, height: _frameSize.y);
    }

    return SizedBox(
      width: _frameSize.x,
      height: _frameSize.y,
      child: SpriteAnimationWidget(
        animation: _animation!,
        animationTicker: _animationTicker!,
        anchor: Anchor.center,
        playing: widget.play,
      ),
    );
  }

  Future<void> _createAnimation() async {
    final spriteSheet = await Flame.images.load('ui/animations/lobby_money_animation.png');
    _animation = SpriteAnimation.fromFrameData(
      spriteSheet,
      SpriteAnimationData(
        List.generate(
            5,
            (index) => SpriteAnimationFrameData(
                  srcPosition: Vector2(_frameSize.x * index, 0),
                  srcSize: _frameSize,
                  stepTime: 2,
                )),
      ),
    )..loop = false;
    _animationTicker = SpriteAnimationTicker(_animation!);
  }

  static final _frameSize = Vector2(48 * 2, 48 * 3);
}
