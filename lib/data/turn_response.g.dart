// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turn_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TurnRepresentativeResponseImpl _$$TurnRepresentativeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TurnRepresentativeResponseImpl(
      representativeId: json['representativeId'] as String,
      support: json['support'] as num?,
      response: json['response'] as String,
    );

Map<String, dynamic> _$$TurnRepresentativeResponseImplToJson(
        _$TurnRepresentativeResponseImpl instance) =>
    <String, dynamic>{
      'representativeId': instance.representativeId,
      'support': instance.support,
      'response': instance.response,
    };

_$TurnBillResponseImpl _$$TurnBillResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TurnBillResponseImpl(
      billId: json['billId'] as String,
      constituency: json['constituency'] as num?,
      publicOpinion: json['publicOpinion'] as num?,
      sustainabiliyScore: json['sustainabiliyScore'] as num?,
      greenScore: json['greenScore'] as num?,
      votedFor: json['votedFor'] == null
          ? const []
          : const StringListConverter().fromJson(json['votedFor'] as Object),
      votedAgainst: json['votedAgainst'] == null
          ? const []
          : const StringListConverter()
              .fromJson(json['votedAgainst'] as Object),
    );

Map<String, dynamic> _$$TurnBillResponseImplToJson(
        _$TurnBillResponseImpl instance) =>
    <String, dynamic>{
      'billId': instance.billId,
      'constituency': instance.constituency,
      'publicOpinion': instance.publicOpinion,
      'sustainabiliyScore': instance.sustainabiliyScore,
      'greenScore': instance.greenScore,
      'votedFor': const StringListConverter().toJson(instance.votedFor),
      'votedAgainst': const StringListConverter().toJson(instance.votedAgainst),
    };

_$TurnIncidentResponseImpl _$$TurnIncidentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TurnIncidentResponseImpl(
      incidentId: json['incidentId'] as String,
      description: json['description'] as String,
      constituency: json['constituency'] as num?,
      publicOpinion: json['publicOpinion'] as num?,
    );

Map<String, dynamic> _$$TurnIncidentResponseImplToJson(
        _$TurnIncidentResponseImpl instance) =>
    <String, dynamic>{
      'incidentId': instance.incidentId,
      'description': instance.description,
      'constituency': instance.constituency,
      'publicOpinion': instance.publicOpinion,
    };

_$TurnFundingResponseImpl _$$TurnFundingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TurnFundingResponseImpl(
      amount: json['amount'] as num?,
      constituency: json['constituency'] as num?,
      publicOpinion: json['publicOpinion'] as num?,
    );

Map<String, dynamic> _$$TurnFundingResponseImplToJson(
        _$TurnFundingResponseImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'constituency': instance.constituency,
      'publicOpinion': instance.publicOpinion,
    };

_$TurnCampaignResponseImpl _$$TurnCampaignResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TurnCampaignResponseImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      result: json['result'] as String,
      amount: json['amount'] as num?,
      constituency: json['constituency'] as num?,
      publicOpinion: json['publicOpinion'] as num?,
    );

Map<String, dynamic> _$$TurnCampaignResponseImplToJson(
        _$TurnCampaignResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'result': instance.result,
      'amount': instance.amount,
      'constituency': instance.constituency,
      'publicOpinion': instance.publicOpinion,
    };

_$TurnFeedbackResponseImpl _$$TurnFeedbackResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TurnFeedbackResponseImpl(
      partyId: json['partyId'] as String?,
      lobbyingGroupId: json['lobbyingGroupId'] as String?,
      response: json['response'] as String,
    );

Map<String, dynamic> _$$TurnFeedbackResponseImplToJson(
        _$TurnFeedbackResponseImpl instance) =>
    <String, dynamic>{
      'partyId': instance.partyId,
      'lobbyingGroupId': instance.lobbyingGroupId,
      'response': instance.response,
    };

_$TurnBillAmendmentResponseImpl _$$TurnBillAmendmentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TurnBillAmendmentResponseImpl(
      billId: json['billId'] as String?,
      amendments: json['amendments'] == null
          ? const []
          : const StringListConverter().fromJson(json['amendments'] as Object),
    );

Map<String, dynamic> _$$TurnBillAmendmentResponseImplToJson(
        _$TurnBillAmendmentResponseImpl instance) =>
    <String, dynamic>{
      'billId': instance.billId,
      'amendments': const StringListConverter().toJson(instance.amendments),
    };

_$TurnResponseImpl _$$TurnResponseImplFromJson(Map<String, dynamic> json) =>
    _$TurnResponseImpl(
      representatives: (json['representatives'] as List<dynamic>?)
              ?.map((e) => TurnRepresentativeResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      bill: json['bill'] == null
          ? null
          : TurnBillResponse.fromJson(json['bill'] as Map<String, dynamic>),
      funding: json['funding'] == null
          ? null
          : TurnFundingResponse.fromJson(
              json['funding'] as Map<String, dynamic>),
      campaign: json['campaign'] == null
          ? null
          : TurnCampaignResponse.fromJson(
              json['campaign'] as Map<String, dynamic>),
      feedback: json['feedback'] == null
          ? null
          : TurnFeedbackResponse.fromJson(
              json['feedback'] as Map<String, dynamic>),
      incident: json['incident'] == null
          ? null
          : TurnIncidentResponse.fromJson(
              json['incident'] as Map<String, dynamic>),
      billAmendments: (json['billAmendments'] as List<dynamic>?)
              ?.map((e) =>
                  TurnBillAmendmentResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TurnResponseImplToJson(_$TurnResponseImpl instance) =>
    <String, dynamic>{
      'representatives':
          instance.representatives.map((e) => e.toJson()).toList(),
      'bill': instance.bill?.toJson(),
      'funding': instance.funding?.toJson(),
      'campaign': instance.campaign?.toJson(),
      'feedback': instance.feedback?.toJson(),
      'incident': instance.incident?.toJson(),
      'billAmendments': instance.billAmendments.map((e) => e.toJson()).toList(),
    };
