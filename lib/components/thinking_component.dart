import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';

enum ThinkingType {
  heart(Offset(4, 2), Offset(5, 2)),
  exclamationYellow(Offset(0, 4), Offset(1, 4)),
  exclamationRed(Offset(0, 5), Offset(1, 5)),
  dollars(Offset(2, 4), Offset(3, 4)),
  hammer(Offset(4, 4), Offset(5, 4)),
  nothing(Offset(6, 4), Offset(7, 4)),
  police(Offset(8, 4), Offset(9, 4)),
  questionYellow(Offset(2, 6), Offset(3, 6)),
  questionBlue(Offset(2, 5), Offset(3, 5)),
  brokenHeart(Offset(4, 5), Offset(5, 5)),
  sleep(Offset(6, 5), Offset(7, 5)),
  minus(Offset(0, 6), Offset(1, 6)),
  plus(Offset(4, 6), Offset(5, 6)),
  note(Offset(6, 6), Offset(7, 6)),
  music(Offset(6, 7), Offset(7, 7)),
  knife(Offset(2, 7), Offset(5, 7)),
  bloddyKnife(Offset(3, 7), Offset(4, 7)),
  moonDark(Offset(4, 8), Offset(5, 8)),
  moonBright(Offset(6, 8), Offset(7, 8)),
  dots(Offset(2, 9), Offset(3, 9)),
  water(Offset(6, 9), Offset(7, 9));

  final Offset first;
  final Offset second;

  const ThinkingType(this.first, this.second);
}

class ThinkingComponent extends StatefulWidget {
  final bool play;
  final ThinkingType animation;

  const ThinkingComponent({
    this.play = false,
    this.animation = ThinkingType.dots,
    super.key,
  });

  @override
  State<ThinkingComponent> createState() => _ThinkingComponentState();
}

class _ThinkingComponentState extends State<ThinkingComponent> {
  SpriteAnimation? _initialAnimation;
  final Map<ThinkingType, SpriteAnimation> _upperParts = {};
  SpriteAnimation? _lowerPart;
  bool _initial = true;

  @override
  void initState() {
    super.initState();
    _createAnimation().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final upperAnimation = _upperParts[widget.animation];
    if (_initialAnimation == null || _lowerPart == null || upperAnimation == null) {
      return SizedBox(width: _frameSize.x, height: _frameSize.y);
    }

    if (_initial) {
      return SizedBox(
        width: _frameSize.x,
        height: _frameSize.y * 2,
        child: SpriteAnimationWidget(
          animation: _initialAnimation!,
          animationTicker: SpriteAnimationTicker(_initialAnimation!),
          anchor: Anchor.center,
          playing: widget.play,
          onComplete: () => setState(() => _initial = false),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          width: _frameSize.x,
          height: _frameSize.y,
          child: SpriteAnimationWidget(
            animation: upperAnimation,
            animationTicker: SpriteAnimationTicker(upperAnimation),
            anchor: Anchor.center,
            playing: widget.play,
          ),
        ),
        SizedBox(
          width: _frameSize.x,
          height: _frameSize.y,
          child: SpriteAnimationWidget(
            animation: _lowerPart!,
            animationTicker: SpriteAnimationTicker(_lowerPart!),
            anchor: Anchor.center,
            playing: widget.play,
          ),
        ),
      ],
    );
  }

  Future<void> _createAnimation() async {
    final spriteSheet = await Flame.images.load('ui/animations/thinking_animation.png');

    final initialData = _getInitialAnimationData();
    _initialAnimation = SpriteAnimation.fromFrameData(spriteSheet, initialData)..loop = false;

    final data = _getAnimationData();
    _lowerPart = SpriteAnimation.fromFrameData(spriteSheet, data);

    for (final animation in ThinkingType.values) {
      final data = _getAnimationData(animation);
      _upperParts[animation] = SpriteAnimation.fromFrameData(spriteSheet, data);
    }
  }

  SpriteAnimationData _getInitialAnimationData() {
    return SpriteAnimationData([
      ...List.generate(4, (index) {
        return SpriteAnimationFrameData(
          srcPosition: Vector2(_frameSize.x * index, 0),
          srcSize: Vector2(_frameSize.x, 2 * _frameSize.y),
          stepTime: 0.1,
        );
      })
    ]);
  }

  SpriteAnimationData _getAnimationData([ThinkingType? animation]) {
    final lastTwo = animation == null ? [const Offset(4, 1), const Offset(5, 1)] : [animation.first, animation.second];

    return SpriteAnimationData([
      ...List.generate(2, (index) {
        final offset = lastTwo[index];
        return SpriteAnimationFrameData(
          srcPosition: Vector2(_frameSize.x * offset.dx, _frameSize.y * offset.dy),
          srcSize: _frameSize,
          stepTime: 0.2,
        );
      }),
    ]);
  }

  static final _frameSize = Vector2(48, 48);
}
