import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:sustainaville/ui/widgets/nine_patch_container.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final Function()? onPressed;
  final TextStyle style;
  final bool enabled;

  const AppButton({
    required this.child,
    this.onPressed,
    this.style = const TextStyle(fontSize: 24),
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
          child: NinePatchContainer(
            imagePath: 'assets/images/ui/chat_bubble.9.png',
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
            child: child,
          ),
        ),
      ),
    );
  }

  factory AppButton.text(String text, {Function()? onPressed, TextStyle? style, bool enabled = true}) {
    return AppButton(
      onPressed: onPressed,
      enabled: enabled,
      child: Text(text, style: style ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}
