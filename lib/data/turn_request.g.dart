// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turn_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TurnChatRequestImpl _$$TurnChatRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TurnChatRequestImpl(
      representativeId: json['representativeId'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$TurnChatRequestImplToJson(
        _$TurnChatRequestImpl instance) =>
    <String, dynamic>{
      'representativeId': instance.representativeId,
      'message': instance.message,
    };

_$TurnIncidentRequestImpl _$$TurnIncidentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TurnIncidentRequestImpl(
      representativeId: json['representativeId'] as String,
      type: $enumDecode(_$IncidentTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$TurnIncidentRequestImplToJson(
        _$TurnIncidentRequestImpl instance) =>
    <String, dynamic>{
      'representativeId': instance.representativeId,
      'type': _$IncidentTypeEnumMap[instance.type]!,
    };

const _$IncidentTypeEnumMap = {
  IncidentType.positive: 'positive',
  IncidentType.negative: 'negative',
};

_$TurnRequestImpl _$$TurnRequestImplFromJson(Map<String, dynamic> json) =>
    _$TurnRequestImpl(
      turnChatRequest: json['turnChatRequest'] == null
          ? null
          : TurnChatRequest.fromJson(
              json['turnChatRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TurnRequestImplToJson(_$TurnRequestImpl instance) =>
    <String, dynamic>{
      'turnChatRequest': instance.turnChatRequest?.toJson(),
    };
