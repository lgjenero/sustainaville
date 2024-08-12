import 'dart:ui' as ui;

import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/utils/animations/portrait_animation.dart';
import 'package:sustainaville/utils/sprites/sprite_sheet.dart';

class PortraitComponent extends StatefulWidget {
  final Character character;
  final bool play;

  const PortraitComponent({
    super.key,
    required this.character,
    this.play = false,
  });

  @override
  State<PortraitComponent> createState() => _PortraitComponentState();
}

class _PortraitComponentState extends State<PortraitComponent> {
  PortraitAnimation? _animation;
  ui.Image? _spriteSheet;

  @override
  void initState() {
    super.initState();

    _createAnimation().then((animation) {
      setState(() {
        animation?.play(PortraitAnimationEnum.idle);
        _animation = animation;
      });
    });
  }

  @override
  void didUpdateWidget(covariant PortraitComponent oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.character != widget.character) {
      _spriteSheet?.dispose();
      _createAnimation().then((animation) {
        setState(() {
          animation?.play(PortraitAnimationEnum.idle);
          _animation = animation;
        });
      });
    }
  }

  @override
  void dispose() {
    _spriteSheet?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spriteAnimation = _animation?.currentAnimation;
    if (spriteAnimation == null) return SizedBox(width: _frameSize.x, height: _frameSize.y);

    return SizedBox(
      width: _frameSize.x,
      height: _frameSize.y,
      child: SpriteAnimationWidget(
        animation: spriteAnimation,
        animationTicker: SpriteAnimationTicker(spriteAnimation),
        // anchor: Anchor.center,
        playing: widget.play,
      ),
    );
  }

  Future<PortraitAnimation?> _createAnimation() async {
    // need to fix if AI made a mistake
    final fixedDesign = widget.character.design.fixed();

    final bodyimages = [
      'portraits/face/${fixedDesign.body}.png',
      'portraits/eyes/${fixedDesign.eyes}.png',
      'portraits/hair/${fixedDesign.hair}_${fixedDesign.hairColor}.png',
      if (fixedDesign.faceHair != null) 'portraits/face_hair/${fixedDesign.faceHair}.png',
      if (fixedDesign.eyewear != null) 'portraits/accessories/glasses/${fixedDesign.eyewear}.png',
      if (fixedDesign.hat != null) 'portraits/accessories/hats/${fixedDesign.hat}.png',
      // if (fixedDesign.mask != null) 'portraits/accessories/masks/${wfixedDesign.mask}.png',
    ];

    final spriteSheet = await createSpriteSheet(bodyimages);
    if (spriteSheet == null) return null;

    _spriteSheet = spriteSheet;

    return PortraitAnimation(
      idle: SpriteAnimation.fromFrameData(spriteSheet, _idle),
      yes: SpriteAnimation.fromFrameData(spriteSheet, _yes),
      no: SpriteAnimation.fromFrameData(spriteSheet, _no),
    );
  }

  static final _frameSize = Vector2(96, 96);

  static final _idle = SpriteAnimationData(
    List.generate(
        10,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * index, 0),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _yes = SpriteAnimationData(
    List.generate(
        10,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * index, _frameSize.y),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _no = SpriteAnimationData(
    List.generate(
        10,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * index, 2 * _frameSize.y),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );
}
