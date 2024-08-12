import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/ui/widgets/app_progress_bar_widget.dart';

class StatsView extends ConsumerStatefulWidget {
  const StatsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StatsViewState();
}

class _StatsViewState extends ConsumerState<StatsView> {
  @override
  Widget build(BuildContext context) {
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
                const Text('Stats', style: TextStyle(fontSize: 32)),
                const Opacity(opacity: 0, child: AppBackButton()),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _buildStats(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStats() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildStat(
            'Constituency',
            'How does your constituency feel about you and your efforts',
            ref.watch(gameStateProvider.select((e) => e.constituency)),
            AppProgressBarColor.blue,
          ),
          _buildStat(
            'Public Opinion',
            'How does the general public feel about you and your efforts',
            ref.watch(gameStateProvider.select((e) => e.publicOpinion)),
            AppProgressBarColor.blue,
          ),
          _buildStat(
            'Funds',
            'How much money you have in the bank for campaigns',
            ref.watch(gameStateProvider.select((e) => e.funds)),
            AppProgressBarColor.yellow,
          ),
          _buildStat(
            'Sustainability score',
            'How much progress has been made on sustainability',
            ref.watch(gameStateProvider.select((e) => e.sustainabiliyScore)),
            AppProgressBarColor.green,
          ),
          _buildStat(
            'Green transition score',
            'How much progress has been made on transitioning to green economy',
            ref.watch(gameStateProvider.select((e) => e.greenScore)),
            AppProgressBarColor.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String title, String subtitle, num value, AppProgressBarColor color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(title, style: const TextStyle(fontSize: 32)),
                Text(subtitle, style: const TextStyle(fontSize: 24)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 14 * 18,
            child: AppProgressBarWidget(
              progress: min(1, value / 100),
              height: 14 * 3,
              color: color,
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(width: 100, child: Text(value.toString(), style: const TextStyle(fontSize: 40))),
        ],
      ),
    );
  }
}
