import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sustainaville/data/bill.dart';
import 'package:sustainaville/data/campaign.dart';
import 'package:sustainaville/data/constituency.dart';
import 'package:sustainaville/data/game_save_data.dart';
import 'package:sustainaville/data/lobbying_group.dart';
import 'package:sustainaville/data/party.dart';
import 'package:sustainaville/data/representative.dart';
import 'package:sustainaville/data/representative_bills.dart';
import 'package:sustainaville/data/turn_response.dart';
import 'package:sustainaville/services/firebase/firestore_service.dart';
import 'package:sustainaville/state/game_state_data.dart';
import 'package:sustainaville/templates/chat_template.dart';
import 'package:sustainaville/templates/game_template.dart';
import 'package:sustainaville/test/test_game.dart';
import 'package:sustainaville/ui/screens/game/overlay/widgets/loading_widget.dart';
import 'package:sustainaville/ui/snackbars/snackbar.dart';
import 'package:sustainaville/ui/snackbars/snackbar_state.dart';
import 'package:sustainaville/ui/snackbars/snackbars.dart';
import 'package:sustainaville/utils/json/json.dart';

part 'game_state.g.dart';

String get _geminiApiKey {
  if (kDebugMode) return dotenv.env['GEMINI_AI_API_KEY_DEV'] ?? "";
  return dotenv.env['GEMINI_AI_API_KEY_PROD'] ?? "";
}

@riverpod
class GameState extends _$GameState {
  late final GenerativeModel _model;
  late final ChatSession? _chat;
  bool _isDisposed = false;

  @override
  GameSatateData build() {
    ref.onDispose(() {
      _isDisposed = true;
    });

    return const GameSatateData(
      status: GameStatus.loading,
      creationPhase: GameCreationPhase.constituencies,
      view: GameView(type: GameViewType.main),
      representatives: [],
      constituencies: [],
      lobbyingGroups: [],
      parties: [],
      bills: [],
      funds: 0,
      constituency: 50,
      publicOpinion: 50,
      sustainabiliyScore: 0,
      greenScore: 0,
    );
  }

  Future<void> newGame() async {
    state = state.copyWith(status: GameStatus.loading);

    bool useAI = true;
    bool loadInParts = true;

    if (useAI) {
      if (loadInParts) {
        state = state.copyWith(creationPhase: GameCreationPhase.constituencies);
        final constituencies = await _createConstituencies();
        if (_isDisposed) return;
        state = state.copyWith(
          creationPhase: GameCreationPhase.lobbyingGroups,
          constituencies: constituencies,
        );
        final lobbyingGroups = await _createLobbyGroups();
        if (_isDisposed) return;
        state = state.copyWith(
          creationPhase: GameCreationPhase.parties,
          lobbyingGroups: lobbyingGroups,
        );
        final parties = await _createPartiess();
        if (_isDisposed) return;
        state = state.copyWith(
          creationPhase: GameCreationPhase.representatives,
          parties: parties,
        );
        final representatives = await _createRepresentatives(constituencies, parties, lobbyingGroups);
        if (_isDisposed) return;
        state = state.copyWith(
          creationPhase: GameCreationPhase.bills,
          representatives: representatives,
        );
        final bills = await _createBills(constituencies, parties, lobbyingGroups, representatives);
        if (_isDisposed) return;
        state = state.copyWith(bills: bills);
      } else {
        final data = await _createAllGameObjects();
        if (_isDisposed) return;

        state = state.copyWith(
          representatives: data.representatives,
          constituencies: data.constituencies,
          lobbyingGroups: data.lobbyingGroups,
          parties: data.parties,
          bills: data.bills,
        );
      }
    } else {
      final data = _createFromJson(mockGame);

      state = state.copyWith(
        representatives: data.representatives,
        constituencies: data.constituencies,
        lobbyingGroups: data.lobbyingGroups,
        parties: data.parties,
        bills: data.bills,
      );
    }

    final loadOk = state.constituencies.isNotEmpty &&
        state.parties.isNotEmpty &&
        state.lobbyingGroups.isNotEmpty &&
        state.representatives.isNotEmpty &&
        state.bills.isNotEmpty;
    if (!loadOk) {
      state = state.copyWith(status: GameStatus.error);
      return;
    }

    if (_isDisposed) return;

    _ready([]);
  }

