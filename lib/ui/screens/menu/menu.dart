import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/ui/screens/game/game.dart';
import 'package:sustainaville/ui/screens/menu/widgets/menu_content.dart';
import 'package:sustainaville/ui/screens/menu/widgets/profile_button.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.stop();
    FlameAudio.bgm.play('music/menu.mp3', volume: 0.1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.gameBackground,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/ui/parliament.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: AppColors.gameBackground.withOpacity(0.4),
              ),
            ),
            Positioned.fill(
              child: MenuContent(
                onStartGame: () => _start(context),
                onContinueGame: (slot) => _start(context, slot: slot),
              ),
            ),
            const Positioned(
              top: 8,
              right: 8,
              child: SafeArea(child: ProfileButton()),
            )
          ],
        ));
  }

  void _start(BuildContext context, {String? slot}) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => GameScreen(loadSlot: slot),
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
