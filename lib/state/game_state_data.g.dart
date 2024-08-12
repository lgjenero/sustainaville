// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameViewImpl _$$GameViewImplFromJson(Map<String, dynamic> json) =>
    _$GameViewImpl(
      type: $enumDecode(_$GameViewTypeEnumMap, json['type']),
      typeId: json['typeId'] as String?,
    );

Map<String, dynamic> _$$GameViewImplToJson(_$GameViewImpl instance) =>
    <String, dynamic>{
      'type': _$GameViewTypeEnumMap[instance.type]!,
      'typeId': instance.typeId,
    };

const _$GameViewTypeEnumMap = {
  GameViewType.main: 'main',
  GameViewType.profile: 'profile',
  GameViewType.bills: 'bills',
  GameViewType.lobbyGroups: 'lobbyGroups',
  GameViewType.lobbyGroup: 'lobbyGroup',
  GameViewType.parties: 'parties',
  GameViewType.party: 'party',
  GameViewType.parlay: 'parlay',
  GameViewType.campaign: 'campaign',
  GameViewType.stats: 'stats',
  GameViewType.vote: 'vote',
};

_$GameSatateDataImpl _$$GameSatateDataImplFromJson(Map<String, dynamic> json) =>
    _$GameSatateDataImpl(
      status: $enumDecode(_$GameStatusEnumMap, json['status']),
      creationPhase:
          $enumDecode(_$GameCreationPhaseEnumMap, json['creationPhase']),
      view: GameView.fromJson(json['view'] as Map<String, dynamic>),
      representatives: (json['representatives'] as List<dynamic>)
          .map((e) => Representative.fromJson(e as Map<String, dynamic>))
          .toList(),
      constituencies: (json['constituencies'] as List<dynamic>)
          .map((e) => Constituency.fromJson(e as Map<String, dynamic>))
          .toList(),
      lobbyingGroups: (json['lobbyingGroups'] as List<dynamic>)
          .map((e) => LobbyingGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      parties: (json['parties'] as List<dynamic>)
          .map((e) => Party.fromJson(e as Map<String, dynamic>))
          .toList(),
      bills: (json['bills'] as List<dynamic>)
          .map((e) => Bill.fromJson(e as Map<String, dynamic>))
          .toList(),
      constituency: json['constituency'] as num,
      publicOpinion: json['publicOpinion'] as num,
      funds: json['funds'] as num,
      sustainabiliyScore: json['sustainabiliyScore'] as num,
      greenScore: json['greenScore'] as num,
      history: (json['history'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      campaigns: (json['campaigns'] as List<dynamic>?)
              ?.map((e) => Campaign.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GameSatateDataImplToJson(
        _$GameSatateDataImpl instance) =>
    <String, dynamic>{
      'status': _$GameStatusEnumMap[instance.status]!,
      'creationPhase': _$GameCreationPhaseEnumMap[instance.creationPhase]!,
      'view': instance.view.toJson(),
      'representatives':
          instance.representatives.map((e) => e.toJson()).toList(),
      'constituencies': instance.constituencies.map((e) => e.toJson()).toList(),
      'lobbyingGroups': instance.lobbyingGroups.map((e) => e.toJson()).toList(),
      'parties': instance.parties.map((e) => e.toJson()).toList(),
      'bills': instance.bills.map((e) => e.toJson()).toList(),
      'constituency': instance.constituency,
      'publicOpinion': instance.publicOpinion,
      'funds': instance.funds,
      'sustainabiliyScore': instance.sustainabiliyScore,
      'greenScore': instance.greenScore,
      'history': instance.history,
      'campaigns': instance.campaigns.map((e) => e.toJson()).toList(),
    };

const _$GameStatusEnumMap = {
  GameStatus.loading: 'loading',
  GameStatus.intro: 'intro',
  GameStatus.ready: 'ready',
  GameStatus.waitingForResponse: 'waitingForResponse',
  GameStatus.error: 'error',
};

const _$GameCreationPhaseEnumMap = {
  GameCreationPhase.constituencies: 'constituencies',
  GameCreationPhase.lobbyingGroups: 'lobbyingGroups',
  GameCreationPhase.parties: 'parties',
  GameCreationPhase.representatives: 'representatives',
  GameCreationPhase.bills: 'bills',
};