  bool _ready(List<String> history) {
    final gameData = jsonEncode(_cretateGameData());
    final playerId = state.representatives.first.id;
    final systemPrompt = chatTemplateSystemNew.replaceAll('gameData', gameData).replaceAll('playerId', playerId);

    _model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: _geminiApiKey,
      systemInstruction: Content.system(systemPrompt),
      safetySettings: [
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.low),
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.low),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.low),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.low),
      ],
      generationConfig: GenerationConfig(
        maxOutputTokens: 4000,
        temperature: 2.0,
        topP: 0.9,
        topK: 40,
        // topP: 1.0,
        // frequencyPenalty: 0.0,
        // presencePenalty: 0.0,
        // stopSequences: ['\n'],
        responseMimeType: 'application/json',
        responseSchema: TurnResponse.schema..nullable = false,
      ),
    );

    // TODO: load history

    // start chat
    try {
      _chat = _model.startChat(
        history: [
          ...history.map((e) => Content.text(e)),
        ],
        safetySettings: [
          SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.low),
          SafetySetting(HarmCategory.harassment, HarmBlockThreshold.low),
          SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.low),
          SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.low),
        ],
        generationConfig: GenerationConfig(
          maxOutputTokens: 4000,
          temperature: 2.0,
          topP: 0.9,
          topK: 40,
          // topP: 1.0,
          // frequencyPenalty: 0.0,
          // presencePenalty: 0.0,
          // stopSequences: ['\n'],
          responseMimeType: 'application/json',
          responseSchema: TurnResponse.schema..nullable = false,
        ),
      );
    } catch (e) {
      state = state.copyWith(status: GameStatus.error);
      return false;
    }

    state = state.copyWith(status: GameStatus.intro);
    return true;
  }

  Map<String, dynamic> _cretateGameData() {
    final gameData = <String, dynamic>{};

    gameData['representaives'] = state.representatives.map((e) => e.toJson()..remove('design')).toList();
    gameData['parties'] = state.parties.map((e) => e.toJson()).toList();
    gameData['constituencies'] = state.constituencies.map((e) => e.toJson()).toList();
    gameData['lobbyingGroups'] = state.lobbyingGroups.map((e) => e.toJson()).toList();
    gameData['bills'] = state.bills.map((e) => e.toJson()).toList();

    return gameData;
  }

  final List<_MessageInQueue> _messageQueue = [];

  Future<TurnResponse?> _send(String message, {bool requiresResponse = true}) {
    final completer = Completer<TurnResponse?>();

    _messageQueue.add(_MessageInQueue(message, completer, requiresResponse));
    _kickMessageQueue();

    return completer.future;
  }

  void _kickMessageQueue() {
    if (_messageQueue.isEmpty) return;
    final messageInQueue = _messageQueue.removeAt(0);

    _sendWithRetry(messageInQueue.message, requiresResponse: messageInQueue.requiresResponse).then((result) {
      messageInQueue.completer.complete(result);
      _kickMessageQueue();
    });
  }

  Future<TurnResponse?> _sendWithRetry(String message, {int retry = 0, bool requiresResponse = true}) async {
    state = state.copyWith(status: GameStatus.waitingForResponse, history: [...state.history, message]);
    String responseText = "";
    try {
      final response = await _chat?.sendMessage(Content.text(message));
      responseText = response?.text ?? "";
      if (responseText.isEmpty) {
        log('Empty response: $response');
        final blockMessage = response?.promptFeedback?.blockReasonMessage;
        if (blockMessage != null) {
          ref.read(gameSnackbarStateProvider.notifier).scheduleSnackbar(GameSnackbars.messageBlocked(blockMessage));
          state = state.copyWith(status: GameStatus.ready, history: [...state.history]..removeLast());
          return null;
        }
        if (!requiresResponse) return null;
      }
    } catch (e) {
      if (e is GenerativeAIException) {
        ref
            .read(gameSnackbarStateProvider.notifier)
            .scheduleSnackbar(GameSnackbars.messageBlocked('Something went wrong'));
        state = state.copyWith(status: GameStatus.ready, history: [...state.history]..removeLast());
        return null;
      }
    }
    if (_isDisposed) return null;

    final sanitisedText = _sanitiseJsonText(responseText);

    log('responseText:\n$sanitisedText');

    final TurnResponse turnResponse;
    try {
      turnResponse = TurnResponse.fromJson(jsonDecode(sanitisedText));
    } catch (e, s) {
      print('Error parsing TurnResponse: $e\n$s');

      state = state.copyWith(history: [...state.history]..removeLast());
      if (retry < 3) {
        return _sendWithRetry(message, retry: retry + 1);
      } else {
        ref.read(gameSnackbarStateProvider.notifier).scheduleSnackbar(GameSnackbars.messageFailed());
        return null;
      }
    }

    state = state.copyWith(status: GameStatus.ready, history: [...state.history, sanitisedText]);

    return turnResponse;
  }

  void saveGame(
    BuildContext context,
    String slot,
    String? name,
  ) async {
    bool saved = false;

    print('Saving game to slot: $slot');

    final loading = LoadingWidget.show(context);
    try {
      final saveData = GameSaveData(gameData: state, status: state.status, slot: slot);

      log('save data --> ${jsonEncode(saveData.toJson())}');

      await ref.read(firestoreServiceProvider).saveGame(saveData, slot);
      saved = true;
    } catch (e, s) {
      print('Error saving game: $e\n$s');
    }

    loading.remove();
    showSnackbar(saved ? GameSnackbars.gameSaved() : GameSnackbars.errorSavingGame());
  }

  void loadGame(BuildContext context, String slot) async {
    state = state.copyWith(status: GameStatus.loading);

    final loading = LoadingWidget.show(context);

    GameSaveData? saveData;

    try {
      saveData = await ref.read(firestoreServiceProvider).loadGame(slot);
    } catch (e, s) {
      print('Error loading game: $e\n$s');
    }
    if (_isDisposed) return;

    if (saveData == null) {
      loading.remove();
      state = state.copyWith(status: GameStatus.error);
      showSnackbar(GameSnackbars.errorLoadingGame());
      return;
    }

    loading.remove();

    state = saveData.gameData;

    // do we need to process the last message
    final history = [...saveData.gameData.history];
    if (state.status == GameStatus.waitingForResponse && history.isNotEmpty) {
      final lastMessage = history.removeLast();
      state = state.copyWith(history: history);
      final allSet = _ready(history);
      if (allSet) _send(lastMessage);
    } else {
      final allSet = _ready(history);
      if (allSet) state = state.copyWith(status: saveData.gameData.status);
    }
  }

  void introFinished() {
    state = state.copyWith(status: GameStatus.ready);
  }

  void goToView(GameView view) {
    state = state.copyWith(view: view);
  }

  Future<TurnResponse?> sendParlayMessage(String text, String representativeId, {bool isFirst = false}) {
    final prompt = (isFirst ? representativeChatStartTemplate : representativeChatTemplate)
        .replaceAll(ChatTemplateFields.representativeId.tag, representativeId)
        .replaceAll(ChatTemplateFields.message.tag, text)
        .trim();
    log('parlay prompt:\n$prompt');
    return _send(prompt);
  }

  Future<TurnResponse?> leaveParlayMessage(String representativeId) async {
    final prompt =
        representativeChatLeaveTemplate.replaceAll(ChatTemplateFields.representativeId.tag, representativeId).trim();
    print('leave parlay prompt:\n$prompt');
    final response = await _send(prompt, requiresResponse: false);
    final billAmendments = response?.billAmendments ?? [];
    for (final amendment in billAmendments) {
      final index = state.bills.indexWhere((e) => e.id == amendment.billId);
      if (index < 0) continue;

      final bill = state.bills[index];
      final suggestedAmendments = {...bill.suggestedAmendments.toSet(), ...amendment.amendments}.toList();
      final updatedBill = bill.copyWith(suggestedAmendments: suggestedAmendments);
      final updatedBills = [...state.bills];
      updatedBills.replaceRange(index, index + 1, [updatedBill]);
      state = state.copyWith(bills: updatedBills);
    }
    return null;
  }

  Future<TurnResponse?> askForFunds(String lobbyingGroupId) async {
    final prompt = fundingChatTemplate.replaceAll(ChatTemplateFields.lobbyingGroupId.tag, lobbyingGroupId).trim();
    print('funds prompt:\n$prompt');
    final response = await _send(prompt);
    final funds = response?.funding?.amount ?? 0;
    state = state.copyWith(
      funds: state.funds + funds,
      constituency: state.constituency + (response?.funding?.constituency ?? 0),
      publicOpinion: state.publicOpinion + (response?.funding?.publicOpinion ?? 0),
    );
    return response;
  }

  Future<TurnResponse?> askForFeedback({String? lobbyingGroupId, String? partyId}) async {
    if (lobbyingGroupId == null && partyId == null) return null;

    final String prompt;
    if (lobbyingGroupId != null) {
      prompt =
          feedbackLobbyingGroupChatTemplate.replaceAll(ChatTemplateFields.lobbyingGroupId.tag, lobbyingGroupId).trim();
    } else {
      prompt = feedbackPartyChatTemplate.replaceAll(ChatTemplateFields.partyId.tag, partyId!).trim();
    }
    log('feedback prompt:\n$prompt');

    final response = await _send(prompt);
    return response;
  }

  Future<TurnResponse?> putBillToVote(String billId, String vote, {List<String>? amendments}) async {
    final amendmentsString = (amendments ?? []).join('/n').trim();
    final prompt = (amendmentsString.isNotEmpty ? billAmendmentsChatTemplate : billChatTemplate)
        .replaceAll(ChatTemplateFields.billId.tag, billId)
        .replaceAll(ChatTemplateFields.vote.tag, vote)
        .trim();
    if (amendmentsString.isNotEmpty) prompt.replaceAll(ChatTemplateFields.amendments.tag, amendmentsString);
    log('bill prompt:\n$prompt');
    final response = await _send(prompt);
    final billResponse = response?.bill;
    if (billResponse != null) {
      final repIds = state.representatives.map((e) => e.id).toSet();
      List<String> votedFor = billResponse.votedFor.toSet().toList();
      List<String> votedAgainst = billResponse.votedAgainst.toSet().toList();
      votedAgainst = votedAgainst.where((repId) => repIds.contains(repId)).toList();
      votedFor =
          votedFor.where((repId) => repIds.contains(repId)).whereNot((repId) => votedAgainst.contains(repId)).toList();
      final bills = [...state.bills];
      final index = bills.indexWhere((e) => e.id == billId);
      final bill = bills[index];
      bills[index] = bill.copyWith(
        votedFor: votedFor,
        votedAgainst: votedAgainst,
      );
      state = state.copyWith(
        bills: bills,
        constituency: state.constituency + (billResponse.constituency ?? 0),
        publicOpinion: state.publicOpinion + (billResponse.publicOpinion ?? 0),
        sustainabiliyScore: state.sustainabiliyScore + (billResponse.sustainabiliyScore ?? 0),
        greenScore: state.greenScore + (billResponse.greenScore ?? 0),
      );
    }

    return response;
  }

  Future<TurnResponse?> runCampaign(String campaign) async {
    final prompt = campaignChatTemplate
        .replaceAll(ChatTemplateFields.campaign.tag, campaign)
        .replaceAll(ChatTemplateFields.funds.tag, campaign)
        .trim();
    log('campaign prompt:\n$prompt');

    final response = await _send(prompt);
    final campaignResponse = response?.campaign;
    if (campaignResponse != null) {
      final createdCampaign = Campaign(
        id: campaignResponse.id,
        name: campaignResponse.name,
        description: campaignResponse.description,
        result: campaignResponse.result,
        amount: campaignResponse.amount,
        constituency: campaignResponse.constituency,
        publicOpinion: campaignResponse.publicOpinion,
      );

      state = state.copyWith(
        funds: state.funds - (campaignResponse.amount ?? 0),
        constituency: state.constituency + (campaignResponse.constituency ?? 0),
        publicOpinion: state.publicOpinion + (campaignResponse.publicOpinion ?? 0),
        campaigns: [...state.campaigns, createdCampaign],
      );
    }

    return response;
  }

  void toggleAmendment(String billId, String amendment) {
    final index = state.bills.indexWhere((e) => e.id == billId);
    if (index < 0) return;

    final bill = state.bills[index];
    if (!bill.suggestedAmendments.contains(amendment)) return;

    final amendments = {...bill.amendments};
    if (amendments.contains(amendment)) {
      amendments.remove(amendment);
    } else {
      amendments.add(amendment);
    }

    final updatedBill = bill.copyWith(amendments: amendments.toList());
    final updatedBills = [...state.bills];
    updatedBills.replaceRange(index, index + 1, [updatedBill]);
    state = state.copyWith(bills: updatedBills);
  }
}

