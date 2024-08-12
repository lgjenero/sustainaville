import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sustainaville/data/bill.dart';
import 'package:sustainaville/data/campaign.dart';
import 'package:sustainaville/data/constituency.dart';
import 'package:sustainaville/data/lobbying_group.dart';
import 'package:sustainaville/data/party.dart';
import 'package:sustainaville/data/representative.dart';

part 'game_state_data.freezed.dart';
part 'game_state_data.g.dart';

enum GameStatus {
  loading,
  intro,
  ready,
  waitingForResponse,
  error,
}

enum GameViewType {
  main,
  profile,
  bills,
  lobbyGroups,
  lobbyGroup,
  parties,
  party,
  parlay,
  campaign,
  stats,
  vote,
}

enum GameCreationPhase {
  constituencies,
  lobbyingGroups,
  parties,
  representatives,
  bills,
}

@freezed
class GameView with _$GameView {
  const factory GameView({
    required GameViewType type,
    String? typeId,
  }) = _GameView;

  factory GameView.fromJson(Map<String, dynamic> json) => _$GameViewFromJson(json);
}

@freezed
class GameSatateData with _$GameSatateData {
  const factory GameSatateData({
    required GameStatus status,
    required GameCreationPhase creationPhase,
    required GameView view,
    required List<Representative> representatives,
    required List<Constituency> constituencies,
    required List<LobbyingGroup> lobbyingGroups,
    required List<Party> parties,
    required List<Bill> bills,
    required num constituency,
    required num publicOpinion,
    required num funds,
    required num sustainabiliyScore,
    required num greenScore,
    @Default([]) List<String> history,
    @Default([]) List<Campaign> campaigns,
  }) = _GameSatateData;

  factory GameSatateData.fromJson(Map<String, dynamic> json) => _$GameSatateDataFromJson(json);
}
