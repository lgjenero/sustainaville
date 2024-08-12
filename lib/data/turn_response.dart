import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:sustainaville/data/converters/string_list_converter.dart';

part 'turn_response.freezed.dart';
part 'turn_response.g.dart';

@freezed
class TurnRepresentativeResponse with _$TurnRepresentativeResponse {
  const factory TurnRepresentativeResponse({
    required String representativeId,
    num? support,
    required String response,
  }) = _TurnRepresentativeResponse;

  factory TurnRepresentativeResponse.fromJson(Map<String, dynamic> json) => _$TurnRepresentativeResponseFromJson(json);

  static Schema schema = Schema.object(properties: {
    'representativeId': Schema.string(description: 'id of the representative', nullable: false),
    'support': Schema.number(description: 'support for the representative', nullable: true),
    'response': Schema.string(description: 'response from the representative', nullable: false),
  });
}

@freezed
class TurnBillResponse with _$TurnBillResponse {
  const factory TurnBillResponse({
    required String billId,
    num? constituency,
    num? publicOpinion,
    num? sustainabiliyScore,
    num? greenScore,
    @Default([]) @StringListConverter() List<String> votedFor,
    @Default([]) @StringListConverter() List<String> votedAgainst,
  }) = _TurnBillResponse;

  factory TurnBillResponse.fromJson(Map<String, dynamic> json) => _$TurnBillResponseFromJson(json);

  static Schema schema = Schema.object(properties: {
    'billId': Schema.string(description: 'id of the bill', nullable: false),
    'constituency': Schema.number(
      description:
          'number from -10 to 10 indicating how did the passing/failing of bill affect the support of the constituency for the player, 0 if no change',
      nullable: false,
    ),
    'publicOpinion': Schema.number(
      description:
          'number from -10 to 10 indicating how did the passing/failing of bill affect the public opinion of the player, 0 if no change',
      nullable: false,
    ),
    'sustainabiliyScore': Schema.number(
      description:
          'number from -10 to 10 indicating how did the passing/failing of bill affect the state\'s sutainability, 0 if no change',
      nullable: false,
    ),
    'greenScore': Schema.number(
      description:
          'number from -10 to 10 indicating how did the passing/failing of bill affect the state\'s green transition, 0 if no change',
      nullable: false,
    ),
    'votedFor': Schema.array(
      items: Schema.string(),
      description: 'list of ids of representatives who voted for the bill',
      nullable: false,
    ),
    'votedAgainst': Schema.array(
      items: Schema.string(),
      description: 'list of ids of representatives who voted against the bill',
      nullable: false,
    ),
  });
}

@freezed
class TurnIncidentResponse with _$TurnIncidentResponse {
  const factory TurnIncidentResponse({
    required String incidentId,
    required String description,
    num? constituency,
    num? publicOpinion,
  }) = _TurnIncidentResponse;

  factory TurnIncidentResponse.fromJson(Map<String, dynamic> json) => _$TurnIncidentResponseFromJson(json);

  static Schema schema = Schema.object(properties: {
    'incidentId': Schema.string(description: 'id of the incident', nullable: false),
    'description': Schema.string(description: 'description of the incident', nullable: false),
    'constituency': Schema.number(
      description:
          'number from -10 to 10 indicating how did the incident affect the support of the constituency for the player, 0 if no change',
      nullable: true,
    ),
    'publicOpinion': Schema.number(
      description:
          'number from -10 to 10 indicating how did the action affect the public opinion of the player, 0 if no change',
      nullable: true,
    ),
  });
}

@freezed
class TurnFundingResponse with _$TurnFundingResponse {
  const factory TurnFundingResponse({
    num? amount,
    num? constituency,
    num? publicOpinion,
  }) = _TurnFundingResponse;

  factory TurnFundingResponse.fromJson(Map<String, dynamic> json) => _$TurnFundingResponseFromJson(json);

  static Schema schema = Schema.object(properties: {
    'amount': Schema.number(description: 'amount of money that the player has gained 0 to 100', nullable: true),
    'constituency': Schema.number(
      description:
          'number from -10 to 10 indicating how did the funding affect the support of the constituency for the representative, 0 if no change',
      nullable: true,
    ),
    'publicOpinion': Schema.number(
      description:
          'number from -10 to 10 indicating how did the funding affect the public opinion of the representative, 0 if no change',
      nullable: true,
    ),
  });
}

