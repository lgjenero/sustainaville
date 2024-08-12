import 'package:flutter/widgets.dart';

enum AppProgressBarColor { red, blue, green, yellow }

class AppProgressBarWidget extends StatelessWidget {
  final double progress;
  final AppProgressBarColor color;
  final double height;

  const AppProgressBarWidget({
    required this.progress,
    this.color = AppProgressBarColor.green,
    this.height = 14,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final progressImage = 'assets/images/ui/bars/bar_fill_${color.name}.png';

    return SizedBox(
      height: height,
      child: LayoutBuilder(builder: (context, constraints) {
        final pixelSize = constraints.maxHeight / 14 * 2;
        final widthInPixels = (constraints.maxWidth / pixelSize).floor();
        final padding = constraints.maxWidth - widthInPixels * pixelSize;

        // too small
        if (widthInPixels < 7) return const SizedBox.shrink();

        // get the fill width
        final maxFillWidth = widthInPixels - 6;
        final fillWidth = (maxFillWidth * progress).round();

        return Padding(
          padding: EdgeInsets.only(right: padding),
          child: Stack(
            children: [
              // middle
              Positioned(
                left: pixelSize * 2,
                right: pixelSize * 2,
                top: 0,
                bottom: 0,
                child: Image.asset('assets/images/ui/bars/bar_middle.png', fit: BoxFit.fill),
              ),

              // left
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: 3 * pixelSize,
                child: Image.asset('assets/images/ui/bars/bar_left.png', fit: BoxFit.fill),
              ),

              // right
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                width: 3 * pixelSize,
                child: Image.asset('assets/images/ui/bars/bar_right.png', fit: BoxFit.fill),
              ),

              // fill
              if (fillWidth > 0)
                Positioned(
                  left: pixelSize * 3,
                  top: 0,
                  bottom: 0,
                  width: pixelSize * fillWidth,
                  child: Image.asset(progressImage, fit: BoxFit.fill),
                ),

              // fill cap
              if (fillWidth > 0 && fillWidth < maxFillWidth)
                Positioned(
                  left: pixelSize * (fillWidth + 3),
                  top: 0,
                  bottom: 0,
                  width: pixelSize,
                  child: Image.asset('assets/images/ui/bars/bar_fill_end.png', fit: BoxFit.fill),
                ),
            ],
          ),
        );
      }),
    );
  }
}
