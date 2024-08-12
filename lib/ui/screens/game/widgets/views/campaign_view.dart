import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:sustainaville/components/tv_studio_component.dart';
import 'package:sustainaville/data/campaign.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/services/user/user_data.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_bubble.dart';
import 'package:sustainaville/ui/snackbars/snackbar_state.dart';
import 'package:sustainaville/ui/snackbars/snackbars.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';
import 'package:sustainaville/ui/widgets/loading_text_widget.dart';
import 'package:sustainaville/ui/widgets/onboarding_tooltip.dart';
import 'package:sustainaville/utils/constants/colors.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class CampaignView extends ConsumerStatefulWidget {
  const CampaignView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CampaignViewState();
}

class _CampaignViewState extends ConsumerState<CampaignView> {
  bool _showInput = false;
  Campaign? _campaign;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  bool _runningCampaign = false;

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // content
        Positioned.fill(child: _buildContent(context)),

        // input
        if (_showInput)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: ColoredBox(
                color: AppColors.gameBackground.withOpacity(0.4),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppBackButton(onPressed: () => setState(() => _showInput = false)),
                            const Text('Create a new campaign', style: TextStyle(fontSize: 32)),
                            const Opacity(opacity: 0, child: AppBackButton()),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildInput(),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final campaigns = ref.read(gameStateProvider.select((e) => e.campaigns));
    final player = ref.read(gameStateProvider.select((e) => e.representatives.first));

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            IgnorePointer(
              ignoring: _runningCampaign,
              child: Opacity(
                opacity: _runningCampaign ? 0.4 : 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBackButton(
                        onPressed: () =>
                            ref.read(gameStateProvider.notifier).goToView(const GameView(type: GameViewType.main))),
                    const Text('Campaigns', style: TextStyle(fontSize: 32)),
                    const Opacity(opacity: 0, child: AppBackButton()),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _buildList(campaigns)),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (_runningCampaign) const LoadingTextWidget(text: 'Running campaign'),
                              Expanded(
                                child: TvStudioComponent(
                                  guest: Character.fromRepresentative(player),
                                  play: true,
                                  runDiscussion: _runningCampaign,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(child: _buildCampaign(_campaign)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<Campaign> campaigns) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OnboardingTooltipWidget(
          type: OnboardingTooltip.campaignsCreate,
          message: OnboardingTooltip.campaignsCreate.tooltipMessage,
          direction: TooltipDirection.down,
          size: SizeLayout.medium,
          child: AppButton.text(
            'Create a new campaign',
            enabled: !_runningCampaign,
            onPressed: () => setState(() => _showInput = true),
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: OnboardingTooltipWidget(
            type: OnboardingTooltip.campaignsGroupsSelect,
            message: OnboardingTooltip.campaignsGroupsSelect.tooltipMessage,
            direction: TooltipDirection.right,
            size: SizeLayout.medium,
            child: ChatBubble(
              child: _buildCampaignList(campaigns),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCampaignList(List<Campaign> campaigns) {
    if (campaigns.isEmpty) {
      return const Center(child: Text('No campaigns yet', style: TextStyle(fontSize: 24)));
    }

    return ListView.separated(
      itemCount: campaigns.length,
      itemBuilder: (context, index) {
        final campaign = campaigns[index];

        return InkWell(
          onTap: () => setState(() => _campaign = campaign),
          child: ColoredBox(
            color: campaign.id == _campaign?.id ? AppColors.gameForeground.withOpacity(0.4) : Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    campaign.name,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
    );
  }

  Widget _buildCampaign(Campaign? campaign) {
    if (campaign == null) {
      return const SizedBox.shrink();
    }

    return Consumer(builder: (context, ref, _) {
      final player = ref.read(gameStateProvider.select((e) => e.representatives.first));

      return ChatBubble(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  campaign.name,
                  style: const TextStyle(fontSize: 32),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: _buildCampaignInfo(campaign),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildCampaignInfo(Campaign campaign) {
    final constituency = campaign.constituency ?? 0;
    final publicOpinion = campaign.publicOpinion ?? 0;

    return Consumer(
      builder: (context, ref, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDataRow('Description', campaign.description),
            const SizedBox(height: 6),
            _buildDataRow('Cost', campaign.amount.toString()),
            const SizedBox(height: 6),
            _buildDataRow('Result', campaign.result),
            const SizedBox(height: 6),
            if (constituency != 0) ...[
              _buildDataRow('Constituency', constituency > 0 ? '+$constituency' : constituency.toString()),
              const SizedBox(height: 6),
            ],
            if (publicOpinion != 0) ...[
              _buildDataRow('Public Opinion', publicOpinion > 0 ? '+$publicOpinion' : publicOpinion.toString()),
              const SizedBox(height: 6),
            ],
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

  Widget _buildInput() {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(gameStateProvider.select((e) => e.status));
        final isLoading = state == GameStatus.waitingForResponse;
        final isError = state == GameStatus.error;

        return Stack(
          children: [
            child!,
            if (isLoading)
              Positioned.fill(
                child: ColoredBox(
                  color: AppColors.gameBackground.withOpacity(0.4),
                ),
              ),
          ],
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ChatBubble(
              child: TextField(
                controller: _controller,
                focusNode: _focus,
                maxLines: 5,
                minLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Describe the campaign...',
                  border: InputBorder.none,
                  isCollapsed: true,
                ),
                style: const TextStyle(fontSize: 24),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) => _runCampaign(value),
                onTapOutside: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          AppButton.text(
            'Create',
            onPressed: () => _runCampaign(_controller.text),
          )
        ],
      ),
    );
  }

  void _runCampaign(String description) async {
    final trimmedDescription = description.trim();
    if (trimmedDescription.isEmpty) return;

    final funds = ref.read(gameStateProvider.select((e) => e.funds));
    if (funds <= 0) {
      ref.read(gameSnackbarStateProvider.notifier).scheduleSnackbar(GameSnackbars.campaignNotEnoughFunds());
      return;
    }

    setState(() {
      _runningCampaign = true;
      _showInput = false;
      _campaign = null;
    });
    final response = await ref.read(gameStateProvider.notifier).runCampaign(description);

    final campaign = response?.campaign;
    if (campaign != null) {
      ref.read(gameSnackbarStateProvider.notifier).scheduleSnackbar(GameSnackbars.campaignExecuted(
            funds: campaign.amount ?? 0,
            constituency: campaign.constituency ?? 0,
            publicOpinion: campaign.publicOpinion ?? 0,
          ));
      _controller.clear();
    }
    setState(() {
      _runningCampaign = false;
      _campaign = ref.read(gameStateProvider.select((e) => e.campaigns.firstWhereOrNull((e) => e.id == campaign?.id)));
    });
    if (campaign == null) {
      _focus.requestFocus();
    }
  }
}
