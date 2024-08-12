import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:sustainaville/data/converters/string_converter.dart';
import 'package:sustainaville/data/converters/string_list_converter.dart';

part 'constituency.freezed.dart';
part 'constituency.g.dart';

@freezed
class Constituency with _$Constituency {
  const factory Constituency({
    required String id,
    required String name,
    @StringConverter() required String geographicalArea,
    @StringConverter() required String economy,
    @StringConverter() required String demography,
    @StringListConverter() required List<String> keyIssues,
  }) = _Constituency;

  factory Constituency.fromJson(Map<String, dynamic> json) => _$ConstituencyFromJson(json);

  static Schema get schema => Schema.object(properties: {
        'id': Schema.string(description: 'unique id', nullable: false),
        'name': Schema.string(description: 'name of the constituency', nullable: false),
        'geographicalArea': Schema.string(description: 'geographical area of the constituency', nullable: false),
        'economy': Schema.string(description: 'main industries, economic status, issues, etc.', nullable: false),
        'demography': Schema.string(description: 'age distribution, economic status, etc.', nullable: false),
        'keyIssues': Schema.array(
          items: Schema.string(),
          description: 'list of key issues for this the constituency',
          nullable: false,
        ),
      });
}
