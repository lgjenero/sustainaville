import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sustainaville/components/character_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/utils/animations/character_animation.dart';

class ErrorComponent extends StatefulWidget {
  const ErrorComponent({super.key});

  @override
  State<ErrorComponent> createState() => _ErrorComponentState();
}

class _ErrorComponentState extends State<ErrorComponent> with SingleTickerProviderStateMixin {
  late final _character = Character.random();
  static const _position = Offset(6.5, 3);
  static const _leakPosition = Offset(4.5, 3);
  SpriteAnimation? _leakAnimation;

  @override
  void initState() {
    super.initState();
    _createAnimation().then((value) {
      if (!mounted) return;
      setState(() {
        _leakAnimation = value;
      });
    });
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
                'assets/images/ui/error/error.png',
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: _position.dx * 48,
              top: _position.dy * 48,
              child: CharacterComponent(
                character: _character,
                play: true,
                animation: CharacterAnimationEnum.idleDown,
              ),
            ),
            if (_leakAnimation != null)
              Positioned(
                left: _leakPosition.dx * 48,
                top: _leakPosition.dy * 48,
                child: SizedBox(
                  width: 48,
                  height: 96,
                  child: SpriteAnimationWidget(
                    animation: _leakAnimation!,
                    animationTicker: SpriteAnimationTicker(_leakAnimation!),
                    anchor: Anchor.center,
                    playing: true,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<SpriteAnimation?> _createAnimation() async {
    final spriteSheet = await Flame.images.load('ui/animations/water_leak.png');

    return SpriteAnimation.fromFrameData(
      spriteSheet,
      SpriteAnimationData(
        List.generate(12, (index) {
          return SpriteAnimationFrameData(
            srcPosition: Vector2(
              (index >= 6 ? index - 6 : index) * 48.0,
              index >= 6 ? 96 : 0,
            ),
            srcSize: Vector2(48, 96),
            stepTime: 0.2,
          );
        }),
      ),
    );
  }
}
