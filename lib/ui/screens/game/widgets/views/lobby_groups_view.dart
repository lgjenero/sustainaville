import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:sustainaville/data/lobbying_group.dart';
import 'package:sustainaville/services/user/user_data.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';
import 'package:sustainaville/ui/widgets/onboarding_tooltip.dart';
import 'package:sustainaville/utils/constants/colors.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class LobbyGroupsView extends ConsumerStatefulWidget {
  final String? lobbyingGroupId;

  const LobbyGroupsView({this.lobbyingGroupId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LobbyGroupsViewState();
}

class _LobbyGroupsViewState extends ConsumerState<LobbyGroupsView> {
  LobbyingGroup? _lobbyingGroup;

  @override
  void initState() {
    super.initState();
    final lobbyingGroups = ref.read(gameStateProvider).lobbyingGroups;
    _lobbyingGroup =
        lobbyingGroups.firstWhereOrNull((e) => e.id == widget.lobbyingGroupId) ?? lobbyingGroups.firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    final lobbyingGroups = ref.watch(gameStateProvider.select((e) => e.lobbyingGroups));

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBackButton(
                    onPressed: () =>
                        ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.main))),
                const Text('Lobbying Groups', style: TextStyle(fontSize: 32)),
                const Opacity(opacity: 0, child: AppBackButton()),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _buildList(lobbyingGroups)),
                  const SizedBox(width: 12),
                  Expanded(flex: 3, child: _buildGroup(_lobbyingGroup)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<LobbyingGroup> lobbyingGroups) {
    return OnboardingTooltipWidget(
      type: OnboardingTooltip.lobbyingGroupsSelect,
      message: OnboardingTooltip.lobbyingGroupsSelect.tooltipMessage,
      direction: TooltipDirection.right,
      size: SizeLayout.medium,
      child: ListView.separated(
        itemCount: lobbyingGroups.length,
        itemBuilder: (context, index) {
          final lobbyingGroup = lobbyingGroups[index];

          return InkWell(
            onTap: () => setState(() => _lobbyingGroup = lobbyingGroup),
            child: ColoredBox(
              color: lobbyingGroup.id == _lobbyingGroup?.id
                  ? AppColors.gameForeground.withOpacity(0.4)
                  : Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text(lobbyingGroup.name, style: const TextStyle(fontSize: 24))),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      ),
    );
  }

  Widget _buildGroup(LobbyingGroup? lobbyingGroup) {
    if (lobbyingGroup == null) {
      return const Center(child: Text('Select a Lobbying Group', style: TextStyle(fontSize: 24)));
    }

    return Consumer(builder: (context, ref, _) {
      final player = ref.read(gameStateProvider.select((e) => e.representatives.first));

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OnboardingTooltipWidget(
                type: OnboardingTooltip.lobbyingGroupsVisit,
                message: OnboardingTooltip.lobbyingGroupsVisit.tooltipMessage,
                direction: TooltipDirection.down,
                size: SizeLayout.medium,
                child: AppButton.text(
                  'Visit',
                  onPressed: () => _visit(lobbyingGroup),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _buildGroupInfo(lobbyingGroup),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildGroupInfo(LobbyingGroup lobbyingGroup) {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDataRow('Name', lobbyingGroup.name),
            const SizedBox(height: 6),
            _buildDataRow('Agenda', lobbyingGroup.agenda),
            const SizedBox(height: 6),
            _buildDataRow('Support', lobbyingGroup.supportBase.join('\n')),
            const SizedBox(height: 6),
            _buildDataRow('Areas of Influence', lobbyingGroup.areasOfInfluence),
            const SizedBox(height: 6),
            _buildDataRow('Influence', lobbyingGroup.influenceLevel),
            const SizedBox(height: 6),
            _buildDataRow('Financials', lobbyingGroup.financialStrength),
            const SizedBox(height: 6),
          ],
        );
      },
    );
  }

  Widget _buildDataRow(String label, String? value, {Widget? valueWidget}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Expanded(
          child: value != null
              ? Text(value, style: const TextStyle(fontSize: 24))
              : valueWidget ?? const SizedBox.shrink(),
        ),
      ],
    );
  }

  void _visit(LobbyingGroup lobbyingGroup) {
    ref.read(gameStateProvider.notifier).goToView(GameView(type: GameViewType.lobbyGroup, typeId: lobbyingGroup.id));
  }
}
