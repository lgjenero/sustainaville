import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/ui/dialogs/confirmation_dialog/confirmation_dialog.dart';
import 'package:sustainaville/ui/screens/game/overlay/widgets/settings_widget.dart';
import 'package:sustainaville/ui/screens/game/widgets/game_creation_widget.dart';
import 'package:sustainaville/ui/screens/game/widgets/game_error_widget.dart';
import 'package:sustainaville/ui/screens/game/widgets/game_play_widget.dart';
import 'package:sustainaville/ui/screens/menu/menu.dart';
import 'package:sustainaville/ui/widgets/app_settings_button.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class GameWidget extends ConsumerWidget {
  const GameWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(gameStateProvider.select((e) => e.status));

    final Widget content;
    switch (status) {
      case GameStatus.loading:
        content = const GameCreationWidget();
        break;
      case GameStatus.error:
        content = const GameErrorWidget();
        break;
      case GameStatus.intro:
      case GameStatus.ready:
      case GameStatus.waitingForResponse:
        content = const GamePlayWidget();
        break;
      default:
        content = const SizedBox();
        break;
    }

    return Container(
      color: AppColors.gameBackground,
      child: Stack(
        children: [
          Positioned.fill(child: content),
          Positioned(
            top: 8,
            right: 8,
            child: SafeArea(
              left: false,
              bottom: false,
              child: AppSettingsButton(
                onPressed: () => _settings(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _settings(BuildContext context) {
    SettingsDialog.show(context, onQuit: () async {
      final result = await ConfirmationDialog.show(
        context,
        'Are you sure you want to quit?',
        cancelText: 'Not yet',
        confirmText: 'Yes, let\'s go',
      );
      if (result != true) return;

      if (!context.mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const MenuScreen(),
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.ease;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var fadeAnimation = animation.drive(tween);
            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
        ),
        (route) => false,
      );
    });
  }
}
