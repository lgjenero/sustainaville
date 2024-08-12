import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/ui/dialogs/chat/portrait_bubble.dart';
import 'package:sustainaville/ui/screens/game/overlay/widgets/saves_dialog.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';
import 'package:sustainaville/utils/constants/fonts.dart';
import 'package:sustainaville/utils/constants/sizes.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class SettingsDialog extends ConsumerStatefulWidget {
  final SizeLayout size;
  final VoidCallback? onQuit;

  const SettingsDialog({required this.size, this.onQuit, super.key});

  @override
  ConsumerState<SettingsDialog> createState() => _SettingsDialogState();

  static void show(BuildContext context, {VoidCallback? onQuit}) {
    Widget buildLoginContent(SizeLayout size, {VoidCallback? onQuit}) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          color: Colors.transparent,
          child: SettingsDialog(
            size: size,
            onQuit: onQuit,
          ),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) => SizeLayoutBuilder(
        small: (_, __) => buildLoginContent(SizeLayout.small, onQuit: onQuit),
        medium: (_, __) => buildLoginContent(SizeLayout.medium, onQuit: onQuit),
        large: (_, __) => buildLoginContent(SizeLayout.large, onQuit: onQuit),
      ),
    );
  }
}

class _SettingsDialogState extends ConsumerState<SettingsDialog> {
  @override
  Widget build(BuildContext context) {
    return PortraitBubble(
      child: Container(
        constraints: BoxConstraints.tightFor(width: AppSizes.message(widget.size).width),
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Settings', style: AppFonts.instance.gameMenuText(widget.size)),
                const SizedBox(height: 32),
                AppButton.text('Save Game', onPressed: _save),
                const SizedBox(height: 24),
                AppButton.text('Load Game', onPressed: _load),
                const SizedBox(height: 24),
                AppButton.text('Quit', onPressed: _quit),
                const SizedBox(height: 24),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: AppBackButton(
                onPressed: _back,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _load() {
    showDialog(
        context: context,
        builder: (context) {
          Widget buildDialog(SizeLayout size) => SavesDialog(
              size: size,
              showEmpty: false,
              onBack: () => Navigator.pop(context),
              onSelect: (slot) async {
                ref.read(gameStateProvider.notifier).loadGame(context, slot);
                Navigator.pop(context);
                Navigator.pop(context);
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

  void _save() {
    showDialog(
        context: context,
        builder: (context) {
          Widget buildDialog(SizeLayout size) => SavesDialog(
              size: size,
              showEmpty: true,
              onBack: () => Navigator.pop(context),
              onSelect: (slot) async {
                ref.read(gameStateProvider.notifier).saveGame(context, slot, null);
                Navigator.pop(context);
                Navigator.pop(context);
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

  void _quit() {
    Navigator.pop(context);
    widget.onQuit?.call();
  }

  void _back() {
    Navigator.pop(context);
  }
}
