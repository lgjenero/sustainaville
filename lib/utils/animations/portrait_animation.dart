import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';

enum PortraitAnimationEnum {
  idle,
  yes,
  no,
  custom,
}

/// Class responsible to manager animation on `Portrait`
class PortraitAnimation {
  SpriteAnimation? _idleAnim;
  SpriteAnimation? _yesAnim;
  SpriteAnimation? _noAnim;

  Vector2? centerAnchor;

  Map<dynamic, SpriteAnimation> others = {};

  PortraitAnimationEnum? _currentType;

  dynamic _currentKeyCustom;

  SpriteAnimation? get currentAnimation {
    switch (_currentType) {
      case PortraitAnimationEnum.idle:
        return _idleAnim;
      case PortraitAnimationEnum.yes:
        return _yesAnim;
      case PortraitAnimationEnum.no:
        return _noAnim;
      case PortraitAnimationEnum.custom:
        return others[_currentKeyCustom];
      default:
        return null;
    }
  }

  PortraitAnimation({
    required SpriteAnimation idle,
    SpriteAnimation? yes,
    SpriteAnimation? no,
    Map<dynamic, SpriteAnimation>? others,
    this.centerAnchor,
  }) {
    _idleAnim = idle;
    _yesAnim = yes;
    _noAnim = no;

    others?.forEach((key, anim) {
      this.others[key] = anim;
    });
  }

  /// Method used to play specific default animation
  void play(PortraitAnimationEnum animation) {
    if (_currentType == animation) return;

    _currentType = animation;
    _currentKeyCustom = null;
  }

  /// Method used to play specific animation registred in `others`
  void playOther(dynamic key) {
    if (containOther(key)) {
      _currentKeyCustom = key;
      _currentType = PortraitAnimationEnum.custom;
    }
  }

  bool containOther(dynamic key) => others.containsKey(key);

  /// Method used to register new animation in others
  Future<void> addOtherAnimation(
    dynamic key,
    SpriteAnimation animation,
  ) async {
    others[key] = animation;
  }

  PortraitAnimationEnum? get currentType => _currentType;
}
