// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillImpl _$$BillImplFromJson(Map<String, dynamic> json) => _$BillImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      sponsorId: json['sponsorId'] as String,
      suggestedAmendments: json['suggestedAmendments'] == null
          ? const []
          : const StringListConverter()
              .fromJson(json['suggestedAmendments'] as Object),
      amendments: json['amendments'] == null
          ? const []
          : const StringListConverter().fromJson(json['amendments'] as Object),
      votedFor: json['votedFor'] == null
          ? const []
          : const StringListConverter().fromJson(json['votedFor'] as Object),
      votedAgainst: json['votedAgainst'] == null
          ? const []
          : const StringListConverter()
              .fromJson(json['votedAgainst'] as Object),
    );

Map<String, dynamic> _$$BillImplToJson(_$BillImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'sponsorId': instance.sponsorId,
      'suggestedAmendments':
          const StringListConverter().toJson(instance.suggestedAmendments),
      'amendments': const StringListConverter().toJson(instance.amendments),
      'votedFor': const StringListConverter().toJson(instance.votedFor),
      'votedAgainst': const StringListConverter().toJson(instance.votedAgainst),
    };
