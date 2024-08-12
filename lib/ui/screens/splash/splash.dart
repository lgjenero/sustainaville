import 'dart:async';

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/services/user/user_service.dart';
import 'package:sustainaville/ui/screens/menu/menu.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';
import 'package:sustainaville/utils/constants/colors.dart';
import 'package:sustainaville/utils/constants/sizes.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final _userLoaded = Completer<void>();
  final _musicLoaded = Completer<void>();

  @override
  void initState() {
    super.initState();
    ref.listenManual(
      userServiceProvider.select((e) => e.loaded),
      (_, loaded) {
        if (loaded && !_userLoaded.isCompleted) {
          _userLoaded.complete();
        }
      },
      fireImmediately: true,
    );

    FlameAudio.bgm.initialize();
    Future.wait([
      FlameAudio.audioCache.load('music/menu.mp3'),
      FlameAudio.audioCache.load('music/loading.mp3'),
      FlameAudio.audioCache.load('music/main_theme.mp3'),
      FlameAudio.audioCache.load('sfx/click.mp3'),
      FlameAudio.audioCache.load('sfx/close.mp3'),
    ]).then((value) => _musicLoaded.complete());

    if (!kIsWeb) _menu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gameBackground,
      body: SizeLayoutBuilder(
        small: (context, child) => _buildLayout(context, child, SizeLayout.small),
        medium: (context, child) => _buildLayout(context, child, SizeLayout.medium),
        large: (context, child) => _buildLayout(context, child, SizeLayout.large),
      ),
    );
  }

  Widget _buildLayout(BuildContext context, Widget? child, SizeLayout size) {
    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.splashIcon(size).width * 0.1),
              child: Image.asset(
                'assets/images/app_icon.png',
                width: AppSizes.splashIcon(size).width,
                height: AppSizes.splashIcon(size).height,
              ),
            ),
          ),
        ),
        if (kIsWeb)
          Positioned(
            left: 0,
            right: 0,
            bottom: 32,
            child: Center(
              child: AppButton.text(
                'Enter',
                onPressed: _menu,
                style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
            ),
          ),
      ],
    );
  }

  void _menu() async {
    await _userLoaded.future;
    if (!mounted) return;
    await _musicLoaded.future;
    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const MenuScreen(),
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var fadeAnimation = animation.drive(tween);
          return FadeTransition(
            opacity: fadeAnimation,
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }
}
