import 'dart:async';

import 'package:flutter/material.dart';

class NinePatchContainer extends StatefulWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final Widget? child;

  const NinePatchContainer({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.padding = EdgeInsets.zero,
    this.child,
  });

  @override
  State<NinePatchContainer> createState() => _NinePatchContainerState();
}

class _NinePatchContainerState extends State<NinePatchContainer> {
  Size? _imageSize;

  @override
  void initState() {
    super.initState();
    _calculateImageDimension().then((value) {
      setState(() {
        _imageSize = value;
      });
    });
  }

  @override
  void didUpdateWidget(covariant NinePatchContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imagePath != widget.imagePath) {
      _imageSize = null;
      _calculateImageDimension().then((value) {
        setState(() {
          _imageSize = value;
        });
      });
    }
  }

  Future<Size> _calculateImageDimension() {
    Completer<Size> completer = Completer();
    Image image = Image.asset(widget.imagePath);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final int width = _imageSize?.width.toInt() ?? 0;
    final int height = _imageSize?.height.toInt() ?? 0;
    final int halfWidth = width % 2 == 1 ? width ~/ 2 : width ~/ 2 - 1;
    final int halfHeight = height % 2 == 1 ? height ~/ 2 : height ~/ 2 - 1;
    final int centerWidth = width - 2 * halfWidth;
    final int centerHeight = height - 2 * halfHeight;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          if (_imageSize != null) ...[
            Positioned.fill(
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.fill,
                centerSlice: Rect.fromLTWH(
                  halfWidth.toDouble(),
                  halfHeight.toDouble(),
                  centerWidth.toDouble(),
                  centerHeight.toDouble(),
                ),
              ),
            ),
          ],
          Padding(padding: widget.padding, child: widget.child),
        ],
      ),
    );
  }
}
