// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomFurnitureImpl _$$RoomFurnitureImplFromJson(Map<String, dynamic> json) =>
    _$RoomFurnitureImpl(
      type: json['type'] as String,
      position: $enumDecode(_$RoomFurniturePositionEnumMap, json['position']),
    );

Map<String, dynamic> _$$RoomFurnitureImplToJson(_$RoomFurnitureImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'position': _$RoomFurniturePositionEnumMap[instance.position]!,
    };

const _$RoomFurniturePositionEnumMap = {
  RoomFurniturePosition.left: 'left',
  RoomFurniturePosition.right: 'right',
  RoomFurniturePosition.back: 'back',
  RoomFurniturePosition.center: 'center',
};

_$RoomWindowsImpl _$$RoomWindowsImplFromJson(Map<String, dynamic> json) =>
    _$RoomWindowsImpl(
      type: json['type'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$RoomWindowsImplToJson(_$RoomWindowsImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'count': instance.count,
    };

_$RoomDesignImpl _$$RoomDesignImplFromJson(Map<String, dynamic> json) =>
    _$RoomDesignImpl(
      size: json['size'] as String,
      walls: json['walls'] as String,
      floor: json['floor'] as String,
      windows: RoomWindows.fromJson(json['windows'] as Map<String, dynamic>),
      furniture: (json['furniture'] as List<dynamic>?)
              ?.map((e) => RoomFurniture.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RoomDesignImplToJson(_$RoomDesignImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'walls': instance.walls,
      'floor': instance.floor,
      'windows': instance.windows.toJson(),
      'furniture': instance.furniture.map((e) => e.toJson()).toList(),
    };

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      design: RoomDesign.fromJson(json['design'] as Map<String, dynamic>),
      clues: (json['clues'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'design': instance.design.toJson(),
      'clues': instance.clues,
    };
