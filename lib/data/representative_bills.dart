import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

part 'representative_bills.freezed.dart';
part 'representative_bills.g.dart';

@freezed
class RepresentativeBill with _$RepresentativeBill {
  const factory RepresentativeBill({
    required String id,
    required String name,
    required String description,
  }) = _RepresentativeBill;

  factory RepresentativeBill.fromJson(Map<String, dynamic> json) => _$RepresentativeBillFromJson(json);

  static Schema schema = Schema.object(
    properties: {
      'id': Schema.string(description: 'unique id', nullable: false),
      'name': Schema.string(description: 'name of the bill', nullable: false),
      'description': Schema.string(description: 'description of the bill', nullable: false),
    },
    description: 'Bill definition',
  );
}

@freezed
class RepresentativeBills with _$RepresentativeBills {
  const factory RepresentativeBills({
    required String representativeId,
    required List<RepresentativeBill> bills,
  }) = _RepresentativeBills;

  factory RepresentativeBills.fromJson(Map<String, dynamic> json) => _$RepresentativeBillsFromJson(json);

  static Schema schema = Schema.object(
    properties: {
      'representativeId': Schema.string(description: 'id of representative', nullable: false),
      'bills': Schema.array(
        items: RepresentativeBill.schema,
        description: 'bills of the representative',
        nullable: false,
      ),
    },
    description: 'list of bills for each representative',
  );
}
