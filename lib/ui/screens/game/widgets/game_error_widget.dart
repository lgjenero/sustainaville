import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:sustainaville/components/error_component.dart';
import 'package:sustainaville/ui/screens/menu/menu.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';

class GameErrorWidget extends StatefulWidget {
  const GameErrorWidget({super.key});

  @override
  State<GameErrorWidget> createState() => _GameErrorWidgetState();
}

class _GameErrorWidgetState extends State<GameErrorWidget> {
  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.stop();
    FlameAudio.bgm.play('music/flute_fail.mp3', volume: 0.2);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Oh no! Something went wrong!',
              style: TextStyle(fontSize: 32),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: AppButton.text(
                'Go back to Menu',
                onPressed: () {
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
                },
              ),
            ),
            const SizedBox(height: 24),
            const Center(child: ErrorComponent()),
          ],
        ),
      ),
    );
  }
}
