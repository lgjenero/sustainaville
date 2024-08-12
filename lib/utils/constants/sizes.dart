import 'package:flutter/material.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class AppSizes {
  static Size tile = const Size(64, 40);
  static Size tileTexture = const Size(256, 160);

  static Size splashIcon(SizeLayout size) {
    return Size(
      size == SizeLayout.small
          ? 120
          : size == SizeLayout.medium
              ? 180
              : 240,
      size == SizeLayout.small
          ? 120
          : size == SizeLayout.medium
              ? 180
              : 240,
    );
  }

  static Size title(SizeLayout size) {
    return Size(
      size == SizeLayout.small
          ? 200
          : size == SizeLayout.medium
              ? 300
              : 400,
      size == SizeLayout.small
          ? 80
          : size == SizeLayout.medium
              ? 120
              : 160,
    );
  }

  static double titleFont(SizeLayout size) {
    return size == SizeLayout.small
        ? 48
        : size == SizeLayout.medium
            ? 56
            : 64;
  }

  static Size button(SizeLayout size) {
    return Size(
      size == SizeLayout.small
          ? 300
          : size == SizeLayout.medium
              ? 360
              : 420,
      size == SizeLayout.small
          ? 60
          : size == SizeLayout.medium
              ? 80
              : 100,
    );
  }

  static double hudSymbol(SizeLayout size) {
    return size == SizeLayout.small
        ? 28
        : size == SizeLayout.medium
            ? 34
            : 46;
  }

  static Size message(SizeLayout size) {
    return Size(
      size == SizeLayout.small
          ? 400
          : size == SizeLayout.medium
              ? 500
              : 600,
      size == SizeLayout.small
          ? 300
          : size == SizeLayout.medium
              ? 400
              : 500,
    );
  }

  static Size messageBadge(SizeLayout size) {
    return size == SizeLayout.small
        ? const Size.square(120)
        : size == SizeLayout.medium
            ? const Size.square(160)
            : const Size.square(200);
  }
}
