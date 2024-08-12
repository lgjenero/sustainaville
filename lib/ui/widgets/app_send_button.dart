import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:sustainaville/ui/widgets/nine_patch_container.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class AppSendButton extends StatelessWidget {
  final void Function()? onPressed;

  const AppSendButton({this.onPressed, super.key});

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
        child: Icon(Icons.send, color: AppColors.gameForeground, size: 24),
      ),
    );
  }
}
