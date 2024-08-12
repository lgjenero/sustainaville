import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/services/auth/auth_service.dart';
import 'package:sustainaville/ui/screens/game/overlay/widgets/login_dialog.dart';
import 'package:sustainaville/ui/screens/game/overlay/widgets/saves_dialog.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';
import 'package:sustainaville/utils/constants/colors.dart';
import 'package:sustainaville/utils/constants/fonts.dart';
import 'package:sustainaville/utils/widgets/outlined_text.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class MenuContent extends ConsumerWidget {
  const MenuContent({this.onStartGame, this.onContinueGame, super.key});

  final void Function()? onStartGame;
  final void Function(String slot)? onContinueGame;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizeLayoutBuilder(
      small: (context, child) => _buildLayout(context, ref, SizeLayout.small),
      medium: (context, child) => _buildLayout(context, ref, SizeLayout.medium),
      large: (context, child) => _buildLayout(context, ref, SizeLayout.large),
    );
  }

  Widget _buildLayout(BuildContext context, WidgetRef ref, SizeLayout size) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: OutlinedText(
              'Sustainaville',
              style: AppFonts.instance.gameTitle(size),
              textColor: AppColors.gameBackground,
              strokeColor: AppColors.gameForeground.withOpacity(0.9),
              strokeWidth: 4,
            ),
          ),
          const SizedBox(height: 12),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'A Democracy Story',
              style: AppFonts.instance.gameSubtitle(size).copyWith(shadows: [
                const Shadow(
                  offset: Offset(0, 0),
                  blurRadius: 10.0,
                  color: AppColors.gameBackground,
                ),
              ]),
            ),
          ),
          SizedBox(
              height: size == SizeLayout.small
                  ? 20
                  : size == SizeLayout.medium
                      ? 40
                      : 60),
          _buildButtons(context, ref, size),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context, WidgetRef ref, SizeLayout size) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppButton.text(
          'New Game',
          onPressed: () => onStartGameTap(context, ref),
        ),
        const SizedBox(height: 16),
        AppButton.text(
          'Continue Game',
          onPressed: () => _onContinueGameTap(context),
        ),
      ],
    );
  }

  void _onContinueGameTap(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Widget buildDialog(SizeLayout size) => SavesDialog(
              size: size,
              showEmpty: false,
              onBack: () => Navigator.pop(context),
              onSelect: (slot) {
                Navigator.pop(context);
                onContinueGame?.call(slot);
              });

          return Material(
            type: MaterialType.transparency,
            child: Center(
              child: SizeLayoutBuilder(
                small: (_, __) => buildDialog(SizeLayout.small),
                medium: (_, __) => buildDialog(SizeLayout.medium),
                large: (_, __) => buildDialog(SizeLayout.large),
              ),
            ),
          );
        });
  }

  void onStartGameTap(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.read(authServiceProvider).isLoggedIn();
    if (!isLoggedIn) {
      LoginDialog.show(
        context,
        onLogin: () {
          Navigator.pop(context);
          onStartGame?.call();
        },
        onBack: () => Navigator.pop(context),
      );
    } else {
      onStartGame?.call();
    }
  }
}
