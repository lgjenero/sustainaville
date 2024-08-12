// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartyImpl _$$PartyImplFromJson(Map<String, dynamic> json) => _$PartyImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      ideologicalStance: json['ideologicalStance'] as String,
      leader: Character.fromJson(json['leader'] as Map<String, dynamic>),
      officeStyle: json['officeStyle'] as String,
      keyPolicies:
          const StringListConverter().fromJson(json['keyPolicies'] as Object),
      supportBase:
          const StringListConverter().fromJson(json['supportBase'] as Object),
    );

Map<String, dynamic> _$$PartyImplToJson(_$PartyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ideologicalStance': instance.ideologicalStance,
      'leader': instance.leader.toJson(),
      'officeStyle': instance.officeStyle,
      'keyPolicies': const StringListConverter().toJson(instance.keyPolicies),
      'supportBase': const StringListConverter().toJson(instance.supportBase),
    };
