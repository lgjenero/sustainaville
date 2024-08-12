import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/data/converters/string_list_converter.dart';

part 'representative.freezed.dart';
part 'representative.g.dart';

@freezed
class Representative with _$Representative {
  const factory Representative({
    required String id,
    required String name,
    required ChararcterDesign design,
    required String partyId,
    required String constituencyId,
    @StringListConverter() required List<String> lobbyingGroupIds,
    @StringListConverter() required List<String> supportBase,
    @StringListConverter() required List<String> ideals,
    required String goals,
    required String previousOccupation,
    required String education,
    required String personalBackground,
    @StringListConverter() required List<String> personalityTraits,
    @StringListConverter() required List<String> strengths,
    @StringListConverter() required List<String> weaknesses,
  }) = _Representative;

  factory Representative.fromJson(Map<String, dynamic> json) => _$RepresentativeFromJson(json);

  static Schema get schema => Schema.object(properties: {
        'id': Schema.string(description: 'unique id', nullable: false),
        'name': Schema.string(description: 'name of the representative', nullable: false),
        'design': ChararcterDesign.schema..nullable = false,
        'partyId': Schema.string(description: 'id of the party the representative belongs to', nullable: false),
        'constituencyId':
            Schema.string(description: 'id of the constituency the representative represents', nullable: false),
        'lobbyingGroupIds': Schema.array(
          items: Schema.string(),
          description: 'list of ids of lobbying groups tied to representative',
          nullable: false,
        ),
        'supportBase': Schema.array(
          items: Schema.string(),
          description: 'demographics and groups that primarily support the representative',
          nullable: false,
        ),
        'ideals': Schema.array(
          items: Schema.string(),
          description: 'ideals and values of the representative',
          nullable: false,
        ),
        'goals': Schema.string(description: 'political goal of the representative', nullable: false),
        'previousOccupation': Schema.string(description: 'previous occupation of the representative', nullable: false),
        'education': Schema.string(description: 'education of the representative', nullable: false),
        'personalBackground': Schema.string(description: 'personal background of the representative', nullable: false),
        'personalityTraits': Schema.array(
          items: Schema.string(),
          description: 'personality traits of the representative',
          nullable: false,
        ),
        'strengths': Schema.array(
          items: Schema.string(),
          description: 'strenghts of the representative in terms of politics',
          nullable: false,
        ),
        'weaknesses': Schema.array(
          items: Schema.string(),
          description: 'weaknesses of the representative in terms of politics',
          nullable: false,
        ),
      });
}
