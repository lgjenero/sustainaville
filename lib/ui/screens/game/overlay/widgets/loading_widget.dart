import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.gameBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(child: CircularProgressIndicator(color: AppColors.gameForeground)),
    );
  }

  static OverlayEntry show(BuildContext context) {
    final overlay = OverlayEntry(builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: ColoredBox(
          color: AppColors.gameForeground.withOpacity(0.4),
          child: const Center(child: LoadingWidget()),
        ),
      );
    });
    Overlay.of(context).insert(overlay);
    return overlay;
  }
}
