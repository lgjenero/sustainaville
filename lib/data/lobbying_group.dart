import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:sustainaville/data/character.dart';
import 'package:sustainaville/data/converters/string_converter.dart';
import 'package:sustainaville/data/converters/string_list_converter.dart';
import 'package:sustainaville/utils/strings/similar_string.dart';

part 'lobbying_group.freezed.dart';
part 'lobbying_group.g.dart';

enum LobbyingGroupOfficeStyle {
  eco,
  industry,
  money,
  workers,
}

@freezed
class LobbyingGroup with _$LobbyingGroup {
  const factory LobbyingGroup({
    required String id,
    required String name,
    @StringConverter() required String agenda,
    @StringConverter() required String areasOfInfluence,
    required Character leader,
    required String officeStyle,
    @StringListConverter() required List<String> supportBase,
    required String influenceLevel,
    required String financialStrength,
  }) = _LobbyingGroup;

  factory LobbyingGroup.fromJson(Map<String, dynamic> json) => _$LobbyingGroupFromJson(json);

  static Schema get schema => Schema.object(properties: {
        'id': Schema.string(description: 'unique id', nullable: false),
        'name': Schema.string(description: 'name of the lobbying group', nullable: false),
        'agenda': Schema.string(description: 'main objectives and interests of the group', nullable: false),
        'areasOfInfluence': Schema.string(description: 'sectors or issues the group focuses on', nullable: false),
        'leader': Character.schema..nullable = false,
        'officeStyle': Schema.enumString(
          enumValues: LobbyingGroupOfficeStyle.values.map((e) => e.name).toList(),
          nullable: false,
        ),
        'supportBase': Schema.array(
          items: Schema.string(),
          description: 'Who supports or funds the group',
          nullable: false,
        ),
        'influenceLevel': Schema.enumString(
          enumValues: ['low', 'mid', 'high'],
          description: 'group\'s influence in politics',
          nullable: false,
        ),
        'financialStrength': Schema.enumString(
          enumValues: ['low', 'mid', 'high'],
          description: 'group\'s finacial strength and contributions in politics',
          nullable: false,
        ),
      });
}

extension LobbyingGroupX on LobbyingGroup {
  LobbyingGroupOfficeStyle get fixedOfficeStyle {
    final options = LobbyingGroupOfficeStyle.values.map((e) => e.name);
    final value = officeStyle.toLowerCase();
    if (options.contains(value)) {
      return LobbyingGroupOfficeStyle.values.firstWhere((e) => e.name == value);
    }

    final fixed = getMostSimilarString(value, options.toList());
    return LobbyingGroupOfficeStyle.values.firstWhere((e) => e.name == fixed);
  }
}
