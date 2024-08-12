import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/data/converters/string_list_converter.dart';
import 'package:sustainaville/utils/strings/similar_string.dart';

part 'party.freezed.dart';
part 'party.g.dart';

enum PartyOfficeStyle {
  eco,
  industry,
  money,
  workers,
}

@freezed
class Party with _$Party {
  const factory Party({
    required String id,
    required String name,
    required String ideologicalStance,
    required Character leader,
    required String officeStyle,
    @StringListConverter() required List<String> keyPolicies,
    @StringListConverter() required List<String> supportBase,
  }) = _Party;

  factory Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);

  static Schema schema = Schema.object(properties: {
    'id': Schema.string(description: 'unique id', nullable: false),
    'name': Schema.string(description: 'name of the party', nullable: false),
    'ideologicalStance': Schema.string(description: 'overall political stance and key ideologies', nullable: false),
    'leader': Character.schema..nullable = false,
    'officeStyle': Schema.enumString(enumValues: PartyOfficeStyle.values.map((e) => e.name).toList(), nullable: false),
    'keyPolicies': Schema.array(
      items: Schema.string(),
      description: 'key policies the party supports',
      nullable: false,
    ),
    'supportBase': Schema.array(
      items: Schema.string(),
      description: 'demographics and groups that primarily support the party',
      nullable: false,
    ),
  });
}

extension PartyX on Party {
  PartyOfficeStyle get fixedOfficeStyle {
    final options = PartyOfficeStyle.values.map((e) => e.name);
    final value = officeStyle.toLowerCase();
    if (options.contains(value)) {
      return PartyOfficeStyle.values.firstWhere((e) => e.name == value);
    }

    final fixed = getMostSimilarString(value, options.toList());
    return PartyOfficeStyle.values.firstWhere((e) => e.name == fixed);
  }
}
