// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChararcterDesignImpl _$$ChararcterDesignImplFromJson(
        Map<String, dynamic> json) =>
    _$ChararcterDesignImpl(
      body: json['body'] as String,
      hair: json['hair'] as String,
      hairColor: json['hairColor'] as String,
      eyes: json['eyes'] as String,
      clothes: json['clothes'] as String,
      faceHair: json['faceHair'] as String?,
      eyewear: json['eyewear'] as String?,
      hat: json['hat'] as String?,
    );

Map<String, dynamic> _$$ChararcterDesignImplToJson(
        _$ChararcterDesignImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'hair': instance.hair,
      'hairColor': instance.hairColor,
      'eyes': instance.eyes,
      'clothes': instance.clothes,
      'faceHair': instance.faceHair,
      'eyewear': instance.eyewear,
      'hat': instance.hat,
    };

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      design: ChararcterDesign.fromJson(json['design'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'design': instance.design.toJson(),
    };
