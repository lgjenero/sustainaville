import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/components/party_office_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/data/party.dart';
import 'package:sustainaville/data/representative.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_bubble.dart';
import 'package:sustainaville/ui/dialogs/message/message_dialog.dart';
import 'package:sustainaville/ui/snackbars/snackbar_state.dart';
import 'package:sustainaville/ui/snackbars/snackbars.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class PartyView extends ConsumerStatefulWidget {
  final String partyId;
  const PartyView({required this.partyId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PartyViewState();
}

class _PartyViewState extends ConsumerState<PartyView> {
  late final Party _party;
  late final Representative _player;
  bool _animating = false;
  bool _loading = false;
  String? _message;
  PartyOfficeComponentAction _action = PartyOfficeComponentAction.enter;

  @override
  void initState() {
    super.initState();
    _party = ref.read(gameStateProvider.select((e) => e.parties.firstWhere((e) => e.id == widget.partyId)));
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
              child: PartyOfficeComponent(
                party: _party,
                visitor: Character.fromRepresentative(_player),
                action: _action,
                isThinking: _loading,
              ),
            ),
          ),

          // content
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
                            'Ask for feedback',
                            enabled: !(_animating || _loading),
                            onPressed: () => _askForFeedback(_party),
                          ),
                        ],
                      ),
                      if (_message != null) ...[
                        const SizedBox(height: 24),
                        const Expanded(child: ChatBubble(child: SizedBox.expand())),
                      ],
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
                Expanded(child: Text(_party.name, style: const TextStyle(fontSize: 32), textAlign: TextAlign.center)),
                const Opacity(opacity: 0, child: AppBackButton()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _askForFeedback(Party party) async {
    setState(() => _loading = true);
    final response = await ref.read(gameStateProvider.notifier).askForFeedback(partyId: party.id);
    final feedback = response?.feedback?.response;
    if (feedback != null) {
      if (mounted) MessageDialog.show(context, feedback);
    } else {
      ref.read(gameSnackbarStateProvider.notifier).scheduleSnackbar(GameSnackbars.feedbackFailed());
    }
    setState(() => _loading = false);
  }

  void _animateEntering() {
    setState(() {
      _animating = true;
      _action = PartyOfficeComponentAction.enter;
    });

    Future.delayed(const Duration(milliseconds: 3000), () {
      if (!mounted) return;

      setState(() {
        _animating = false;
        _action = PartyOfficeComponentAction.talking;
      });
    });
  }

  void _animateExiting() {
    setState(() {
      _animating = true;
      _action = PartyOfficeComponentAction.exit;
    });

    Future.delayed(const Duration(milliseconds: 3000), () {
      if (!mounted) return;
      ref.read(gameStateProvider.notifier).goToView(GameView(type: GameViewType.parties, typeId: widget.partyId));
    });
  }
}
