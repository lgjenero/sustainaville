import 'package:json_annotation/json_annotation.dart';

class StringConverter implements JsonConverter<String, Object> {
  const StringConverter();

  @override
  String fromJson(Object data) {
    if (data is List) return data.map((e) => e.toString()).join(', ');
    return data.toString();
  }

  @override
  Object toJson(String data) => data;
}
