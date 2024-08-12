import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:sustainaville/data/converters/string_list_converter.dart';
import 'package:sustainaville/data/representative_bills.dart';

part 'bill.freezed.dart';
part 'bill.g.dart';

@freezed
class Bill with _$Bill {
  const factory Bill({
    required String id,
    required String name,
    required String description,
    required String sponsorId,
    @Default([]) @StringListConverter() List<String> suggestedAmendments,
    @Default([]) @StringListConverter() List<String> amendments,
    @Default([]) @StringListConverter() List<String> votedFor,
    @Default([]) @StringListConverter() List<String> votedAgainst,
  }) = _Bill;

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

  factory Bill.fromRepresentative(RepresentativeBill bill, String sponsorId) {
    return Bill(id: bill.id, name: bill.name, description: bill.description, sponsorId: sponsorId);
  }

  static Schema schema = Schema.object(
    properties: {
      'id': Schema.string(description: 'unique id', nullable: false),
      'name': Schema.string(description: 'name of the bill', nullable: false),
      'description': Schema.string(description: 'description of the bill', nullable: false),
      'sponsorId': Schema.string(description: 'id of the representative who sponsored the bill', nullable: false),
      // 'votedFor': Schema.array(
      //   items: Schema.string(),
      //   description: 'list of ids of representatives who voted for the bill',
      //   nullable: true,
      // ),
      // 'votedAgainst': Schema.array(
      //   items: Schema.string(),
      //   description: 'list of ids of representatives who voted against the bill',
      //   nullable: true,
      // ),
    },
    description: 'Bill definition',
  );
}

extension BillX on Bill {
  bool? get passed => (votedFor.isNotEmpty || votedAgainst.isNotEmpty) ? votedFor.length > votedAgainst.length : null;
}
