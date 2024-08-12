// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'constituency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Constituency _$ConstituencyFromJson(Map<String, dynamic> json) {
  return _Constituency.fromJson(json);
}

/// @nodoc
mixin _$Constituency {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @StringConverter()
  String get geographicalArea => throw _privateConstructorUsedError;
  @StringConverter()
  String get economy => throw _privateConstructorUsedError;
  @StringConverter()
  String get demography => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get keyIssues => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConstituencyCopyWith<Constituency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConstituencyCopyWith<$Res> {
  factory $ConstituencyCopyWith(
          Constituency value, $Res Function(Constituency) then) =
      _$ConstituencyCopyWithImpl<$Res, Constituency>;
  @useResult
  $Res call(
      {String id,
      String name,
      @StringConverter() String geographicalArea,
      @StringConverter() String economy,
      @StringConverter() String demography,
      @StringListConverter() List<String> keyIssues});
}

/// @nodoc
class _$ConstituencyCopyWithImpl<$Res, $Val extends Constituency>
    implements $ConstituencyCopyWith<$Res> {
  _$ConstituencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? geographicalArea = null,
    Object? economy = null,
    Object? demography = null,
    Object? keyIssues = null,
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
      geographicalArea: null == geographicalArea
          ? _value.geographicalArea
          : geographicalArea // ignore: cast_nullable_to_non_nullable
              as String,
      economy: null == economy
          ? _value.economy
          : economy // ignore: cast_nullable_to_non_nullable
              as String,
      demography: null == demography
          ? _value.demography
          : demography // ignore: cast_nullable_to_non_nullable
              as String,
      keyIssues: null == keyIssues
          ? _value.keyIssues
          : keyIssues // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConstituencyImplCopyWith<$Res>
    implements $ConstituencyCopyWith<$Res> {
  factory _$$ConstituencyImplCopyWith(
          _$ConstituencyImpl value, $Res Function(_$ConstituencyImpl) then) =
      __$$ConstituencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @StringConverter() String geographicalArea,
      @StringConverter() String economy,
      @StringConverter() String demography,
      @StringListConverter() List<String> keyIssues});
}

/// @nodoc
class __$$ConstituencyImplCopyWithImpl<$Res>
    extends _$ConstituencyCopyWithImpl<$Res, _$ConstituencyImpl>
    implements _$$ConstituencyImplCopyWith<$Res> {
  __$$ConstituencyImplCopyWithImpl(
      _$ConstituencyImpl _value, $Res Function(_$ConstituencyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? geographicalArea = null,
    Object? economy = null,
    Object? demography = null,
    Object? keyIssues = null,
  }) {
    return _then(_$ConstituencyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      geographicalArea: null == geographicalArea
          ? _value.geographicalArea
          : geographicalArea // ignore: cast_nullable_to_non_nullable
              as String,
      economy: null == economy
          ? _value.economy
          : economy // ignore: cast_nullable_to_non_nullable
              as String,
      demography: null == demography
          ? _value.demography
          : demography // ignore: cast_nullable_to_non_nullable
              as String,
      keyIssues: null == keyIssues
          ? _value._keyIssues
          : keyIssues // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConstituencyImpl implements _Constituency {
  const _$ConstituencyImpl(
      {required this.id,
      required this.name,
      @StringConverter() required this.geographicalArea,
      @StringConverter() required this.economy,
      @StringConverter() required this.demography,
      @StringListConverter() required final List<String> keyIssues})
      : _keyIssues = keyIssues;

  factory _$ConstituencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConstituencyImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @StringConverter()
  final String geographicalArea;
  @override
  @StringConverter()
  final String economy;
  @override
  @StringConverter()
  final String demography;
  final List<String> _keyIssues;
  @override
  @StringListConverter()
  List<String> get keyIssues {
    if (_keyIssues is EqualUnmodifiableListView) return _keyIssues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyIssues);
  }

  @override
  String toString() {
    return 'Constituency(id: $id, name: $name, geographicalArea: $geographicalArea, economy: $economy, demography: $demography, keyIssues: $keyIssues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConstituencyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.geographicalArea, geographicalArea) ||
                other.geographicalArea == geographicalArea) &&
            (identical(other.economy, economy) || other.economy == economy) &&
            (identical(other.demography, demography) ||
                other.demography == demography) &&
            const DeepCollectionEquality()
                .equals(other._keyIssues, _keyIssues));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, geographicalArea,
      economy, demography, const DeepCollectionEquality().hash(_keyIssues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConstituencyImplCopyWith<_$ConstituencyImpl> get copyWith =>
      __$$ConstituencyImplCopyWithImpl<_$ConstituencyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConstituencyImplToJson(
      this,
    );
  }
}

abstract class _Constituency implements Constituency {
  const factory _Constituency(
          {required final String id,
          required final String name,
          @StringConverter() required final String geographicalArea,
          @StringConverter() required final String economy,
          @StringConverter() required final String demography,
          @StringListConverter() required final List<String> keyIssues}) =
      _$ConstituencyImpl;

  factory _Constituency.fromJson(Map<String, dynamic> json) =
      _$ConstituencyImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @StringConverter()
  String get geographicalArea;
  @override
  @StringConverter()
  String get economy;
  @override
  @StringConverter()
  String get demography;
  @override
  @StringListConverter()
  List<String> get keyIssues;
  @override
  @JsonKey(ignore: true)
  _$$ConstituencyImplCopyWith<_$ConstituencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
