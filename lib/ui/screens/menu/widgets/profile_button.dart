import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/services/user/user_service.dart';
import 'package:sustainaville/ui/screens/game/overlay/widgets/loading_widget.dart';
import 'package:sustainaville/ui/screens/menu/widgets/profile_dialog.dart';
import 'package:sustainaville/ui/widgets/app_profile_button.dart';

class ProfileButton extends ConsumerWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loaded = ref.watch(userServiceProvider.select((e) => e.loaded));
    if (!loaded) return Transform.scale(scale: 0.5, child: const LoadingWidget());

    return AppProfileButton(onPressed: () => _profile(context));
  }

  void _profile(BuildContext context) {
    ProfileDialog.show(context);
  }
}
