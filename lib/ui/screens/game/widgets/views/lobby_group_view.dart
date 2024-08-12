import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/components/lobby_group_office_component.dart';
import 'package:sustainaville/components/thinking_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/data/lobbying_group.dart';
import 'package:sustainaville/data/representative.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/dialogs/message/message_dialog.dart';
import 'package:sustainaville/ui/snackbars/snackbar_state.dart';
import 'package:sustainaville/ui/snackbars/snackbars.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class LobbyGroupView extends ConsumerStatefulWidget {
  final String lobbyingGroupId;

  const LobbyGroupView({required this.lobbyingGroupId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LobbyGroupViewState();
}

class _LobbyGroupViewState extends ConsumerState<LobbyGroupView> {
  late final LobbyingGroup _lobbyingGroup;
  late final Representative _player;
  final TextEditingController _controller = TextEditingController();
  bool _animating = false;
  bool _loading = false;
  ThinkingType? _thinkingType;
  LobbyGroupOfficeComponentAction _action = LobbyGroupOfficeComponentAction.enter;

  @override
  void initState() {
    super.initState();
    _lobbyingGroup =
        ref.read(gameStateProvider.select((e) => e.lobbyingGroups.firstWhere((e) => e.id == widget.lobbyingGroupId)));
    _player = ref.read(gameStateProvider.select((e) => e.representatives.first));

    _animateEntering();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // background
          Positioned.fill(
            top: 90,
            left: 32,
            right: 32,
            bottom: 32,
            child: FittedBox(
              child: LobbyGroupOfficeComponent(
                lobbyGroup: _lobbyingGroup,
                visitor: Character.fromRepresentative(_player),
                action: _action,
                thinkingType: _thinkingType,
              ),
            ),
          ),

          // chat
          Positioned(
            top: 90,
            left: 20,
            right: 20,
            bottom: 12,
            child: AnimatedOpacity(
              opacity: _animating ? 0 : 1,
              duration: const Duration(milliseconds: 500),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 180,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: [AppColors.gameBackground, AppColors.gameBackground.withOpacity(0)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppButton.text(
                            'Ask for funds',
                            enabled: !_loading,
                            onPressed: () => _askForFunds(_lobbyingGroup),
                          ),
                          AppButton.text(
                            'Ask for feedback',
                            enabled: !_loading,
                            onPressed: () => _askForFeedback(_lobbyingGroup),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 24),
                      // const Expanded(child: ChatBubble(child: SizedBox.shrink())),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // top header
          Positioned(
            top: 12,
            left: 20,
            right: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  ignoring: _animating || _loading,
                  child: Opacity(
                    opacity: _animating || _loading ? 0.4 : 1,
                    child: AppBackButton(
                      onPressed: _animateExiting,
                    ),
                  ),
                ),
                Text(_lobbyingGroup.name, style: const TextStyle(fontSize: 32)),
                const Opacity(opacity: 0, child: AppBackButton()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _askForFunds(LobbyingGroup lobbyingGroup) async {
    setState(() {
      _loading = true;
      _thinkingType = ThinkingType.dollars;
    });
    final response = await ref.read(gameStateProvider.notifier).askForFunds(lobbyingGroup.id);
    final funds = response?.funding?.amount ?? 0;
    if (funds <= 0) {
      ref.read(gameSnackbarStateProvider.notifier).scheduleSnackbar(GameSnackbars.fundingFailed(
            constituency: response?.funding?.constituency ?? 0,
            publicOpinion: response?.funding?.publicOpinion ?? 0,
          ));
    } else {
      ref.read(gameSnackbarStateProvider.notifier).scheduleSnackbar(GameSnackbars.fundingSuccess(
            funds: funds,
            constituency: response?.funding?.constituency ?? 0,
            publicOpinion: response?.funding?.publicOpinion ?? 0,
          ));
    }
    setState(() {
      _loading = false;
      _thinkingType = null;
    });
  }

  Future<void> _askForFeedback(LobbyingGroup lobbyingGroup) async {
    setState(() {
      _loading = true;
      _thinkingType = ThinkingType.questionBlue;
    });
    final response = await ref.read(gameStateProvider.notifier).askForFeedback(lobbyingGroupId: lobbyingGroup.id);
    final feedback = response?.feedback?.response;
    if (feedback != null) {
      if (mounted) MessageDialog.show(context, feedback);
    } else {
      ref.read(gameSnackbarStateProvider.notifier).scheduleSnackbar(GameSnackbars.feedbackFailed());
    }
    setState(() {
      _loading = false;
      _thinkingType = null;
    });
  }

  void _animateEntering() {
    setState(() {
      _animating = true;
      _action = LobbyGroupOfficeComponentAction.enter;
    });

    Future.delayed(const Duration(milliseconds: 3000), () {
      if (!mounted) return;

      setState(() {
        _animating = false;
        _action = LobbyGroupOfficeComponentAction.talking;
      });
    });
  }

  void _animateExiting() {
    setState(() {
      _animating = true;
      _action = LobbyGroupOfficeComponentAction.exit;
    });

    Future.delayed(const Duration(milliseconds: 3000), () {
      if (!mounted) return;
      ref
          .read(gameStateProvider.notifier)
          .goToView(GameView(type: GameViewType.lobbyGroups, typeId: widget.lobbyingGroupId));
    });
  }
}
