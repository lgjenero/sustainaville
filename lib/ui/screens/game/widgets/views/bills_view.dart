import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/data/bill.dart';
import 'package:sustainaville/data/representative.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/ui/widgets/app_checkbox_button.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class BillsView extends ConsumerStatefulWidget {
  final String? representativeId;

  const BillsView({required this.representativeId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BillsViewState();
}

class _BillsViewState extends ConsumerState<BillsView> {
  Bill? _bill;
  late final Representative _player;

  @override
  void initState() {
    super.initState();
    _player = ref.read(gameStateProvider.select((e) => e.representatives.first));
    final bills = ref
        .read(gameStateProvider.select((e) => e.bills.where((e) => e.sponsorId == widget.representativeId).toList()));
    _bill = bills.firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    final bills = ref
        .watch(gameStateProvider.select((e) => e.bills.where((e) => e.sponsorId == widget.representativeId).toList()));
    final representative = ref
        .watch(gameStateProvider.select((e) => e.representatives.firstWhere((e) => e.id == widget.representativeId)));
    _bill = bills.firstWhereOrNull((e) => e.id == _bill?.id);

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
                    onPressed: () => ref.read(gameStateProvider.notifier).goToView(GameView(
                          type: GameViewType.profile,
                          typeId: widget.representativeId,
                        ))),
                Text('${representative.name}\'s Bills', style: const TextStyle(fontSize: 32)),
                const Opacity(opacity: 0, child: AppBackButton()),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _buildList(bills)),
                  const SizedBox(width: 12),
                  Expanded(flex: 3, child: _buildBill(_bill)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<Bill> bills) {
    return ListView.separated(
      itemCount: bills.length,
      itemBuilder: (context, index) {
        final bill = bills[index];

        return InkWell(
          onTap: () => setState(() => _bill = bill),
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
    );
  }

  Widget _buildBill(Bill? bill) {
    if (bill == null) {
      return const Center(child: Text('Select a bill', style: TextStyle(fontSize: 24)));
    }

    return SingleChildScrollView(
      child: _buildBillInfo(bill),
    );
  }

  Widget _buildBillInfo(Bill bill) {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDataRow('ID', bill.id),
            const SizedBox(height: 6),
            _buildDataRow('Name', bill.name),
            const SizedBox(height: 6),
            _buildDataRow('Description', bill.description),
            const SizedBox(height: 6),
            if (bill.sponsorId == _player.id) _buildAmendments(bill),
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
}
