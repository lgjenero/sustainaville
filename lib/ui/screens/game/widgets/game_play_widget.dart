import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/screens/game/widgets/views/bills_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/views/campaign_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/views/lobby_group_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/views/lobby_groups_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/views/main_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/views/parlay_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/views/parties_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/views/party_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/views/profile_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/views/stats_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/views/voting_view.dart';

class GamePlayWidget extends ConsumerStatefulWidget {
  const GamePlayWidget({super.key});

  @override
  ConsumerState<GamePlayWidget> createState() => _GamePlayWidgetState();
}

class _GamePlayWidgetState extends ConsumerState<GamePlayWidget> {
  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.stop();
    FlameAudio.bgm.play('music/main_theme.mp3', volume: 0.05);
  }

  // @override
  // void dispose() {
  //   FlameAudio.bgm.stop();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final view = ref.watch(gameStateProvider.select((e) => e.view));

    return _buildView(view);
  }

  Widget _buildView(GameView view) {
    switch (view.type) {
      case GameViewType.main:
        return const MainView();
      case GameViewType.profile:
        return ProfileView(represenativeId: view.typeId);
      case GameViewType.bills:
        return BillsView(representativeId: view.typeId);
      case GameViewType.lobbyGroups:
        return LobbyGroupsView(lobbyingGroupId: view.typeId);
      case GameViewType.lobbyGroup:
        return LobbyGroupView(lobbyingGroupId: view.typeId!);
      case GameViewType.parties:
        return PartiesView(partyId: view.typeId);
      case GameViewType.party:
        return PartyView(partyId: view.typeId!);
      case GameViewType.parlay:
        return ParlayView(representativeId: view.typeId!);
      case GameViewType.campaign:
        return const CampaignView();
      case GameViewType.stats:
        return const StatsView();
      case GameViewType.vote:
        return const VotingView();
    }
  }
}
