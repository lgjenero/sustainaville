import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sustainaville/data/game_save_data.dart';
import 'package:sustainaville/services/auth/auth_service.dart';
import 'package:sustainaville/services/firebase/firestore_service.dart';
import 'package:sustainaville/ui/dialogs/chat/portrait_bubble.dart';
import 'package:sustainaville/ui/screens/game/overlay/widgets/loading_widget.dart';
import 'package:sustainaville/ui/screens/game/overlay/widgets/login_dialog.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/utils/constants/colors.dart';
import 'package:sustainaville/utils/constants/fonts.dart';
import 'package:sustainaville/utils/constants/sizes.dart';
import 'package:sustainaville/utils/widgets/size_layout.dart';

class SavesDialog extends ConsumerStatefulWidget {
  final SizeLayout size;
  final bool showEmpty;
  final VoidCallback? onBack;
  final void Function(String slot)? onSelect;

  const SavesDialog({
    required this.size,
    this.onBack,
    this.onSelect,
    this.showEmpty = false,
    super.key,
  });

  @override
  ConsumerState<SavesDialog> createState() => _SavesDialogState();
}

class _SavesDialogState extends ConsumerState<SavesDialog> {
  final List<GameSaveData> _saves = [];
  bool _loading = false;
  final _dateFormat = DateFormat('d MMMM yyyy hh:mm a');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _tryLoadSaves());
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = ref.read(authServiceProvider).isLoggedIn();
    if (!isLoggedIn) {
      return LoginDialog(size: widget.size, onBack: _back, onLogin: _tryLoadSaves);
    }

    return PortraitBubble(
      child: Container(
        constraints: BoxConstraints.tight(AppSizes.message(widget.size)),
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Saves', style: AppFonts.instance.gameMenuTitle(widget.size)),
                  const SizedBox(height: 8),
                  Expanded(
                    child: _loading ? const Center(child: LoadingWidget()) : _buildContent(),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: AppBackButton(
                onPressed: () => _back(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    List<GameSaveDataSlots> slots = GameSaveDataSlots.values;
    if (!widget.showEmpty) {
      slots = slots.where((slot) => _saves.any((save) => save.slot == slot.name)).toList();
    }

    if (slots.isEmpty) {
      return Center(
        child: Text(
          'No saves found',
          style: AppFonts.instance.gameMenuText(widget.size),
        ),
      );
    }

    return ListView.separated(
      itemCount: slots.length,
      itemBuilder: (context, index) {
        final slot = slots[index];
        final save = _saves.firstWhereOrNull((save) => save.slot == slot.name);
        final date = save?.createdAt;
        final dateText = date != null ? _dateFormat.format(date) : '';

        return ListTile(
          title: Text(
            save != null ? (save.name ?? save.slot) : slot.name,
            style: AppFonts.instance.gameMenuText(widget.size),
          ),
          subtitle: Text(
            save == null ? 'Empty' : '${save.gameData.representatives.firstOrNull?.name}, Date: $dateText',
            style:
                AppFonts.instance.gameMenuText(widget.size).copyWith(color: AppColors.gameForeground.withOpacity(0.5)),
          ),
          onTap: () => _select(slot.name),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 8),
    );
  }

  void _back() {
    widget.onBack?.call();
  }

  void _select(String slot) {
    widget.onSelect?.call(slot);
  }

  void _tryLoadSaves() async {
    setState(() => _loading = true);

    final saves = await ref.read(firestoreServiceProvider).loadAllGames();

    setState(() {
      _saves.clear();
      _saves.addAll(saves);
      _loading = false;
    });
  }
}