@freezed
class TurnCampaignResponse with _$TurnCampaignResponse {
  const factory TurnCampaignResponse({
    required String id,
    required String name,
    required String description,
    required String result,
    num? amount,
    num? constituency,
    num? publicOpinion,
  }) = _TurnCampaignResponse;

  factory TurnCampaignResponse.fromJson(Map<String, dynamic> json) => _$TurnCampaignResponseFromJson(json);

  static Schema schema = Schema.object(properties: {
    'id': Schema.string(description: 'id of the campaign', nullable: false),
    'name': Schema.string(description: 'name of the campaign', nullable: false),
    'description': Schema.string(description: 'description of the campaign', nullable: false),
    'result': Schema.string(description: 'result of the campaign', nullable: false),
    'amount': Schema.number(description: 'amount of money that the player has spent', nullable: true),
    'constituency': Schema.number(
      description:
          'number from -10 to 10 indicating how did the campaign affect the support of the constituency for the player, 0 if no change',
      nullable: true,
    ),
    'publicOpinion': Schema.number(
      description:
          'number from -10 to 10 indicating how did the campaign affect the public opinion of the player, 0 if no change',
      nullable: true,
    ),
  });
}

@freezed
class TurnFeedbackResponse with _$TurnFeedbackResponse {
  const factory TurnFeedbackResponse({
    String? partyId,
    String? lobbyingGroupId,
    required String response,
  }) = _TurnFeedbackResponse;

  factory TurnFeedbackResponse.fromJson(Map<String, dynamic> json) => _$TurnFeedbackResponseFromJson(json);

  static Schema schema = Schema.object(properties: {
    'partyId': Schema.string(description: 'id of the party', nullable: true),
    'lobbyingGroupId': Schema.string(description: 'id of the lobbying group', nullable: true),
    'response': Schema.string(description: 'response from the party or lobbying group', nullable: false),
  });
}

@freezed
class TurnBillAmendmentResponse with _$TurnBillAmendmentResponse {
  const factory TurnBillAmendmentResponse({
    String? billId,
    @Default([]) @StringListConverter() List<String> amendments,
  }) = _TurnBillAmendmentResponse;

  factory TurnBillAmendmentResponse.fromJson(Map<String, dynamic> json) => _$TurnBillAmendmentResponseFromJson(json);

  static Schema schema = Schema.object(properties: {
    'billId': Schema.string(description: 'id of the bill to amend', nullable: true),
    'amendments': Schema.array(
      items: Schema.string(description: 'potential bill amendment', nullable: true),
      description: 'potential bill amendments extracted from the conversation',
      nullable: false,
    ),
    'response': Schema.string(description: 'response from the party or lobbying group', nullable: false),
  });
}

@freezed
class TurnResponse with _$TurnResponse {
  const factory TurnResponse({
    @Default([]) List<TurnRepresentativeResponse> representatives,
    TurnBillResponse? bill,
    TurnFundingResponse? funding,
    TurnCampaignResponse? campaign,
    TurnFeedbackResponse? feedback,
    TurnIncidentResponse? incident,
    @Default([]) List<TurnBillAmendmentResponse> billAmendments,
  }) = _TurnResponse;

  factory TurnResponse.fromJson(Map<String, dynamic> json) => _$TurnResponseFromJson(json);

  static Schema schema = Schema.object(properties: {
    'representatives': Schema.array(
      items: TurnRepresentativeResponse.schema,
      description: 'list of responses from representatives if any',
      nullable: true,
    ),
    'bill': TurnBillResponse.schema..nullable = true,
    'funding': TurnFundingResponse.schema..nullable = true,
    'campaign': TurnCampaignResponse.schema..nullable = true,
    'feedback': TurnFeedbackResponse.schema..nullable = true,
    'incident': TurnIncidentResponse.schema..nullable = true,
    'billAmendments': Schema.array(
      items: TurnBillAmendmentResponse.schema,
      description: 'list of bill potential amendments if any',
      nullable: true,
    ),
  });
}
