// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'party.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Party _$PartyFromJson(Map<String, dynamic> json) {
  return _Party.fromJson(json);
}

/// @nodoc
mixin _$Party {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get ideologicalStance => throw _privateConstructorUsedError;
  Character get leader => throw _privateConstructorUsedError;
  String get officeStyle => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get keyPolicies => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get supportBase => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartyCopyWith<Party> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartyCopyWith<$Res> {
  factory $PartyCopyWith(Party value, $Res Function(Party) then) =
      _$PartyCopyWithImpl<$Res, Party>;
  @useResult
  $Res call(
      {String id,
      String name,
      String ideologicalStance,
      Character leader,
      String officeStyle,
      @StringListConverter() List<String> keyPolicies,
      @StringListConverter() List<String> supportBase});

  $CharacterCopyWith<$Res> get leader;
}

/// @nodoc
class _$PartyCopyWithImpl<$Res, $Val extends Party>
    implements $PartyCopyWith<$Res> {
  _$PartyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ideologicalStance = null,
    Object? leader = null,
    Object? officeStyle = null,
    Object? keyPolicies = null,
    Object? supportBase = null,
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
      ideologicalStance: null == ideologicalStance
          ? _value.ideologicalStance
          : ideologicalStance // ignore: cast_nullable_to_non_nullable
              as String,
      leader: null == leader
          ? _value.leader
          : leader // ignore: cast_nullable_to_non_nullable
              as Character,
      officeStyle: null == officeStyle
          ? _value.officeStyle
          : officeStyle // ignore: cast_nullable_to_non_nullable
              as String,
      keyPolicies: null == keyPolicies
          ? _value.keyPolicies
          : keyPolicies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      supportBase: null == supportBase
          ? _value.supportBase
          : supportBase // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res> get leader {
    return $CharacterCopyWith<$Res>(_value.leader, (value) {
      return _then(_value.copyWith(leader: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PartyImplCopyWith<$Res> implements $PartyCopyWith<$Res> {
  factory _$$PartyImplCopyWith(
          _$PartyImpl value, $Res Function(_$PartyImpl) then) =
      __$$PartyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String ideologicalStance,
      Character leader,
      String officeStyle,
      @StringListConverter() List<String> keyPolicies,
      @StringListConverter() List<String> supportBase});

  @override
  $CharacterCopyWith<$Res> get leader;
}

/// @nodoc
class __$$PartyImplCopyWithImpl<$Res>
    extends _$PartyCopyWithImpl<$Res, _$PartyImpl>
    implements _$$PartyImplCopyWith<$Res> {
  __$$PartyImplCopyWithImpl(
      _$PartyImpl _value, $Res Function(_$PartyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ideologicalStance = null,
    Object? leader = null,
    Object? officeStyle = null,
    Object? keyPolicies = null,
    Object? supportBase = null,
  }) {
    return _then(_$PartyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ideologicalStance: null == ideologicalStance
          ? _value.ideologicalStance
          : ideologicalStance // ignore: cast_nullable_to_non_nullable
              as String,
      leader: null == leader
          ? _value.leader
          : leader // ignore: cast_nullable_to_non_nullable
              as Character,
      officeStyle: null == officeStyle
          ? _value.officeStyle
          : officeStyle // ignore: cast_nullable_to_non_nullable
              as String,
      keyPolicies: null == keyPolicies
          ? _value._keyPolicies
          : keyPolicies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      supportBase: null == supportBase
          ? _value._supportBase
          : supportBase // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartyImpl implements _Party {
  const _$PartyImpl(
      {required this.id,
      required this.name,
      required this.ideologicalStance,
      required this.leader,
      required this.officeStyle,
      @StringListConverter() required final List<String> keyPolicies,
      @StringListConverter() required final List<String> supportBase})
      : _keyPolicies = keyPolicies,
        _supportBase = supportBase;

  factory _$PartyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartyImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String ideologicalStance;
  @override
  final Character leader;
  @override
  final String officeStyle;
  final List<String> _keyPolicies;
  @override
  @StringListConverter()
  List<String> get keyPolicies {
    if (_keyPolicies is EqualUnmodifiableListView) return _keyPolicies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyPolicies);
  }

  final List<String> _supportBase;
  @override
  @StringListConverter()
  List<String> get supportBase {
    if (_supportBase is EqualUnmodifiableListView) return _supportBase;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportBase);
  }

  @override
  String toString() {
    return 'Party(id: $id, name: $name, ideologicalStance: $ideologicalStance, leader: $leader, officeStyle: $officeStyle, keyPolicies: $keyPolicies, supportBase: $supportBase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ideologicalStance, ideologicalStance) ||
                other.ideologicalStance == ideologicalStance) &&
            (identical(other.leader, leader) || other.leader == leader) &&
            (identical(other.officeStyle, officeStyle) ||
                other.officeStyle == officeStyle) &&
            const DeepCollectionEquality()
                .equals(other._keyPolicies, _keyPolicies) &&
            const DeepCollectionEquality()
                .equals(other._supportBase, _supportBase));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      ideologicalStance,
      leader,
      officeStyle,
      const DeepCollectionEquality().hash(_keyPolicies),
      const DeepCollectionEquality().hash(_supportBase));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartyImplCopyWith<_$PartyImpl> get copyWith =>
      __$$PartyImplCopyWithImpl<_$PartyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartyImplToJson(
      this,
    );
  }
}

abstract class _Party implements Party {
  const factory _Party(
          {required final String id,
          required final String name,
          required final String ideologicalStance,
          required final Character leader,
          required final String officeStyle,
          @StringListConverter() required final List<String> keyPolicies,
          @StringListConverter() required final List<String> supportBase}) =
      _$PartyImpl;

  factory _Party.fromJson(Map<String, dynamic> json) = _$PartyImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get ideologicalStance;
  @override
  Character get leader;
  @override
  String get officeStyle;
  @override
  @StringListConverter()
  List<String> get keyPolicies;
  @override
  @StringListConverter()
  List<String> get supportBase;
  @override
  @JsonKey(ignore: true)
  _$$PartyImplCopyWith<_$PartyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
