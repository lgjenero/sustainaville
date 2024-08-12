import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:sustainaville/ui/widgets/nine_patch_container.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class AppSettingsButton extends StatelessWidget {
  final void Function()? onPressed;

  const AppSettingsButton({this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FlameAudio.play('sfx/click.mp3');
        onPressed?.call();
      },
      child: const NinePatchContainer(
        imagePath: 'assets/images/ui/chat_bubble.9.png',
        padding: EdgeInsets.fromLTRB(16, 12, 16, 14),
        child: Icon(Icons.settings, size: 24, color: AppColors.gameForeground),
      ),
    );
  }
}
