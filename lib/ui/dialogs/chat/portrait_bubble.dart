import 'package:flutter/material.dart';
import 'package:sustainaville/ui/widgets/nine_patch_container.dart';

class PortraitBubble extends StatelessWidget {
  final Widget child;

  const PortraitBubble({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return NinePatchContainer(
      imagePath: 'assets/images/ui/portrait_border.9.png',
      padding: const EdgeInsets.fromLTRB(8, 10, 4, 6),
      child: child,
    );
  }
}
