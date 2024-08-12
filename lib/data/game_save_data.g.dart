// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_save_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameSaveDataImpl _$$GameSaveDataImplFromJson(Map<String, dynamic> json) =>
    _$GameSaveDataImpl(
      gameData:
          GameSatateData.fromJson(json['gameData'] as Map<String, dynamic>),
      status: $enumDecode(_$GameStatusEnumMap, json['status']),
      slot: json['slot'] as String,
      name: json['name'] as String?,
      createdAt: const DateTimeConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$GameSaveDataImplToJson(_$GameSaveDataImpl instance) =>
    <String, dynamic>{
      'gameData': instance.gameData.toJson(),
      'status': _$GameStatusEnumMap[instance.status]!,
      'slot': instance.slot,
      'name': instance.name,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };

const _$GameStatusEnumMap = {
  GameStatus.loading: 'loading',
  GameStatus.intro: 'intro',
  GameStatus.ready: 'ready',
  GameStatus.waitingForResponse: 'waitingForResponse',
  GameStatus.error: 'error',
};
