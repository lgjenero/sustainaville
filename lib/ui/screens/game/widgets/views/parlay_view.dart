import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/components/room_component.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/data/representative.dart';
import 'package:sustainaville/data/turn_response.dart';
import 'package:sustainaville/state/game_state.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/templates/chat_template.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_avatar.dart';
import 'package:sustainaville/ui/dialogs/chat/chat_bubble.dart';
import 'package:sustainaville/ui/widgets/app_back_button.dart';
import 'package:sustainaville/ui/widgets/app_send_button.dart';
import 'package:sustainaville/utils/constants/colors.dart';

class ParlayView extends ConsumerStatefulWidget {
  final String representativeId;

  const ParlayView({super.key, required this.representativeId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParlayViewState();
}

class _ParlayViewState extends ConsumerState<ParlayView> {
  late final Representative _player;
  late final Representative _representative;
  late final int _representativeIndex;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  bool _animating = false;
  RoomComponentAction _action = RoomComponentAction.enter;
  bool _firstMesage = true;

  @override
  void initState() {
    super.initState();
    final representatives = ref.read(gameStateProvider.select((e) => e.representatives));
    _representative = representatives.firstWhere((e) => e.id == widget.representativeId);
    _representativeIndex = representatives.indexOf(_representative);
    _player = ref.read(gameStateProvider.select((e) => e.representatives.first));

    _animateEntering();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // background
          Positioned.fill(
            top: 90,
            left: 32,
            right: 32,
            bottom: 32,
            child: FittedBox(
              child: RoomComponent(
                owner: Character.fromRepresentative(_representative),
                visitor: Character.fromRepresentative(_player),
                roomIndex: _representativeIndex,
                action: _action,
              ),
            ),
          ),

          // chat
          Positioned(
            top: 90,
            left: 20,
            right: 20,
            bottom: 12,
            child: AnimatedOpacity(
              opacity: _animating ? 0 : 1,
              duration: const Duration(milliseconds: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ChatBubble(
                      child: _buildConversation(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildInput(),
                ],
              ),
            ),
          ),

          // top header
          Positioned(
            top: 12,
            left: 20,
            right: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  ignoring: _animating,
                  child: Opacity(
                    opacity: _animating ? 0.4 : 1,
                    child: AppBackButton(
                      onPressed: _animateExiting,
                    ),
                  ),
                ),
                Text(_representative.name, style: const TextStyle(fontSize: 32)),
                const Opacity(opacity: 0, child: AppBackButton()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConversation() {
    return Consumer(builder: (context, ref, _) {
      final messages = ref.watch(gameStateProvider
          .select((e) => _getRepresentativeChat(widget.representativeId, e.history).reversed.toList()));

      return ListView.separated(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];

          if (message.isPlayer) return _playerMessage(message.message);
          return _otherMessage(message.message);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      );
    });
  }

  Widget _otherMessage(String? text) {
    if (text == null) return const SizedBox.shrink();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 64),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 24), textAlign: TextAlign.right)),
        const SizedBox(width: 8),
        SizedBox(
          width: 80,
          height: 80,
          child: FittedBox(
            child: ChatAvatar(character: Character.fromRepresentative(_representative)),
          ),
        ),
      ],
    );
  }

  Widget _playerMessage(String? text) {
    if (text == null) return const SizedBox.shrink();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: FittedBox(
            child: ChatAvatar(character: Character.fromRepresentative(_player)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 24))),
        const SizedBox(width: 64),
      ],
    );
  }

  Widget _buildInput() {
    return ClipRRect(
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(gameStateProvider.select((e) => e.status));
          final isLoading = state == GameStatus.waitingForResponse;
          final isError = state == GameStatus.error;

          return Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              child!,
              if (isLoading)
                Positioned.fill(
                  child: ColoredBox(
                    color: AppColors.gameBackground.withOpacity(0.4),
                  ),
                ),
            ],
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ChatBubble(
                child: TextField(
                  controller: _controller,
                  focusNode: _focus,
                  maxLines: 3,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Talk to ${_representative.name}...',
                    border: InputBorder.none,
                    isCollapsed: true,
                  ),
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.send,
                  onSubmitted: _send,
                  onTapOutside: (_) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
            ),
            const SizedBox(width: 12),
            AppSendButton(onPressed: () => _send(_controller.text))
          ],
        ),
      ),
    );
  }

  void _send(String text) async {
    final response =
        await ref.read(gameStateProvider.notifier).sendParlayMessage(text, _representative.id, isFirst: _firstMesage);
    if (!mounted) return;
    _firstMesage = false;
    if (response != null) _controller.clear();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!mounted) return;
      _focus.requestFocus();
    });
  }

  List<_ChatMessage> _getRepresentativeChat(String representativeId, List<String> history) {
    final representativeChat = <_ChatMessage>[];

    final playerMessageStartPrefix = representativeChatStartTemplate
        .replaceAll(ChatTemplateFields.representativeId.tag, representativeId)
        .replaceAll(ChatTemplateFields.message.tag, '')
        .trim();

    final playerMessagePrefix = representativeChatTemplate
        .replaceAll(ChatTemplateFields.representativeId.tag, representativeId)
        .replaceAll(ChatTemplateFields.message.tag, '')
        .trim();

    for (final message in history) {
      final trimmmedMsg = message.trim();

      if (trimmmedMsg.startsWith(playerMessagePrefix)) {
        representativeChat.add(_ChatMessage.user(trimmmedMsg.substring(playerMessagePrefix.length).trim()));
        continue;
      }

      if (trimmmedMsg.startsWith(playerMessageStartPrefix)) {
        representativeChat.add(_ChatMessage.user(trimmmedMsg.substring(playerMessageStartPrefix.length).trim()));
        continue;
      }

      try {
        final turnResponse = TurnResponse.fromJson(jsonDecode(trimmmedMsg));
        final representative = turnResponse.representatives.firstOrNull;
        if (representative?.representativeId == representativeId) {
          final text = representative?.response;
          if (text != null) representativeChat.add(_ChatMessage.other(text));
        }
      } catch (_) {}
    }

    return representativeChat;
  }

  void _animateEntering() {
    setState(() {
      _animating = true;
      _action = RoomComponentAction.enter;
    });

    Future.delayed(const Duration(milliseconds: 3000), () {
      if (!mounted) return;

      setState(() {
        _animating = false;
        _action = RoomComponentAction.talking;
      });
    });
  }

  void _animateExiting() {
    setState(() {
      _animating = true;
      _action = RoomComponentAction.exit;
    });

    if (!_firstMesage) {
      ref.read(gameStateProvider.notifier).leaveParlayMessage(widget.representativeId);
    }

    Future.delayed(const Duration(milliseconds: 3000), () {
      if (!mounted) return;
      ref.read(gameStateProvider.notifier).goToView(GameView(
            type: GameViewType.profile,
            typeId: widget.representativeId,
          ));
    });
  }
}

class _ChatMessage {
  final bool isPlayer;
  final String message;

  const _ChatMessage({required this.isPlayer, required this.message});

  factory _ChatMessage.user(String message) => _ChatMessage(isPlayer: true, message: message);

  factory _ChatMessage.other(String message) => _ChatMessage(isPlayer: false, message: message);
}
