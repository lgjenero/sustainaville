import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:sustainaville/components/room_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/data/representative.dart';
import 'package:sustainaville/services/onboarding/onboarding_tooltips.dart';
import 'package:sustainaville/services/user/user_data.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/dialogs/message/message_dialog.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';
import 'package:sustainaville/ui/widgets/onboarding_tooltip.dart';
import 'package:sustainaville/utils/constants/messages.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  void initState() {
    super.initState();
    final introOver = ref.read(gameStateProvider.select((e) => e.status != GameStatus.intro));
    if (!introOver) {
      Future.delayed(const Duration(milliseconds: 2500), () {
        if (!mounted) return;
        ref.read(gameStateProvider.notifier).introFinished();
        MessageDialog.show(context, introMessage).then((_) {
          if (!mounted) return;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(onboardingTooltipsProvider.notifier).setTooltipsEnabled(true);
          });
        });
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(onboardingTooltipsProvider.notifier).setTooltipsEnabled(true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final player = ref.watch(gameStateProvider.select((e) => e.representatives.first));
    final introOver = ref.watch(gameStateProvider.select((e) => e.status != GameStatus.intro));

    return Stack(
      children: [
        // background image
        Positioned(
          bottom: 32,
          left: 32,
          right: 32,
          top: 100,
          child: SafeArea(
            child: _buildRoom(player, !introOver),
          ),
        ),

        // menu
        Positioned(
          top: 8,
          right: 80,
          left: 80,
          child: SafeArea(
            bottom: false,
            child: AnimatedOpacity(
              opacity: introOver ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRepresentativesButton(ref),
                  _buildPartiesButton(ref),
                  _buildLobbyGroupsButton(ref),
                  _buildCampaignButton(ref),
                  _buildStats(ref),
                ],
              ),
            ),
          ),
        ),

        // vote button
        Positioned(
          bottom: 12,
          right: 24,
          child: SafeArea(
            left: false,
            top: false,
            child: AnimatedOpacity(
              opacity: introOver ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: _buildVote(ref),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRoom(Representative player, bool intro) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: RoomComponent(
          owner: intro ? null : Character.fromRepresentative(player),
          visitor: intro ? Character.fromRepresentative(player) : null,
          roomIndex: 0,
        ),
      ),
    );
  }

  Widget _buildRepresentativesButton(WidgetRef ref) {
    return OnboardingTooltipWidget(
      size: SizeLayout.medium,
      message: OnboardingTooltip.reps.tooltipMessage,
      type: OnboardingTooltip.reps,
      direction: TooltipDirection.down,
      onHide: () {
        ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.profile));
      },
      child: AppButton.text(
        'Reps',
        onPressed: () {
          ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.profile));
        },
      ),
    );
  }

  Widget _buildPartiesButton(WidgetRef ref) {
    final enabled =
        ref.watch(onboardingTooltipsProvider.select((e) => e.shownOrNextInLine.contains(OnboardingTooltip.parties)));
    return OnboardingTooltipWidget(
      size: SizeLayout.medium,
      message: OnboardingTooltip.parties.tooltipMessage,
      type: OnboardingTooltip.parties,
      direction: TooltipDirection.down,
      onHide: () {
        ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.parties));
      },
      child: AppButton.text(
        'Parties',
        enabled: enabled,
        onPressed: () {
          ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.parties));
        },
      ),
    );
  }

  Widget _buildLobbyGroupsButton(WidgetRef ref) {
    final enabled = ref.watch(
        onboardingTooltipsProvider.select((e) => e.shownOrNextInLine.contains(OnboardingTooltip.lobbyingGroups)));
    return OnboardingTooltipWidget(
      size: SizeLayout.medium,
      message: OnboardingTooltip.lobbyingGroups.tooltipMessage,
      type: OnboardingTooltip.lobbyingGroups,
      direction: TooltipDirection.down,
      onHide: () {
        ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.lobbyGroups));
      },
      child: AppButton.text(
        'Lobbies',
        enabled: enabled,
        onPressed: () {
          ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.lobbyGroups));
        },
      ),
    );
  }

  Widget _buildCampaignButton(WidgetRef ref) {
    final enabled =
        ref.watch(onboardingTooltipsProvider.select((e) => e.shownOrNextInLine.contains(OnboardingTooltip.campaigns)));
    return OnboardingTooltipWidget(
      size: SizeLayout.medium,
      message: OnboardingTooltip.campaigns.tooltipMessage,
      type: OnboardingTooltip.campaigns,
      direction: TooltipDirection.down,
      onHide: () {
        ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.campaign));
      },
      child: AppButton.text(
        'Campaign',
        enabled: enabled,
        onPressed: () {
          ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.campaign));
        },
      ),
    );
  }

  Widget _buildStats(WidgetRef ref) {
    final enabled =
        ref.watch(onboardingTooltipsProvider.select((e) => e.shownOrNextInLine.contains(OnboardingTooltip.stats)));
    return OnboardingTooltipWidget(
      size: SizeLayout.medium,
      message: OnboardingTooltip.stats.tooltipMessage,
      type: OnboardingTooltip.stats,
      direction: TooltipDirection.down,
      onHide: () {
        ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.stats));
      },
      child: AppButton.text(
        'Stats',
        enabled: enabled,
        onPressed: () {
          ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.stats));
        },
      ),
    );
  }

  Widget _buildVote(WidgetRef ref) {
    final enabled =
        ref.watch(onboardingTooltipsProvider.select((e) => e.shownOrNextInLine.contains(OnboardingTooltip.vote)));
    return OnboardingTooltipWidget(
      size: SizeLayout.medium,
      message: OnboardingTooltip.vote.tooltipMessage,
      type: OnboardingTooltip.vote,
      direction: TooltipDirection.up,
      onHide: () {
        ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.vote));
      },
      child: AppButton.text(
        'Vote',
        enabled: enabled,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        onPressed: () {
          ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.vote));
        },
      ),
    );
  }
}
