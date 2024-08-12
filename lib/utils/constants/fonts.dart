import 'package:flutter/material.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class AppFonts {
  AppFonts._();

  static final instance = AppFonts._();

  ///
  /// Game fonts
  ///

  TextStyle gameTitle(SizeLayout size) {
    return TextStyle(
      fontFamily: '04B_30',
      fontSize: size == SizeLayout.small
          ? 48
          : size == SizeLayout.medium
              ? 56
              : 64,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle gameSubtitle(SizeLayout size) {
    return TextStyle(
      fontSize: size == SizeLayout.small
          ? 36
          : size == SizeLayout.medium
              ? 42
              : 48,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle gameMenuTitle(SizeLayout size) {
    return TextStyle(
      fontSize: size == SizeLayout.small
          ? 22
          : size == SizeLayout.medium
              ? 24
              : 28,
      fontWeight: FontWeight.w900,
    );
  }

  TextStyle gameMenuText(SizeLayout size) {
    return TextStyle(
      fontSize: size == SizeLayout.small
          ? 20
          : size == SizeLayout.medium
              ? 22
              : 26,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle gameMenuLink(SizeLayout size) {
    return TextStyle(
      fontSize: size == SizeLayout.small
          ? 20
          : size == SizeLayout.medium
              ? 22
              : 26,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
      // fontStyle: FontStyle.italic,
    );
  }

  TextStyle gameButton(SizeLayout size) {
    return TextStyle(
      fontSize: size == SizeLayout.small
          ? 24
          : size == SizeLayout.medium
              ? 32
              : 48,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle gameHud(SizeLayout size) {
    return TextStyle(
      fontSize: size == SizeLayout.small
          ? 16
          : size == SizeLayout.medium
              ? 18
              : 20,
      fontWeight: FontWeight.w600,
    );
  }
}
