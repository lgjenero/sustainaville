// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'representative.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepresentativeImpl _$$RepresentativeImplFromJson(Map<String, dynamic> json) =>
    _$RepresentativeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      design: ChararcterDesign.fromJson(json['design'] as Map<String, dynamic>),
      partyId: json['partyId'] as String,
      constituencyId: json['constituencyId'] as String,
      lobbyingGroupIds: const StringListConverter()
          .fromJson(json['lobbyingGroupIds'] as Object),
      supportBase:
          const StringListConverter().fromJson(json['supportBase'] as Object),
      ideals: const StringListConverter().fromJson(json['ideals'] as Object),
      goals: json['goals'] as String,
      previousOccupation: json['previousOccupation'] as String,
      education: json['education'] as String,
      personalBackground: json['personalBackground'] as String,
      personalityTraits: const StringListConverter()
          .fromJson(json['personalityTraits'] as Object),
      strengths:
          const StringListConverter().fromJson(json['strengths'] as Object),
      weaknesses:
          const StringListConverter().fromJson(json['weaknesses'] as Object),
    );

Map<String, dynamic> _$$RepresentativeImplToJson(
        _$RepresentativeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'design': instance.design.toJson(),
      'partyId': instance.partyId,
      'constituencyId': instance.constituencyId,
      'lobbyingGroupIds':
          const StringListConverter().toJson(instance.lobbyingGroupIds),
      'supportBase': const StringListConverter().toJson(instance.supportBase),
      'ideals': const StringListConverter().toJson(instance.ideals),
      'goals': instance.goals,
      'previousOccupation': instance.previousOccupation,
      'education': instance.education,
      'personalBackground': instance.personalBackground,
      'personalityTraits':
          const StringListConverter().toJson(instance.personalityTraits),
      'strengths': const StringListConverter().toJson(instance.strengths),
      'weaknesses': const StringListConverter().toJson(instance.weaknesses),
    };
