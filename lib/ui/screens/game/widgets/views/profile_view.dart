import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/data/representative.dart';
import 'package:sustainaville/services/onboarding/onboarding_tooltips.dart';
import 'package:sustainaville/services/user/user_data.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_avatar.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';
import 'package:sustainaville/ui/widgets/onboarding_tooltip.dart';
import 'package:sustainaville/utils/constants/colors.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class ProfileView extends ConsumerStatefulWidget {
  final String? represenativeId;

  const ProfileView({super.key, this.represenativeId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  Representative? _representative;

  @override
  void initState() {
    super.initState();

    final onboardingDone = ref.read(onboardingTooltipsProvider).shownTooltips.contains(OnboardingTooltip.repParlay);

    final representatives = ref.read(gameStateProvider).representatives;
    _representative = representatives.firstWhereOrNull((e) => e.id == widget.represenativeId) ??
        (onboardingDone ? representatives.firstOrNull : representatives.lastOrNull);
  }

  @override
  Widget build(BuildContext context) {
    final representatives = ref.watch(gameStateProvider.select((e) => e.representatives));

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
                const Text('Representatives', style: TextStyle(fontSize: 32)),
                const Opacity(opacity: 0, child: AppBackButton()),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 2, child: _buildList(representatives)),
                  const SizedBox(width: 12),
                  Expanded(flex: 5, child: _buildProfile(_representative)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<Representative> representatives) {
    return OnboardingTooltipWidget(
      type: OnboardingTooltip.repSelect,
      message: OnboardingTooltip.repSelect.tooltipMessage,
      direction: TooltipDirection.right,
      size: SizeLayout.medium,
      child: ListView.separated(
        itemCount: representatives.length,
        itemBuilder: (context, index) {
          final representative = representatives[index];

          return InkWell(
            onTap: () => setState(() => _representative = representative),
            child: ColoredBox(
              color: representative.id == _representative?.id
                  ? AppColors.gameForeground.withOpacity(0.4)
                  : Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: FittedBox(
                      child: ChatAvatar(character: Character.fromRepresentative(representative)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${representative.name}${index == 0 ? ' (You)' : ''}',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      ),
    );
  }

  Widget _buildProfile(Representative? representative) {
    if (representative == null) {
      return const Center(child: Text('Select a representative', style: TextStyle(fontSize: 24)));
    }

    return Consumer(builder: (context, ref, _) {
      final player = ref.read(gameStateProvider.select((e) => e.representatives.first));

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ChatAvatar(character: Character.fromRepresentative(representative)),
              const Spacer(),
              OnboardingTooltipWidget(
                type: OnboardingTooltip.repBills,
                message: OnboardingTooltip.repBills.tooltipMessage,
                direction: TooltipDirection.down,
                size: SizeLayout.medium,
                child: AppButton.text(
                  'Bills',
                  onPressed: () => ref
                      .read(gameStateProvider.notifier)
                      .goToView(GameView(type: GameViewType.bills, typeId: representative.id)),
                ),
              ),
              const SizedBox(width: 12),
              Opacity(
                opacity: representative.id == player.id ? 0 : 1,
                child: OnboardingTooltipWidget(
                  type: OnboardingTooltip.repParlay,
                  message: OnboardingTooltip.repParlay.tooltipMessage,
                  direction: TooltipDirection.down,
                  size: SizeLayout.medium,
                  child: AppButton.text(
                    'Parlay',
                    onPressed: () => ref
                        .read(gameStateProvider.notifier)
                        .goToView(GameView(type: GameViewType.parlay, typeId: representative.id)),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _buildProfileInfo(representative),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildProfileInfo(Representative representative) {
    return Consumer(
      builder: (context, ref, _) {
        final constituency = ref.read(
            gameStateProvider.select((e) => e.constituencies.firstWhere((e) => e.id == representative.constituencyId)));
        final party =
            ref.read(gameStateProvider.select((e) => e.parties.firstWhere((e) => e.id == representative.partyId)));
        final lobbyGroups = ref.read(gameStateProvider
            .select((e) => e.lobbyingGroups.where((e) => representative.lobbyingGroupIds.contains(e.id)).toList()));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDataRow('Name', representative.name),
            const SizedBox(height: 6),
            _buildDataRow('Party', party.name),
            const SizedBox(height: 6),
            _buildDataRow('Lobby Groups', lobbyGroups.map((e) => e.name).join(',')),
            const SizedBox(height: 6),
            _buildDataRow('Constituency', '${constituency.demography}\n${constituency.economy}'),
            const SizedBox(height: 6),
            _buildDataRow('Education', representative.education),
            const SizedBox(height: 6),
            _buildDataRow('Background', representative.personalBackground),
            const SizedBox(height: 6),
            _buildDataRow('Previous Occupation', representative.previousOccupation),
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
}
