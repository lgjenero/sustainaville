import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:sustainaville/data/party.dart';
import 'package:sustainaville/services/user/user_data.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';
import 'package:sustainaville/ui/widgets/onboarding_tooltip.dart';
import 'package:sustainaville/utils/constants/colors.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class PartiesView extends ConsumerStatefulWidget {
  final String? partyId;

  const PartiesView({this.partyId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PartiesViewState();
}

class _PartiesViewState extends ConsumerState<PartiesView> {
  Party? _party;

  @override
  void initState() {
    super.initState();

    final parties = ref.read(gameStateProvider).parties;
    _party = parties.firstWhereOrNull((e) => e.id == widget.partyId) ?? parties.firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    final parties = ref.watch(gameStateProvider.select((e) => e.parties));

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
                const Text('Parties', style: TextStyle(fontSize: 32)),
                const Opacity(opacity: 0, child: AppBackButton()),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _buildList(parties)),
                  const SizedBox(width: 12),
                  Expanded(flex: 3, child: _buildParty(_party)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<Party> parties) {
    return OnboardingTooltipWidget(
      type: OnboardingTooltip.partiesSelect,
      message: OnboardingTooltip.partiesSelect.tooltipMessage,
      direction: TooltipDirection.right,
      size: SizeLayout.medium,
      child: ListView.separated(
        itemCount: parties.length,
        itemBuilder: (context, index) {
          final party = parties[index];

          return InkWell(
            onTap: () => setState(() => _party = party),
            child: ColoredBox(
              color: party.id == _party?.id ? AppColors.gameForeground.withOpacity(0.4) : Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text(party.name, style: const TextStyle(fontSize: 24))),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      ),
    );
  }

  Widget _buildParty(Party? party) {
    if (party == null) {
      return const Center(child: Text('Select a Party', style: TextStyle(fontSize: 24)));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OnboardingTooltipWidget(
              type: OnboardingTooltip.partiesVisit,
              message: OnboardingTooltip.partiesVisit.tooltipMessage,
              direction: TooltipDirection.down,
              size: SizeLayout.medium,
              child: AppButton.text(
                'Visit',
                onPressed: () => _visitParty(party),
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: _buildPartyInfo(party),
          ),
        ),
      ],
    );
  }

  Widget _buildPartyInfo(Party party) {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDataRow('Name', party.name),
            const SizedBox(height: 6),
            _buildDataRow('Ideology', party.ideologicalStance),
            const SizedBox(height: 6),
            _buildDataRow('Support Base', party.supportBase.join('\n')),
            const SizedBox(height: 6),
            _buildDataRow('Key Policies', party.keyPolicies.join('\n')),
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

  void _visitParty(Party party) {
    ref.read(gameStateProvider.notifier).goToView(GameView(type: GameViewType.party, typeId: party.id));
  }
}
