import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/ui/screens/game/widgets/game_widget.dart';
import 'package:sustainaville/ui/snackbars/snackbar_wrapper.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class GameScreen extends ConsumerStatefulWidget {
  final String? loadSlot;

  const GameScreen({super.key, this.loadSlot});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (widget.loadSlot != null) {
        ref.read(gameStateProvider.notifier).loadGame(context, widget.loadSlot!);
      } else {
        ref.read(gameStateProvider.notifier).newGame();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.gameBackground,
      body: GameSnackbarWrapper(
        child: GameWidget(),
      ),
    );
  }
}
