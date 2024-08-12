import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/components/character_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/ui/widgets/loading_text_widget.dart';
import 'package:sustainaville/utils/animations/character_animation.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class BillCreationView extends ConsumerStatefulWidget {
  const BillCreationView({super.key});

  @override
  ConsumerState<BillCreationView> createState() => _BillCreationViewState();
}

class _BillCreationViewState extends ConsumerState<BillCreationView> {
  late final List<Character> _characters;
  final _positions = [
    const Offset(0.5, 4),
    const Offset(2.5, 4),
    const Offset(4.5, 4),
    const Offset(6.5, 4),
    const Offset(8.5, 4),
  ];

  @override
  void initState() {
    super.initState();
    _characters = ref.read(gameStateProvider).representatives.map((e) => Character.fromRepresentative(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            top: 100,
            left: 32,
            right: 32,
            bottom: 32,
            child: FittedBox(
              child: SizedBox(
                width: 480,
                height: 480,
                child: Stack(
                  children: _characters.mapIndexed((index, e) {
                    return Positioned(
                      left: _positions[index].dx * 48,
                      top: _positions[index].dy * 48,
                      child: CharacterComponent(
                        key: ValueKey(e.id),
                        character: e,
                        play: true,
                        animation: CharacterAnimationEnum.reading,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: 180,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.gameBackground,
                    AppColors.gameBackground.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 12,
            right: 32,
            left: 32,
            child: LoadingTextWidget(
              text: 'Creating Bills',
              style: TextStyle(fontSize: 32),
            ),
          ),
        ],
      ),
    );
  }
}
