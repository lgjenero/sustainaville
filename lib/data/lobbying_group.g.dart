// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lobbying_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LobbyingGroupImpl _$$LobbyingGroupImplFromJson(Map<String, dynamic> json) =>
    _$LobbyingGroupImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      agenda: const StringConverter().fromJson(json['agenda'] as Object),
      areasOfInfluence:
          const StringConverter().fromJson(json['areasOfInfluence'] as Object),
      leader: Character.fromJson(json['leader'] as Map<String, dynamic>),
      officeStyle: json['officeStyle'] as String,
      supportBase:
          const StringListConverter().fromJson(json['supportBase'] as Object),
      influenceLevel: json['influenceLevel'] as String,
      financialStrength: json['financialStrength'] as String,
    );

Map<String, dynamic> _$$LobbyingGroupImplToJson(_$LobbyingGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'agenda': const StringConverter().toJson(instance.agenda),
      'areasOfInfluence':
          const StringConverter().toJson(instance.areasOfInfluence),
      'leader': instance.leader.toJson(),
      'officeStyle': instance.officeStyle,
      'supportBase': const StringListConverter().toJson(instance.supportBase),
      'influenceLevel': instance.influenceLevel,
      'financialStrength': instance.financialStrength,
    };
