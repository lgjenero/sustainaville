import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

enum OnboardingTooltip {
  reps('Tap here to go to\nRepresentatives screen'),
  // reps screen
  repSelect('Here you can select Representatives\nto see more info about them'),
  repBills('Here you can see all the\nbills sponsored by this representative'),
  repParlay('Here you can talk to the representative'),

  parties('Tap here to go to\nParties screen'),
  // parties screen
  partiesSelect('Here you can select Parties\nto see more info about them'),
  partiesVisit('Here you can visit the\nparty HQ and ask for some feedback'),

  lobbyingGroups('Tap here to go to\nLobby groups screen'),
  // lobbies screen
  lobbyingGroupsSelect('Here you can select Lobby groups\nto see more info about them'),
  lobbyingGroupsVisit('Here you can visit the Lobby Group HQ\nand ask for some funds ans/or feedback'),

  campaigns('Tap here to go to\nCampaings screen'),
  // campaigns screen
  campaignsCreate('Here you can create a new campaign'),
  campaignsGroupsSelect('Here you can select previous campaigns\nto see more info about them'),

  stats('Tap here to go to\nStats screen'),
  vote('Tap here to go to\nVoting screen'),
  // vote screen
  voteSelect('Here you can select bills to vote on\nto see more info about them and cast your votes'),
  voteInitiate('Here you can select start the voting');

  final String tooltipMessage;
  const OnboardingTooltip(this.tooltipMessage);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    @Default('UN') String countryCode,
    @Default(0) int finishedLevel,
    @Default([]) List<String> achievements,
    @Default(false) bool introShown,
    @Default({}) Set<OnboardingTooltip> onboardingTooltipsShown,
    @Default('UN') String flag,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}
