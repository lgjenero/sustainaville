// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'representative_bills.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepresentativeBill _$RepresentativeBillFromJson(Map<String, dynamic> json) {
  return _RepresentativeBill.fromJson(json);
}

/// @nodoc
mixin _$RepresentativeBill {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepresentativeBillCopyWith<RepresentativeBill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepresentativeBillCopyWith<$Res> {
  factory $RepresentativeBillCopyWith(
          RepresentativeBill value, $Res Function(RepresentativeBill) then) =
      _$RepresentativeBillCopyWithImpl<$Res, RepresentativeBill>;
  @useResult
  $Res call({String id, String name, String description});
}

/// @nodoc
class _$RepresentativeBillCopyWithImpl<$Res, $Val extends RepresentativeBill>
    implements $RepresentativeBillCopyWith<$Res> {
  _$RepresentativeBillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepresentativeBillImplCopyWith<$Res>
    implements $RepresentativeBillCopyWith<$Res> {
  factory _$$RepresentativeBillImplCopyWith(_$RepresentativeBillImpl value,
          $Res Function(_$RepresentativeBillImpl) then) =
      __$$RepresentativeBillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String description});
}

/// @nodoc
class __$$RepresentativeBillImplCopyWithImpl<$Res>
    extends _$RepresentativeBillCopyWithImpl<$Res, _$RepresentativeBillImpl>
    implements _$$RepresentativeBillImplCopyWith<$Res> {
  __$$RepresentativeBillImplCopyWithImpl(_$RepresentativeBillImpl _value,
      $Res Function(_$RepresentativeBillImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$RepresentativeBillImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepresentativeBillImpl implements _RepresentativeBill {
  const _$RepresentativeBillImpl(
      {required this.id, required this.name, required this.description});

  factory _$RepresentativeBillImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepresentativeBillImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'RepresentativeBill(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepresentativeBillImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepresentativeBillImplCopyWith<_$RepresentativeBillImpl> get copyWith =>
      __$$RepresentativeBillImplCopyWithImpl<_$RepresentativeBillImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepresentativeBillImplToJson(
      this,
    );
  }
}

abstract class _RepresentativeBill implements RepresentativeBill {
  const factory _RepresentativeBill(
      {required final String id,
      required final String name,
      required final String description}) = _$RepresentativeBillImpl;

  factory _RepresentativeBill.fromJson(Map<String, dynamic> json) =
      _$RepresentativeBillImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$RepresentativeBillImplCopyWith<_$RepresentativeBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RepresentativeBills _$RepresentativeBillsFromJson(Map<String, dynamic> json) {
  return _RepresentativeBills.fromJson(json);
}

/// @nodoc
mixin _$RepresentativeBills {
  String get representativeId => throw _privateConstructorUsedError;
  List<RepresentativeBill> get bills => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepresentativeBillsCopyWith<RepresentativeBills> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepresentativeBillsCopyWith<$Res> {
  factory $RepresentativeBillsCopyWith(
          RepresentativeBills value, $Res Function(RepresentativeBills) then) =
      _$RepresentativeBillsCopyWithImpl<$Res, RepresentativeBills>;
  @useResult
  $Res call({String representativeId, List<RepresentativeBill> bills});
}

/// @nodoc
class _$RepresentativeBillsCopyWithImpl<$Res, $Val extends RepresentativeBills>
    implements $RepresentativeBillsCopyWith<$Res> {
  _$RepresentativeBillsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? representativeId = null,
    Object? bills = null,
  }) {
    return _then(_value.copyWith(
      representativeId: null == representativeId
          ? _value.representativeId
          : representativeId // ignore: cast_nullable_to_non_nullable
              as String,
      bills: null == bills
          ? _value.bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<RepresentativeBill>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepresentativeBillsImplCopyWith<$Res>
    implements $RepresentativeBillsCopyWith<$Res> {
  factory _$$RepresentativeBillsImplCopyWith(_$RepresentativeBillsImpl value,
          $Res Function(_$RepresentativeBillsImpl) then) =
      __$$RepresentativeBillsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String representativeId, List<RepresentativeBill> bills});
}

/// @nodoc
class __$$RepresentativeBillsImplCopyWithImpl<$Res>
    extends _$RepresentativeBillsCopyWithImpl<$Res, _$RepresentativeBillsImpl>
    implements _$$RepresentativeBillsImplCopyWith<$Res> {
  __$$RepresentativeBillsImplCopyWithImpl(_$RepresentativeBillsImpl _value,
      $Res Function(_$RepresentativeBillsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? representativeId = null,
    Object? bills = null,
  }) {
    return _then(_$RepresentativeBillsImpl(
      representativeId: null == representativeId
          ? _value.representativeId
          : representativeId // ignore: cast_nullable_to_non_nullable
              as String,
      bills: null == bills
          ? _value._bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<RepresentativeBill>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepresentativeBillsImpl implements _RepresentativeBills {
  const _$RepresentativeBillsImpl(
      {required this.representativeId,
      required final List<RepresentativeBill> bills})
      : _bills = bills;

  factory _$RepresentativeBillsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepresentativeBillsImplFromJson(json);

  @override
  final String representativeId;
  final List<RepresentativeBill> _bills;
  @override
  List<RepresentativeBill> get bills {
    if (_bills is EqualUnmodifiableListView) return _bills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bills);
  }

  @override
  String toString() {
    return 'RepresentativeBills(representativeId: $representativeId, bills: $bills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepresentativeBillsImpl &&
            (identical(other.representativeId, representativeId) ||
                other.representativeId == representativeId) &&
            const DeepCollectionEquality().equals(other._bills, _bills));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, representativeId,
      const DeepCollectionEquality().hash(_bills));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepresentativeBillsImplCopyWith<_$RepresentativeBillsImpl> get copyWith =>
      __$$RepresentativeBillsImplCopyWithImpl<_$RepresentativeBillsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepresentativeBillsImplToJson(
      this,
    );
  }
}

abstract class _RepresentativeBills implements RepresentativeBills {
  const factory _RepresentativeBills(
          {required final String representativeId,
          required final List<RepresentativeBill> bills}) =
      _$RepresentativeBillsImpl;

  factory _RepresentativeBills.fromJson(Map<String, dynamic> json) =
      _$RepresentativeBillsImpl.fromJson;

  @override
  String get representativeId;
  @override
  List<RepresentativeBill> get bills;
  @override
  @JsonKey(ignore: true)
  _$$RepresentativeBillsImplCopyWith<_$RepresentativeBillsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
