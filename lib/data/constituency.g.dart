// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constituency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConstituencyImpl _$$ConstituencyImplFromJson(Map<String, dynamic> json) =>
    _$ConstituencyImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      geographicalArea:
          const StringConverter().fromJson(json['geographicalArea'] as Object),
      economy: const StringConverter().fromJson(json['economy'] as Object),
      demography:
          const StringConverter().fromJson(json['demography'] as Object),
      keyIssues:
          const StringListConverter().fromJson(json['keyIssues'] as Object),
    );

Map<String, dynamic> _$$ConstituencyImplToJson(_$ConstituencyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'geographicalArea':
          const StringConverter().toJson(instance.geographicalArea),
      'economy': const StringConverter().toJson(instance.economy),
      'demography': const StringConverter().toJson(instance.demography),
      'keyIssues': const StringListConverter().toJson(instance.keyIssues),
    };
