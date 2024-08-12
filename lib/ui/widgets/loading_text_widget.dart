import 'dart:math';

import 'package:flutter/material.dart';

class LoadingTextWidget extends StatefulWidget {
  final String text;
  final TextStyle style;
  final double padding;

  const LoadingTextWidget({super.key, required this.text, this.style = const TextStyle(), this.padding = 4});

  @override
  State<LoadingTextWidget> createState() => _LoadingTextWidgetState();
}

class _LoadingTextWidgetState extends State<LoadingTextWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..repeat();
  double _loadingWidth = 0;

  @override
  void initState() {
    super.initState();
    _calculateLoadingSize();
  }

  @override
  void didUpdateWidget(covariant LoadingTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.style != widget.style) {
      _calculateLoadingSize();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final loadingText = _controller.value < 0.33
            ? '.'
            : _controller.value < 0.66
                ? '..'
                : '...';

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            child!,
            SizedBox(width: widget.padding),
            SizedBox(
              width: _loadingWidth,
              child: Text(loadingText, style: widget.style),
            ),
          ],
        );
      },
      child: Text(widget.text, style: widget.style),
    );
  }

  void _calculateLoadingSize() {
    // calculate text width to display three dots
    final textPainter = TextPainter(
      text: TextSpan(text: '...', style: TextStyle(fontFamily: 'VT323', fontSize: widget.style.fontSize)),
      textDirection: TextDirection.ltr,
    )..layout();

    _loadingWidth = max(80, textPainter.width + 2);
  }
}
