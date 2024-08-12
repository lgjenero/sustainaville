import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/screens/game/widgets/creation_views/bill_creation_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/creation_views/constituency_creation_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/creation_views/lobby_groups_creation_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/creation_views/parties_creation_view.dart';
import 'package:sustainaville/ui/screens/game/widgets/creation_views/representatives_creation_view.dart';

class GameCreationWidget extends ConsumerStatefulWidget {
  const GameCreationWidget({super.key});

  @override
  ConsumerState<GameCreationWidget> createState() => _GameCreationWidgetState();
}

class _GameCreationWidgetState extends ConsumerState<GameCreationWidget> {
  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.stop();
    FlameAudio.bgm.play('music/loading.mp3', volume: 0.05);

    FlameAudio.audioCache.loadAll([
      'sfx/door_open.mp3',
      'sfx/door_close.mp3',
      'sfx_loops/walking.mp3',
      'sfx_loops/talking.mp3',
    ]);
  }

  // @override
  // void dispose() {
  //   FlameAudio.bgm.stop();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final phase = ref.watch(gameStateProvider.select((e) => e.creationPhase));

    return _buildView(phase);
  }

  Widget _buildView(GameCreationPhase phase) {
    switch (phase) {
      case GameCreationPhase.constituencies:
        return const ConstituencyCreationView();
      case GameCreationPhase.lobbyingGroups:
        return const LobbyGroupsCreationView();
      case GameCreationPhase.parties:
        return const PartiesCreationView();
      case GameCreationPhase.representatives:
        return const RepresentativesCreationView();
      case GameCreationPhase.bills:
        return const BillCreationView();
    }
  }
}
