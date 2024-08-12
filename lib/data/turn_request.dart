import 'package:freezed_annotation/freezed_annotation.dart';

part 'turn_request.freezed.dart';
part 'turn_request.g.dart';

@freezed
class TurnChatRequest with _$TurnChatRequest {
  const factory TurnChatRequest({
    required String representativeId,
    required String message,
  }) = _TurnChatRequest;

  factory TurnChatRequest.fromJson(Map<String, dynamic> json) => _$TurnChatRequestFromJson(json);
}

extension TurnChatRequestX on TurnChatRequest {
  String createMessage() {
    return 'Player is talking to $representativeId: $message';
  }
}

enum IncidentType {
  @JsonValue('positive')
  positive,
  @JsonValue('negative')
  negative,
}

@freezed
class TurnIncidentRequest with _$TurnIncidentRequest {
  const factory TurnIncidentRequest({
    required String representativeId,
    required IncidentType type,
  }) = _TurnIncidentRequest;

  factory TurnIncidentRequest.fromJson(Map<String, dynamic> json) => _$TurnIncidentRequestFromJson(json);
}

extension TurnIncidentRequestX on TurnIncidentRequest {
  String createMessage() {
    return 'Creata a small random incident for representative $representativeId';
  }
}

@freezed
class TurnRequest with _$TurnRequest {
  const factory TurnRequest({
    TurnChatRequest? turnChatRequest,
  }) = _TurnRequest;

  factory TurnRequest.fromJson(Map<String, dynamic> json) => _$TurnRequestFromJson(json);
}
