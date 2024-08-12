import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';

enum CharacterAnimationEnum {
  idleLeft,
  idleRight,
  idleUp,
  idleDown,
  walkLeft,
  walkRight,
  walkUp,
  walkDown,
  reading,
  sitLeft,
  sitRight,
  sitLeftNoLegs,
  sitRightNoLegs,
  custom,
}

/// Class responsible to manager animation on `Portrait`
class CharacterAnimation {
  SpriteAnimation? _idleLeft;
  SpriteAnimation? _idleRight;
  SpriteAnimation? _idleUp;
  SpriteAnimation? _idleDown;
  SpriteAnimation? _walkLeft;
  SpriteAnimation? _walkRight;
  SpriteAnimation? _walkUp;
  SpriteAnimation? _walkDown;
  SpriteAnimation? _reading;
  SpriteAnimation? _sitLeft;
  SpriteAnimation? _sitRight;
  SpriteAnimation? _sitLeftNoLegs;
  SpriteAnimation? _sitRightNoLegs;

  Vector2? centerAnchor;

  Map<dynamic, SpriteAnimation> others = {};

  CharacterAnimationEnum? _currentType;

  dynamic _currentKeyCustom;

  SpriteAnimation? get currentAnimation {
    switch (_currentType) {
      case CharacterAnimationEnum.idleLeft:
        return _idleLeft;
      case CharacterAnimationEnum.idleRight:
        return _idleRight;
      case CharacterAnimationEnum.idleUp:
        return _idleUp;
      case CharacterAnimationEnum.idleDown:
        return _idleDown;
      case CharacterAnimationEnum.walkLeft:
        return _walkLeft;
      case CharacterAnimationEnum.walkRight:
        return _walkRight;
      case CharacterAnimationEnum.walkUp:
        return _walkUp;
      case CharacterAnimationEnum.walkDown:
        return _walkDown;
      case CharacterAnimationEnum.reading:
        return _reading;
      case CharacterAnimationEnum.sitLeft:
        return _sitLeft;
      case CharacterAnimationEnum.sitRight:
        return _sitRight;
      case CharacterAnimationEnum.sitLeftNoLegs:
        return _sitLeftNoLegs;
      case CharacterAnimationEnum.sitRightNoLegs:
        return _sitRightNoLegs;
      case CharacterAnimationEnum.custom:
        return others[_currentKeyCustom];
      default:
        return null;
    }
  }

  CharacterAnimation({
    required SpriteAnimation idleDown,
    SpriteAnimation? idleLeft,
    SpriteAnimation? idleRight,
    SpriteAnimation? idleUp,
    SpriteAnimation? runLeft,
    SpriteAnimation? runRight,
    SpriteAnimation? runDown,
    SpriteAnimation? runUp,
    SpriteAnimation? reading,
    SpriteAnimation? sitLeft,
    SpriteAnimation? sitRight,
    SpriteAnimation? sitLeftNoLegs,
    SpriteAnimation? sitRightNoLegs,
    Map<dynamic, SpriteAnimation>? others,
    this.centerAnchor,
  }) {
    _idleDown = idleDown;
    _idleLeft = idleLeft;
    _idleRight = idleRight;
    _idleUp = idleUp;
    _walkLeft = runLeft;
    _walkRight = runRight;
    _walkDown = runDown;
    _walkUp = runUp;
    _reading = reading;
    _sitLeft = sitLeft;
    _sitRight = sitRight;
    _sitLeftNoLegs = sitLeftNoLegs;
    _sitRightNoLegs = sitRightNoLegs;

    others?.forEach((key, anim) {
      this.others[key] = anim;
    });
  }

  /// Method used to play specific default animation
  void play(CharacterAnimationEnum animation) {
    if (_currentType == animation) return;

    _currentType = animation;
    _currentKeyCustom = null;
  }

  /// Method used to play specific animation registred in `others`
  void playOther(dynamic key, {bool? flipX, bool? flipY}) {
    if (containOther(key)) {
      _currentKeyCustom = key;
      _currentType = CharacterAnimationEnum.custom;
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

  CharacterAnimationEnum? get currentType => _currentType;
}
