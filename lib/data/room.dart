import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

enum RoomFurniturePosition { left, right, back, center }

@freezed
class RoomFurniture with _$RoomFurniture {
  const factory RoomFurniture({
    required String type,
    required RoomFurniturePosition position,
  }) = _RoomFurniture;

  factory RoomFurniture.fromJson(Map<String, dynamic> json) => _$RoomFurnitureFromJson(json);
}

@freezed
class RoomWindows with _$RoomWindows {
  const factory RoomWindows({
    required String type,
    required int count,
  }) = _RoomWindows;

  factory RoomWindows.fromJson(Map<String, dynamic> json) => _$RoomWindowsFromJson(json);
}

@freezed
class RoomDesign with _$RoomDesign {
  const factory RoomDesign({
    required String size,
    required String walls,
    required String floor,
    required RoomWindows windows,
    @Default([]) List<RoomFurniture> furniture,
  }) = _RoomDesign;

  factory RoomDesign.fromJson(Map<String, dynamic> json) => _$RoomDesignFromJson(json);
}

@freezed
class Room with _$Room {
  const factory Room({
    required String id,
    required String name,
    String? description,
    required RoomDesign design,
    required List<String> clues,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
