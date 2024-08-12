import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:sustainaville/services/onboarding/onboarding_tooltips.dart';
import 'package:sustainaville/services/user/user_data.dart';
import 'package:sustainaville/utils/constants/colors.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class OnboardingTooltipWidget extends ConsumerWidget {
  final SizeLayout size;
  final String message;
  final OnboardingTooltip type;
  final Widget child;
  final TooltipDirection direction;
  final void Function()? onHide;

  const OnboardingTooltipWidget({
    required this.size,
    required this.message,
    required this.type,
    required this.child,
    this.direction = TooltipDirection.up,
    this.onHide,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(onboardingTooltipsProvider.select((e) => e.enableTooltips));
    final shown = ref.watch(onboardingTooltipsProvider.select((e) => e.shownTooltips.contains(type)));
    final isNextInLine = ref.watch(onboardingTooltipsProvider.select((e) => e.nextInLine)) == type;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!shown && enabled && isNextInLine) {
        ref.read(onboardingTooltipsProvider).tooltipControllers[type]?.showTooltip();
      } else {
        if (ref.read(onboardingTooltipsProvider).tooltipControllers[type]?.isVisible == true) {
          ref.read(onboardingTooltipsProvider).tooltipControllers[type]?.hideTooltip();
        }
      }
    });

    return SuperTooltip(
      backgroundColor: AppColors.gameBackground,
      borderColor: AppColors.gameForeground,
      borderWidth: 3,
      hasShadow: false,
      showBarrier: true,
      content: Text(
        message,
        style: const TextStyle(fontFamily: 'VT323', fontSize: 24),
      ),
      arrowTipDistance: 30,
      popupDirection: direction,
      controller: ref.read(onboardingTooltipsProvider).tooltipControllers[type],
      onHide: () {
        ref.read(onboardingTooltipsProvider.notifier).markTooltipAsShown(type);
        onHide?.call();
      },
      fadeInDuration: const Duration(milliseconds: 600),
      child: child,
    );
  }
}