extension GameStateSnackBar on GameState {
  void showSnackbar(GameSnackbar snackbar) {
    ref.read(gameSnackbarStateProvider.notifier).removeAll();
    ref.read(gameSnackbarStateProvider.notifier).scheduleSnackbar(snackbar);
  }

  void removeAllSnackbars() {
    ref.read(gameSnackbarStateProvider.notifier).removeAll();
  }
}

String _sanitiseJsonText(String text) {
  return fixJsonLists(sanitiseAiJsonText(text));
}

extension GameStateCreate on GameState {
  GenerativeModel _createModel(String systemPrompt, Schema responseSchema) {
    return GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: _geminiApiKey,
      systemInstruction: Content.text(systemPrompt),
      safetySettings: [
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.low),
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.low),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.low),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.low),
      ],
      generationConfig: GenerationConfig(
        candidateCount: 1,
        maxOutputTokens: 24000,
        temperature: 2,
        topP: 0.9,
        topK: 30,
        responseMimeType: 'application/json',
        responseSchema: responseSchema,
      ),
    );
  }

  Future<_CreatedGameObject<T>> _createObjects<T>(
    String systemPrompt,
    String prompt,
    Schema responseSchema,
    T Function(dynamic) converter,
  ) async {
    final model = _createModel(
      systemPrompt,
      responseSchema,
    );

    final objectsProperty =
        responseSchema.properties?.entries.firstWhereOrNull((e) => e.value.type == SchemaType.array)?.key;
    final schemaKeys =
        responseSchema.properties?.entries.map((e) => e.value.nullable == false ? e.key : null).whereType<String>() ??
            [];

    int retries = 0;
    List<T> objects = [];
    dynamic lastData;
    while (objects.isEmpty) {
      if (_isDisposed) break;

      retries++;
      if (retries > 10) break;

      final content = [Content.text(prompt)];
      String responseText = "";
      try {
        final response = await model.generateContent(content);
        responseText = response.text ?? "";
      } catch (_) {}

      final sanitisedText = _sanitiseJsonText(responseText);

      dynamic data;
      try {
        data = jsonDecode(sanitisedText);
      } catch (e, s) {
        log('_createObjects<$T> error: $e\n$s');
        data = null;
      }
      lastData = data;
      if (data is! Map) continue;

      // check all is there
      bool allThere = true;
      for (final key in schemaKeys) {
        if (!data.containsKey(key)) {
          allThere = false;
          break;
        }
      }
      if (!allThere) {
        log('_createObjects<$T> missing data: ${data.keys}');
        continue;
      }

      // is data there
      final objectData = data[objectsProperty] as List?;
      if (objectData == null) {
        log('_createObjects<$T> missing data: ${data.keys}');
        continue;
      }

      try {
        objects = objectData.map((e) => converter.call(e)).toList();
      } catch (e, s) {
        log('_createObjects<$T> error: $e\n$s');
        objects = [];
      }
    }

    return _CreatedGameObject(objects: objects, response: lastData);
  }

  Future<List<Constituency>> _createConstituencies() async {
    return (await _createObjects(
      gameTemplateSystemConsituencies,
      gameTemplatePrompt,
      Schema.object(
        properties: {
          'constituencies': Schema.array(
            items: Constituency.schema,
            description: 'list of constituencies in the game',
            nullable: false,
          ),
        },
      ),
      (e) => Constituency.fromJson(e),
    ))
        .objects;
  }

  Future<List<Party>> _createPartiess() async {
    return (await _createObjects(
      gameTemplateSystemParties,
      gameTemplatePrompt,
      Schema.object(
        properties: {
          'parties': Schema.array(
            items: Party.schema,
            description: 'list of parties in the game',
            nullable: false,
          ),
        },
      ),
      (e) => Party.fromJson(e),
    ))
        .objects;
  }

  Future<List<LobbyingGroup>> _createLobbyGroups() async {
    return (await _createObjects(
      gameTemplateSystemLoggyingGroups,
      gameTemplatePrompt,
      Schema.object(
        properties: {
          'lobbyingGroups': Schema.array(
            items: LobbyingGroup.schema,
            description: 'list of lobbying groups in the game',
            nullable: false,
          ),
        },
      ),
      (e) => LobbyingGroup.fromJson(e),
    ))
        .objects;
  }

  Future<List<Representative>> _createRepresentatives(
    List<Constituency> constituencies,
    List<Party> parties,
    List<LobbyingGroup> lobbyingGroups,
  ) async {
    final systemPrompt = gameTemplateSystemRepresentatives.replaceAll(
        GameTemplateFields.gameData.tag,
        jsonEncode({
          'constituencies': constituencies.map((e) => e.toJson()).toList(),
          'parties': parties.map((e) => e.toJson()).toList(),
          'lobbyingGroups': lobbyingGroups.map((e) => e.toJson()).toList(),
        }));

    final data = await _createObjects(
      systemPrompt,
      gameTemplatePrompt,
      Schema.object(
        properties: {
          'representatives': Schema.array(
            items: Representative.schema,
            description: 'list of representatives in the game',
            nullable: false,
          ),
          'playerId': Schema.string(description: 'id of the representative player character', nullable: false),
        },
      ),
      (e) => Representative.fromJson(e),
    );

    List<Representative> representatives = data.objects;

    final playerId = data.response is Map ? data.response['playerId'] as String? : null;
    final player = representatives.firstWhereOrNull((e) => e.id == playerId);

    if (player == null) {
      log('_createRepresentatives missing player: ${data.response}');
    }

    if (player != null) {
      representatives = [player, ...representatives.whereNot((e) => e.id == playerId)];
    }

    return representatives;
  }

  Future<List<Bill>> _createBills(
    List<Constituency> constituencies,
    List<Party> parties,
    List<LobbyingGroup> lobbyingGroups,
    List<Representative> representatives,
  ) async {
    final systemPrompt = gameTemplateSystemBills.replaceAll(
        GameTemplateFields.gameData.tag,
        jsonEncode({
          'constituencies': constituencies.map((e) => e.toJson()).toList(),
          'parties': parties.map((e) => e.toJson()).toList(),
          'lobbyingGroups': lobbyingGroups.map((e) => e.toJson()).toList(),
          'representatives': representatives.map((e) => e.toJson()).toList(),
        }));

    final data = await _createObjects(
      systemPrompt,
      gameTemplatePrompt,
      Schema.object(
        properties: {
          'representativeBills': Schema.array(
            items: RepresentativeBills.schema,
            description: 'list of bills for each representative',
            nullable: false,
          ),
        },
      ),
      (e) => RepresentativeBills.fromJson(e),
    );

    final bills = data.objects
        .map((e) {
          return e.bills.map((bill) => Bill.fromRepresentative(bill, e.representativeId)).toList();
        })
        .expand((e) => e)
        .toList();
    return bills;
  }

  Future<_CreatedAllGameObjects> _createAllGameObjects() async {
    final model = _createModel(
      gameTemplateSystemNew,
      Schema.object(
        properties: {
          'representatives': Schema.array(
            items: Representative.schema,
            description: 'list of representatives in the game',
            nullable: false,
          ),
          'constituencies': Schema.array(
            items: Constituency.schema,
            description: 'list of constituencies in the game',
            nullable: false,
          ),
          'lobbyingGroups': Schema.array(
            items: LobbyingGroup.schema,
            description: 'list of lobbying groups in the game',
            nullable: false,
          ),
          'parties': Schema.array(
            items: Party.schema,
            description: 'list of parties in the game',
            nullable: false,
          ),
          'representativeBills': Schema.array(
            items: Schema.object(
              properties: {
                'representativeId': Schema.string(description: 'id of representative', nullable: false),
                'bills': Schema.array(
                  items: Schema.object(properties: {
                    'id': Schema.string(description: 'unique id', nullable: false),
                    'name': Schema.string(description: 'name of the bill', nullable: false),
                    'description': Schema.string(description: 'description of the bill', nullable: false),
                  }),
                  description: 'list of bills sponsored by the representative',
                  nullable: false,
                ),
              },
            ),
            description: 'list of bills for each representative',
            nullable: false,
          ),
          'playerId': Schema.string(description: 'id of the representative player character', nullable: false),
        },
      ),
    );

    int retries = 0;
    _CreatedAllGameObjects objects = _CreatedAllGameObjects.empty();
    while (objects.isEmpty) {
      if (_isDisposed) break;

      retries++;
      if (retries > 10) break;

      final content = [Content.text(gameTemplatePrompt)];
      try {
        final response = await model.generateContent(content);
        objects = _createFromJson(response.text ?? "");
      } catch (_) {}
    }

    return objects;
  }

  _CreatedAllGameObjects _createFromJson(String jsonString) {
    final sanitisedText = _sanitiseJsonText(jsonString);

    dynamic data;
    try {
      data = jsonDecode(sanitisedText);
    } catch (e, s) {
      log('_createAllGameObjects error: $e\n$s');
      data = null;
    }
    if (data is! Map) return _CreatedAllGameObjects.empty();

    final representativesData = data['representatives'] as List?;
    final constituenciesData = data['constituencies'] as List?;
    final lobbyingGroupsData = data['lobbyingGroups'] as List?;
    final partiesData = data['parties'] as List?;
    final billsData = data['representativeBills'] as List?;
    final playerId = data['playerId'] as String?;

    // if any is missing => error
    if (representativesData == null ||
        constituenciesData == null ||
        lobbyingGroupsData == null ||
        partiesData == null ||
        billsData == null ||
        playerId == null) {
      log('_createAllGameObjects missing data: ${data.keys}');
      return _CreatedAllGameObjects.empty();
    }

    try {
      List<Representative> representatives = representativesData.map((e) => Representative.fromJson(e)).toList();
      final constituencies = constituenciesData.map((e) => Constituency.fromJson(e)).toList();
      final lobbyingGroups = lobbyingGroupsData.map((e) => LobbyingGroup.fromJson(e)).toList();
      final parties = partiesData.map((e) => Party.fromJson(e)).toList();
      final bills = billsData
          .map((e) {
            if (e is! Map) return null;
            final representativeId = e['representativeId'] as String?;
            if (representativeId == null) return null;

            final billsData = e['bills'] as List?;
            if (billsData == null) return null;

            List<Bill?> bills = [];
            try {
              bills = billsData.map((e) => Bill.fromJson(e..['sponsorId'] = representativeId)).toList();
            } catch (e, s) {
              log('_createAllGameObjects bills format error: $e\n$s');
            }

            return bills;
          })
          .whereType<List<Bill>>()
          .expand((e) => e)
          .toList();

      // sort out the player character
      final player = representatives.firstWhereOrNull((e) => e.id == playerId);
      if (player == null) {
        log('_createAllGameObjects missing player: $data}');
        return _CreatedAllGameObjects.empty();
      }
      representatives = [player, ...representatives.whereNot((e) => e.id == playerId)];

      return _CreatedAllGameObjects(
        constituencies: constituencies,
        parties: parties,
        lobbyingGroups: lobbyingGroups,
        representatives: representatives,
        bills: bills,
      );
    } catch (e, s) {
      log('_createAllGameObjects format error: $e\n$s');
    }

    return _CreatedAllGameObjects.empty();
  }
}

class _CreatedGameObject<T> {
  final List<T> objects;
  final dynamic response;

  const _CreatedGameObject({required this.objects, required this.response});
}

class _CreatedAllGameObjects {
  final List<Constituency> constituencies;
  final List<Party> parties;
  final List<LobbyingGroup> lobbyingGroups;
  final List<Representative> representatives;
  final List<Bill> bills;

  const _CreatedAllGameObjects(
      {required this.constituencies,
      required this.parties,
      required this.lobbyingGroups,
      required this.representatives,
      required this.bills});

  factory _CreatedAllGameObjects.empty() => const _CreatedAllGameObjects(
        constituencies: [],
        parties: [],
        lobbyingGroups: [],
        representatives: [],
        bills: [],
      );

  bool get isEmpty =>
      constituencies.isEmpty || parties.isEmpty || lobbyingGroups.isEmpty || representatives.isEmpty || bills.isEmpty;
}

class _MessageInQueue {
  final String message;
  final Completer<TurnResponse?> completer;
  final bool requiresResponse;

  const _MessageInQueue(this.message, this.completer, this.requiresResponse);
}
