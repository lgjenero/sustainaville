// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomFurniture _$RoomFurnitureFromJson(Map<String, dynamic> json) {
  return _RoomFurniture.fromJson(json);
}

/// @nodoc
mixin _$RoomFurniture {
  String get type => throw _privateConstructorUsedError;
  RoomFurniturePosition get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomFurnitureCopyWith<RoomFurniture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomFurnitureCopyWith<$Res> {
  factory $RoomFurnitureCopyWith(
          RoomFurniture value, $Res Function(RoomFurniture) then) =
      _$RoomFurnitureCopyWithImpl<$Res, RoomFurniture>;
  @useResult
  $Res call({String type, RoomFurniturePosition position});
}

/// @nodoc
class _$RoomFurnitureCopyWithImpl<$Res, $Val extends RoomFurniture>
    implements $RoomFurnitureCopyWith<$Res> {
  _$RoomFurnitureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as RoomFurniturePosition,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomFurnitureImplCopyWith<$Res>
    implements $RoomFurnitureCopyWith<$Res> {
  factory _$$RoomFurnitureImplCopyWith(
          _$RoomFurnitureImpl value, $Res Function(_$RoomFurnitureImpl) then) =
      __$$RoomFurnitureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, RoomFurniturePosition position});
}

/// @nodoc
class __$$RoomFurnitureImplCopyWithImpl<$Res>
    extends _$RoomFurnitureCopyWithImpl<$Res, _$RoomFurnitureImpl>
    implements _$$RoomFurnitureImplCopyWith<$Res> {
  __$$RoomFurnitureImplCopyWithImpl(
      _$RoomFurnitureImpl _value, $Res Function(_$RoomFurnitureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? position = null,
  }) {
    return _then(_$RoomFurnitureImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as RoomFurniturePosition,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomFurnitureImpl implements _RoomFurniture {
  const _$RoomFurnitureImpl({required this.type, required this.position});

  factory _$RoomFurnitureImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomFurnitureImplFromJson(json);

  @override
  final String type;
  @override
  final RoomFurniturePosition position;

  @override
  String toString() {
    return 'RoomFurniture(type: $type, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomFurnitureImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomFurnitureImplCopyWith<_$RoomFurnitureImpl> get copyWith =>
      __$$RoomFurnitureImplCopyWithImpl<_$RoomFurnitureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomFurnitureImplToJson(
      this,
    );
  }
}

abstract class _RoomFurniture implements RoomFurniture {
  const factory _RoomFurniture(
      {required final String type,
      required final RoomFurniturePosition position}) = _$RoomFurnitureImpl;

  factory _RoomFurniture.fromJson(Map<String, dynamic> json) =
      _$RoomFurnitureImpl.fromJson;

  @override
  String get type;
  @override
  RoomFurniturePosition get position;
  @override
  @JsonKey(ignore: true)
  _$$RoomFurnitureImplCopyWith<_$RoomFurnitureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoomWindows _$RoomWindowsFromJson(Map<String, dynamic> json) {
  return _RoomWindows.fromJson(json);
}

/// @nodoc
mixin _$RoomWindows {
  String get type => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomWindowsCopyWith<RoomWindows> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomWindowsCopyWith<$Res> {
  factory $RoomWindowsCopyWith(
          RoomWindows value, $Res Function(RoomWindows) then) =
      _$RoomWindowsCopyWithImpl<$Res, RoomWindows>;
  @useResult
  $Res call({String type, int count});
}

/// @nodoc
class _$RoomWindowsCopyWithImpl<$Res, $Val extends RoomWindows>
    implements $RoomWindowsCopyWith<$Res> {
  _$RoomWindowsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomWindowsImplCopyWith<$Res>
    implements $RoomWindowsCopyWith<$Res> {
  factory _$$RoomWindowsImplCopyWith(
          _$RoomWindowsImpl value, $Res Function(_$RoomWindowsImpl) then) =
      __$$RoomWindowsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, int count});
}

/// @nodoc
class __$$RoomWindowsImplCopyWithImpl<$Res>
    extends _$RoomWindowsCopyWithImpl<$Res, _$RoomWindowsImpl>
    implements _$$RoomWindowsImplCopyWith<$Res> {
  __$$RoomWindowsImplCopyWithImpl(
      _$RoomWindowsImpl _value, $Res Function(_$RoomWindowsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? count = null,
  }) {
    return _then(_$RoomWindowsImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomWindowsImpl implements _RoomWindows {
  const _$RoomWindowsImpl({required this.type, required this.count});

  factory _$RoomWindowsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomWindowsImplFromJson(json);

  @override
  final String type;
  @override
  final int count;

  @override
  String toString() {
    return 'RoomWindows(type: $type, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomWindowsImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomWindowsImplCopyWith<_$RoomWindowsImpl> get copyWith =>
      __$$RoomWindowsImplCopyWithImpl<_$RoomWindowsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomWindowsImplToJson(
      this,
    );
  }
}

abstract class _RoomWindows implements RoomWindows {
  const factory _RoomWindows(
      {required final String type,
      required final int count}) = _$RoomWindowsImpl;

  factory _RoomWindows.fromJson(Map<String, dynamic> json) =
      _$RoomWindowsImpl.fromJson;

  @override
  String get type;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$RoomWindowsImplCopyWith<_$RoomWindowsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoomDesign _$RoomDesignFromJson(Map<String, dynamic> json) {
  return _RoomDesign.fromJson(json);
}

/// @nodoc
mixin _$RoomDesign {
  String get size => throw _privateConstructorUsedError;
  String get walls => throw _privateConstructorUsedError;
  String get floor => throw _privateConstructorUsedError;
  RoomWindows get windows => throw _privateConstructorUsedError;
  List<RoomFurniture> get furniture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomDesignCopyWith<RoomDesign> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomDesignCopyWith<$Res> {
  factory $RoomDesignCopyWith(
          RoomDesign value, $Res Function(RoomDesign) then) =
      _$RoomDesignCopyWithImpl<$Res, RoomDesign>;
  @useResult
  $Res call(
      {String size,
      String walls,
      String floor,
      RoomWindows windows,
      List<RoomFurniture> furniture});

  $RoomWindowsCopyWith<$Res> get windows;
}

/// @nodoc
class _$RoomDesignCopyWithImpl<$Res, $Val extends RoomDesign>
    implements $RoomDesignCopyWith<$Res> {
  _$RoomDesignCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? walls = null,
    Object? floor = null,
    Object? windows = null,
    Object? furniture = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      walls: null == walls
          ? _value.walls
          : walls // ignore: cast_nullable_to_non_nullable
              as String,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String,
      windows: null == windows
          ? _value.windows
          : windows // ignore: cast_nullable_to_non_nullable
              as RoomWindows,
      furniture: null == furniture
          ? _value.furniture
          : furniture // ignore: cast_nullable_to_non_nullable
              as List<RoomFurniture>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomWindowsCopyWith<$Res> get windows {
    return $RoomWindowsCopyWith<$Res>(_value.windows, (value) {
      return _then(_value.copyWith(windows: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomDesignImplCopyWith<$Res>
    implements $RoomDesignCopyWith<$Res> {
  factory _$$RoomDesignImplCopyWith(
          _$RoomDesignImpl value, $Res Function(_$RoomDesignImpl) then) =
      __$$RoomDesignImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String size,
      String walls,
      String floor,
      RoomWindows windows,
      List<RoomFurniture> furniture});

  @override
  $RoomWindowsCopyWith<$Res> get windows;
}

/// @nodoc
class __$$RoomDesignImplCopyWithImpl<$Res>
    extends _$RoomDesignCopyWithImpl<$Res, _$RoomDesignImpl>
    implements _$$RoomDesignImplCopyWith<$Res> {
  __$$RoomDesignImplCopyWithImpl(
      _$RoomDesignImpl _value, $Res Function(_$RoomDesignImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? walls = null,
    Object? floor = null,
    Object? windows = null,
    Object? furniture = null,
  }) {
    return _then(_$RoomDesignImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      walls: null == walls
          ? _value.walls
          : walls // ignore: cast_nullable_to_non_nullable
              as String,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String,
      windows: null == windows
          ? _value.windows
          : windows // ignore: cast_nullable_to_non_nullable
              as RoomWindows,
      furniture: null == furniture
          ? _value._furniture
          : furniture // ignore: cast_nullable_to_non_nullable
              as List<RoomFurniture>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomDesignImpl implements _RoomDesign {
  const _$RoomDesignImpl(
      {required this.size,
      required this.walls,
      required this.floor,
      required this.windows,
      final List<RoomFurniture> furniture = const []})
      : _furniture = furniture;

  factory _$RoomDesignImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomDesignImplFromJson(json);

  @override
  final String size;
  @override
  final String walls;
  @override
  final String floor;
  @override
  final RoomWindows windows;
  final List<RoomFurniture> _furniture;
  @override
  @JsonKey()
  List<RoomFurniture> get furniture {
    if (_furniture is EqualUnmodifiableListView) return _furniture;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_furniture);
  }

  @override
  String toString() {
    return 'RoomDesign(size: $size, walls: $walls, floor: $floor, windows: $windows, furniture: $furniture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomDesignImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.walls, walls) || other.walls == walls) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.windows, windows) || other.windows == windows) &&
            const DeepCollectionEquality()
                .equals(other._furniture, _furniture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, size, walls, floor, windows,
      const DeepCollectionEquality().hash(_furniture));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomDesignImplCopyWith<_$RoomDesignImpl> get copyWith =>
      __$$RoomDesignImplCopyWithImpl<_$RoomDesignImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomDesignImplToJson(
      this,
    );
  }
}

abstract class _RoomDesign implements RoomDesign {
  const factory _RoomDesign(
      {required final String size,
      required final String walls,
      required final String floor,
      required final RoomWindows windows,
      final List<RoomFurniture> furniture}) = _$RoomDesignImpl;

  factory _RoomDesign.fromJson(Map<String, dynamic> json) =
      _$RoomDesignImpl.fromJson;

  @override
  String get size;
  @override
  String get walls;
  @override
  String get floor;
  @override
  RoomWindows get windows;
  @override
  List<RoomFurniture> get furniture;
  @override
  @JsonKey(ignore: true)
  _$$RoomDesignImplCopyWith<_$RoomDesignImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
mixin _$Room {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  RoomDesign get design => throw _privateConstructorUsedError;
  List<String> get clues => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res, Room>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      RoomDesign design,
      List<String> clues});

  $RoomDesignCopyWith<$Res> get design;
}

/// @nodoc
class _$RoomCopyWithImpl<$Res, $Val extends Room>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? design = null,
    Object? clues = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      design: null == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as RoomDesign,
      clues: null == clues
          ? _value.clues
          : clues // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomDesignCopyWith<$Res> get design {
    return $RoomDesignCopyWith<$Res>(_value.design, (value) {
      return _then(_value.copyWith(design: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomImplCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$$RoomImplCopyWith(
          _$RoomImpl value, $Res Function(_$RoomImpl) then) =
      __$$RoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      RoomDesign design,
      List<String> clues});

  @override
  $RoomDesignCopyWith<$Res> get design;
}

/// @nodoc
class __$$RoomImplCopyWithImpl<$Res>
    extends _$RoomCopyWithImpl<$Res, _$RoomImpl>
    implements _$$RoomImplCopyWith<$Res> {
  __$$RoomImplCopyWithImpl(_$RoomImpl _value, $Res Function(_$RoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? design = null,
    Object? clues = null,
  }) {
    return _then(_$RoomImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      design: null == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as RoomDesign,
      clues: null == clues
          ? _value._clues
          : clues // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomImpl implements _Room {
  const _$RoomImpl(
      {required this.id,
      required this.name,
      this.description,
      required this.design,
      required final List<String> clues})
      : _clues = clues;

  factory _$RoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final RoomDesign design;
  final List<String> _clues;
  @override
  List<String> get clues {
    if (_clues is EqualUnmodifiableListView) return _clues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clues);
  }

  @override
  String toString() {
    return 'Room(id: $id, name: $name, description: $description, design: $design, clues: $clues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.design, design) || other.design == design) &&
            const DeepCollectionEquality().equals(other._clues, _clues));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, design,
      const DeepCollectionEquality().hash(_clues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      __$$RoomImplCopyWithImpl<_$RoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomImplToJson(
      this,
    );
  }
}

abstract class _Room implements Room {
  const factory _Room(
      {required final String id,
      required final String name,
      final String? description,
      required final RoomDesign design,
      required final List<String> clues}) = _$RoomImpl;

  factory _Room.fromJson(Map<String, dynamic> json) = _$RoomImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  RoomDesign get design;
  @override
  List<String> get clues;
  @override
  @JsonKey(ignore: true)
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
