import 'package:json_annotation/json_annotation.dart';

class StringListConverter implements JsonConverter<List<String>, Object> {
  const StringListConverter();

  @override
  List<String> fromJson(Object data) {
    if (data is List) return data.map((e) => e.toString()).toList();

    final strData = data.toString();
    final partsData = strData.split(',');
    final parts = <String>[];
    for (var part in partsData) {
      String trimmed = part.trim();
      if (trimmed.startsWith('"')) trimmed = trimmed.substring(1);
      if (trimmed.endsWith('"')) trimmed = trimmed.substring(0, trimmed.length - 1);
      if (trimmed.isNotEmpty) parts.add(trimmed);
    }

    return parts;
  }

  @override
  Object toJson(List<String> data) => data;
}
