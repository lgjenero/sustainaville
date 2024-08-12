import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class AppCheckboxButton extends StatelessWidget {
  final Function()? onPressed;
  final double size;
  final bool value;
  final bool enabled;

  const AppCheckboxButton({
    required this.value,
    this.onPressed,
    this.size = 48,
    this.enabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: Opacity(
        opacity: enabled ? 1 : 0.5,
        child: InkWell(
          onTap: () {
            FlameAudio.play('sfx/click.mp3');
            onPressed?.call();
          },
          child: Icon(
            value ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            size: 48,
            color: AppColors.gameForeground,
          ),
        ),
      ),
    );
  }
}
