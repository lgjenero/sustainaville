import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/utils/animations/character_animation.dart';
import 'package:sustainaville/utils/sprites/sprite_sheet.dart';

class CharacterComponent extends StatefulWidget {
  final Character character;
  final bool play;
  final CharacterAnimationEnum animation;

  const CharacterComponent({
    required this.character,
    this.play = false,
    this.animation = CharacterAnimationEnum.idleDown,
    super.key,
  });

  @override
  State<CharacterComponent> createState() => _CharacterComponentState();
}

class _CharacterComponentState extends State<CharacterComponent> {
  CharacterAnimation? _animation;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
  }

  @override
  void didUpdateWidget(covariant CharacterComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.character != widget.character) {
      _setupAnimation();
    } else if (oldWidget.animation != widget.animation) {
      _animation?.play(widget.animation);
    }
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
        anchor: Anchor.center,
        playing: widget.play,
      ),
    );
  }

  void _setupAnimation() {
    _createAnimation().then((animation) {
      if (!mounted) return;
      setState(() {
        animation?.play(widget.animation);
        _animation = animation;
      });
    });
  }

  Future<CharacterAnimation?> _createAnimation() async {
    // need to fix if AI made a mistake
    final fixedDesign = widget.character.design.fixed();

    final bodyimages = [
      'characters/bodies/${fixedDesign.body}.png',
      'characters/eyes/${fixedDesign.eyes}.png',
      'characters/clothes/${fixedDesign.clothes}.png',
      'characters/hair/${fixedDesign.hair}_${fixedDesign.hairColor}.png',
      if (fixedDesign.faceHair != null) 'characters/face_hair/${fixedDesign.faceHair}.png',
      if (fixedDesign.eyewear != null) 'characters/accessories/glasses/${fixedDesign.eyewear}.png',
      if (fixedDesign.hat != null) 'characters/accessories/hats/${fixedDesign.hat}.png',
      // if (fixedDesign.mask != null) 'characters/accessories/masks/${fixedDesign.mask}.png',
      // if (fixedDesign.gloves != null) 'characters/accessories/gloves/${fixedDesign.gloves}.png',
      // if (fixedDesign.backpack != null) 'characters/accessories/backpack/${fixedDesignn.backpack}.png',
    ];

    final spriteSheet = await createSpriteSheet(bodyimages);
    if (spriteSheet == null) return null;

    return CharacterAnimation(
      idleLeft: SpriteAnimation.fromFrameData(spriteSheet, _idleLeft),
      idleUp: SpriteAnimation.fromFrameData(spriteSheet, _idleUp),
      idleDown: SpriteAnimation.fromFrameData(spriteSheet, _idleDown),
      idleRight: SpriteAnimation.fromFrameData(spriteSheet, _idleRight),
      runLeft: SpriteAnimation.fromFrameData(spriteSheet, _runLeft),
      runUp: SpriteAnimation.fromFrameData(spriteSheet, _runUp),
      runDown: SpriteAnimation.fromFrameData(spriteSheet, _runDown),
      runRight: SpriteAnimation.fromFrameData(spriteSheet, _runRight),
      reading: SpriteAnimation.fromFrameData(spriteSheet, _reading),
      sitLeft: SpriteAnimation.fromFrameData(spriteSheet, _sitLeft),
      sitRight: SpriteAnimation.fromFrameData(spriteSheet, _sitRight),
      sitLeftNoLegs: SpriteAnimation.fromFrameData(spriteSheet, _sitLeftNoLegs),
      sitRightNoLegs: SpriteAnimation.fromFrameData(spriteSheet, _sitRightNoLegs),
    );
  }

  static final _frameSize = Vector2(48, 96);

  static final _idleLeft = SpriteAnimationData(
    List.generate(
        6,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * (12 + index), _frameSize.y),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _idleUp = SpriteAnimationData(
    List.generate(
        6,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * (6 + index), _frameSize.y),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _idleDown = SpriteAnimationData(
    List.generate(
        6,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * (18 + index), _frameSize.y),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _idleRight = SpriteAnimationData(
    List.generate(
        6,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * index, _frameSize.y),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _runLeft = SpriteAnimationData(
    List.generate(
        6,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * (12 + index), _frameSize.y * 2),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _runUp = SpriteAnimationData(
    List.generate(
        6,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * (6 + index), _frameSize.y * 2),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _runDown = SpriteAnimationData(
    List.generate(
        6,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * (18 + index), _frameSize.y * 2),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _runRight = SpriteAnimationData(
    List.generate(
        6,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * index, _frameSize.y * 2),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _reading = SpriteAnimationData(
    List.generate(
        12,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * index, _frameSize.y * 7),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _sitLeft = SpriteAnimationData(
    List.generate(
        6,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * (6 + index), _frameSize.y * 4),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _sitRight = SpriteAnimationData(
    List.generate(
        6,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * index, _frameSize.y * 4),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _sitLeftNoLegs = SpriteAnimationData(
    List.generate(
        6,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * (6 + index), _frameSize.y * 5),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );

  static final _sitRightNoLegs = SpriteAnimationData(
    List.generate(
        6,
        (index) => SpriteAnimationFrameData(
              srcPosition: Vector2(_frameSize.x * index, _frameSize.y * 5),
              srcSize: _frameSize,
              stepTime: 0.1,
            )),
  );
}
