// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CampaignImpl _$$CampaignImplFromJson(Map<String, dynamic> json) =>
    _$CampaignImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      result: json['result'] as String,
      amount: json['amount'] as num?,
      constituency: json['constituency'] as num?,
      publicOpinion: json['publicOpinion'] as num?,
    );

Map<String, dynamic> _$$CampaignImplToJson(_$CampaignImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'result': instance.result,
      'amount': instance.amount,
      'constituency': instance.constituency,
      'publicOpinion': instance.publicOpinion,
    };
