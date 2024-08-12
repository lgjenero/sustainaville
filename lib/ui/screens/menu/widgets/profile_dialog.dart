import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/services/auth/auth_service.dart';
import 'package:sustainaville/services/user/user_service.dart';
import 'package:sustainaville/ui/dialogs/chat/portrait_bubble.dart';
import 'package:sustainaville/ui/screens/game/overlay/widgets/loading_widget.dart';
import 'package:sustainaville/ui/screens/game/overlay/widgets/login_dialog.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/ui/widgets/app_button.dart';
import 'package:sustainaville/utils/constants/fonts.dart';
import 'package:sustainaville/utils/constants/sizes.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class ProfileDialog extends StatelessWidget {
  final SizeLayout size;
  final VoidCallback? onBack;

  const ProfileDialog({required this.size, this.onBack, super.key});

  static void show(BuildContext context) {
    Widget buildProfileContent(SizeLayout size) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          color: Colors.transparent,
          child: ProfileDialog(
            size: size,
            onBack: () => Navigator.pop(context),
          ),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) => SizeLayoutBuilder(
        small: (_, __) => buildProfileContent(SizeLayout.small),
        medium: (_, __) => buildProfileContent(SizeLayout.medium),
        large: (_, __) => buildProfileContent(SizeLayout.large),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PortraitBubble(
      child: Container(
        constraints: BoxConstraints.tightFor(width: AppSizes.message(size).width),
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Profile',
                  style: AppFonts.instance.gameMenuTitle(size),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                _ProfileLogin(size: size),
              ],
            ),
            Positioned(
              right: 0,
              child: AppBackButton(
                onPressed: onBack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileLogin extends ConsumerWidget {
  final SizeLayout size;

  const _ProfileLogin({required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(loggedInUserProvider);

    return isLoggedIn.when(
      data: (user) {
        if (user == null) {
          return Center(
            child: AppButton.text(
              'Login',
              onPressed: () => _tryLogin(context),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Logged in as ${user.email}',
              style: AppFonts.instance.gameMenuText(size),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            AppButton.text(
              'Log Out',
              onPressed: () => _tryLogout(ref),
            ),
          ],
        );
      },
      error: (error, stack) {
        return Text(
          'Error: $error',
          style: AppFonts.instance.gameMenuText(size),
          textAlign: TextAlign.center,
        );
      },
      loading: () => const LoadingWidget(),
    );
  }

  void _tryLogin(BuildContext context) {
    LoginDialog.show(
      context,
      onBack: () => Navigator.pop(context),
      onLogin: () => Navigator.pop(context),
    );
  }

  void _tryLogout(WidgetRef ref) {
    ref.read(userServiceProvider.notifier).logout();
  }
}
