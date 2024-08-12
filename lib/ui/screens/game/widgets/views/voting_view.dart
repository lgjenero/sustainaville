import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:sustainaville/components/parliament_component.dart';
import 'package:sustainaville/data/bill.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/data/representative.dart';
import 'package:sustainaville/services/user/user_data.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_bubble.dart';
import 'package:sustainaville/ui/dialogs/confirmation_dialog/confirmation_dialog.dart';
import 'package:sustainaville/ui/dialogs/message/message_dialog.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';
import 'package:sustainaville/ui/widgets/app_checkbox_button.dart';
import 'package:sustainaville/ui/widgets/onboarding_tooltip.dart';
import 'package:sustainaville/utils/constants/colors.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class VotingView extends ConsumerStatefulWidget {
  const VotingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VotingViewState();
}

class _VotingViewState extends ConsumerState<VotingView> {
  Bill? _bill;
  late final Representative _player;
  late final List<Representative> _representatives;
  late List<Bill> _billsToVote;
  bool _voted = false;
  final Map<String, bool> _playerVotes = {};
  Bill? _billVotedOn;

  @override
  void initState() {
    super.initState();
    final bills = ref.read(gameStateProvider.select((e) => e.bills));
    _billsToVote = _getBillsToVote(bills);
    _representatives = ref.read(gameStateProvider.select((e) => e.representatives));
    _player = _representatives.first;
    final playersBill = _billsToVote.firstWhereOrNull((e) => e.sponsorId == _player.id);
    if (playersBill != null) {
      _playerVotes[playersBill.id] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final speaker = _representatives.firstWhereOrNull((e) => e.id == _billVotedOn?.sponsorId);
    final listeners = _representatives.whereNot((e) => e.id == _billVotedOn?.sponsorId);

    return SafeArea(
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
                const Text('Bills up for vote', style: TextStyle(fontSize: 32)),
                const Opacity(opacity: 0, child: AppBackButton()),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _buildList(_billsToVote)),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ParliamentComponent(
                          speaker: speaker != null ? Character.fromRepresentative(speaker) : null,
                          listeners: listeners.map((e) => Character.fromRepresentative(e)).toList(),
                          runDiscussion: _billVotedOn != null,
                        ),
                        Positioned.fill(child: _buildBill(_bill)),
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

  Widget _buildList(List<Bill> bills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OnboardingTooltipWidget(
          type: OnboardingTooltip.voteInitiate,
          message: OnboardingTooltip.voteInitiate.tooltipMessage,
          direction: TooltipDirection.down,
          size: SizeLayout.medium,
          child: AppButton.text(
            'Initiate vote',
            enabled: !_voted,
            onPressed: () => _askForVote(_billsToVote),
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: OnboardingTooltipWidget(
            type: OnboardingTooltip.voteSelect,
            message: OnboardingTooltip.voteSelect.tooltipMessage,
            direction: TooltipDirection.right,
            size: SizeLayout.medium,
            child: ChatBubble(
              child: ListView.separated(
                itemCount: bills.length,
                itemBuilder: (context, index) {
                  final bill = bills[index];

                  return InkWell(
                    onTap: () => setState(() {
                      if (_bill?.id == bill.id) {
                        _bill = null;
                      } else {
                        _bill = bill;
                      }
                    }),
                    child: Container(
                      color: bill.id == _bill?.id ? AppColors.gameForeground.withOpacity(0.2) : null,
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text(bill.name, style: const TextStyle(fontSize: 24))),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBill(Bill? bill) {
    if (_billVotedOn != null) {
      return Align(
        alignment: Alignment.topCenter,
        child: Text('Voting on:\n${_billVotedOn?.name}', style: const TextStyle(fontSize: 24)),
      );
    }

    if (bill == null) {
      return const Align(alignment: Alignment.topCenter, child: Text('Select a bill', style: TextStyle(fontSize: 24)));
    }

    final votedFor = _playerVotes[bill.id];

    return ChatBubble(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (!_voted) ...[
                Opacity(
                  opacity: votedFor == true ? 1 : 0.4,
                  child: AppButton.text(
                    '✅ For',
                    onPressed: () => setState(() => _playerVotes[bill.id] = true),
                  ),
                ),
                const SizedBox(width: 24),
                Opacity(
                  opacity: votedFor == false ? 1 : 0.4,
                  child: AppButton.text(
                    '❌ Against',
                    onPressed: () => setState(() => _playerVotes[bill.id] = false),
                  ),
                ),
              ],
              const Spacer(),
              AppBackButton(
                onPressed: () => setState(() => _bill = null),
              )
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              child: _buildBillInfo(bill),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillInfo(Bill bill) {
    return Consumer(
      builder: (context, ref, _) {
        final sponsor =
            ref.watch(gameStateProvider.select((e) => e.representatives.firstWhere((e) => e.id == bill.sponsorId)));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDataRow('ID', bill.id),
            const SizedBox(height: 6),
            _buildDataRow('Name', bill.name),
            const SizedBox(height: 6),
            _buildDataRow('Description', bill.description),
            const SizedBox(height: 6),
            _buildDataRow('Sponsor', '${sponsor.name}${sponsor.id == _player.id ? ' (You)' : ''}'),
            const SizedBox(height: 6),
            _buildAmendments(bill),
            const SizedBox(height: 6),
            _buildDataRow(
                'Status',
                bill.passed == true
                    ? '✅ Passed'
                    : bill.passed == false
                        ? '❌ Failed'
                        : 'Not voted yet'),
            const SizedBox(height: 6),
            _buildVotes(bill),
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

  Widget _buildAmendments(Bill bill) {
    return Consumer(builder: (context, ref, _) {
      final updatedBill = ref.watch(gameStateProvider.select((e) => e.bills.firstWhere((e) => e.id == bill.id)));

      if (updatedBill.suggestedAmendments.isEmpty) {
        return const SizedBox.shrink();
      }

      final amendmentsList = updatedBill.passed != null ? updatedBill.suggestedAmendments : updatedBill.amendments;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Amendments:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          ...amendmentsList.map((amendment) {
            final isSelected = updatedBill.amendments.contains(amendment);

            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppCheckboxButton(
                    value: isSelected,
                    enabled: bill.passed == null,
                    onPressed: () {
                      ref.read(gameStateProvider.notifier).toggleAmendment(updatedBill.id, amendment);
                    },
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(amendment, style: const TextStyle(fontSize: 24)),
                  )
                ],
              ),
            );
          }),
          const SizedBox(height: 6),
        ],
      );
    });
  }

  Widget _buildVotes(Bill bill) {
    if (bill.passed == null || (bill.votedFor.isEmpty && bill.votedAgainst.isEmpty)) {
      return const SizedBox.shrink();
    }

    return Consumer(builder: (context, ref, _) {
      final representatives = ref.watch(gameStateProvider.select((e) => e.representatives));

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Votes:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          ...representatives.map((rep) {
            final isFor = bill.votedFor.contains(rep.id);
            final isAgainst = bill.votedAgainst.contains(rep.id);

            if (isFor) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('${rep.name}: ✅ Yes', style: const TextStyle(fontSize: 24)),
              );
            } else if (isAgainst) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('${rep.name}: ❌ No', style: const TextStyle(fontSize: 24)),
              );
            }
            return const SizedBox.shrink();
          }),
          Text(
            'Total: FOR(${bill.votedFor.length}) | AGAINST(${bill.votedAgainst.length})',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
        ],
      );
    });
  }

  List<Bill> _getBillsToVote(List<Bill> bills) {
    final representativeIds = <String>{};
    final billsToVote = <Bill>[];

    for (final bill in bills) {
      if (bill.passed != null) continue;
      if (representativeIds.contains(bill.sponsorId)) continue;

      representativeIds.add(bill.sponsorId);
      billsToVote.add(bill);
    }

    return billsToVote;
  }

  void _askForVote(List<Bill> bills) async {
    if (_playerVotes.length < bills.length) {
      MessageDialog.show(context, 'Please cast your votes for all bills');
      return;
    }

    final result = await ConfirmationDialog.show(
      context,
      'Are you sure you want to initiate the vote?',
      cancelText: 'Not yet',
      confirmText: 'Yes, let\'s go',
    );
    if (result != true) return;

    if (!mounted) return;

    final openedBill = _bill;
    for (final bill in bills) {
      setState(() {
        _bill = null;
        _billVotedOn = bill;
      });

      List<String>? amendments;
      if (bill.sponsorId == _player.id) {
        if (bill.amendments.isNotEmpty) amendments = bill.amendments;
      }

      await ref.read(gameStateProvider.notifier).putBillToVote(
            bill.id,
            _playerVotes[bill.id] == true ? 'FOR' : 'AGAINST',
            amendments: amendments,
          );
    }

    final updatedBills = ref.watch(gameStateProvider.select((e) => e.bills));
    setState(() {
      _billsToVote = bills.map((e) => updatedBills.firstWhere((element) => element.id == e.id)).toList();
      _bill = _billsToVote.firstWhereOrNull((e) => e.id == openedBill?.id);
      _billVotedOn = null;
      _voted = true;
    });
  }
}
