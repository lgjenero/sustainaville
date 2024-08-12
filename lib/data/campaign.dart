import 'package:freezed_annotation/freezed_annotation.dart';

part 'campaign.freezed.dart';
part 'campaign.g.dart';

@freezed
class Campaign with _$Campaign {
  const factory Campaign({
    required String id,
    required String name,
    required String description,
    required String result,
    num? amount,
    num? constituency,
    num? publicOpinion,
  }) = _Campaign;

  factory Campaign.fromJson(Map<String, dynamic> json) => _$CampaignFromJson(json);
}
