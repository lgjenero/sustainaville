// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lobbying_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LobbyingGroup _$LobbyingGroupFromJson(Map<String, dynamic> json) {
  return _LobbyingGroup.fromJson(json);
}

/// @nodoc
mixin _$LobbyingGroup {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @StringConverter()
  String get agenda => throw _privateConstructorUsedError;
  @StringConverter()
  String get areasOfInfluence => throw _privateConstructorUsedError;
  Character get leader => throw _privateConstructorUsedError;
  String get officeStyle => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get supportBase => throw _privateConstructorUsedError;
  String get influenceLevel => throw _privateConstructorUsedError;
  String get financialStrength => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LobbyingGroupCopyWith<LobbyingGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LobbyingGroupCopyWith<$Res> {
  factory $LobbyingGroupCopyWith(
          LobbyingGroup value, $Res Function(LobbyingGroup) then) =
      _$LobbyingGroupCopyWithImpl<$Res, LobbyingGroup>;
  @useResult
  $Res call(
      {String id,
      String name,
      @StringConverter() String agenda,
      @StringConverter() String areasOfInfluence,
      Character leader,
      String officeStyle,
      @StringListConverter() List<String> supportBase,
      String influenceLevel,
      String financialStrength});

  $CharacterCopyWith<$Res> get leader;
}

/// @nodoc
class _$LobbyingGroupCopyWithImpl<$Res, $Val extends LobbyingGroup>
    implements $LobbyingGroupCopyWith<$Res> {
  _$LobbyingGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? agenda = null,
    Object? areasOfInfluence = null,
    Object? leader = null,
    Object? officeStyle = null,
    Object? supportBase = null,
    Object? influenceLevel = null,
    Object? financialStrength = null,
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
      agenda: null == agenda
          ? _value.agenda
          : agenda // ignore: cast_nullable_to_non_nullable
              as String,
      areasOfInfluence: null == areasOfInfluence
          ? _value.areasOfInfluence
          : areasOfInfluence // ignore: cast_nullable_to_non_nullable
              as String,
      leader: null == leader
          ? _value.leader
          : leader // ignore: cast_nullable_to_non_nullable
              as Character,
      officeStyle: null == officeStyle
          ? _value.officeStyle
          : officeStyle // ignore: cast_nullable_to_non_nullable
              as String,
      supportBase: null == supportBase
          ? _value.supportBase
          : supportBase // ignore: cast_nullable_to_non_nullable
              as List<String>,
      influenceLevel: null == influenceLevel
          ? _value.influenceLevel
          : influenceLevel // ignore: cast_nullable_to_non_nullable
              as String,
      financialStrength: null == financialStrength
          ? _value.financialStrength
          : financialStrength // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$LobbyingGroupImplCopyWith<$Res>
    implements $LobbyingGroupCopyWith<$Res> {
  factory _$$LobbyingGroupImplCopyWith(
          _$LobbyingGroupImpl value, $Res Function(_$LobbyingGroupImpl) then) =
      __$$LobbyingGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @StringConverter() String agenda,
      @StringConverter() String areasOfInfluence,
      Character leader,
      String officeStyle,
      @StringListConverter() List<String> supportBase,
      String influenceLevel,
      String financialStrength});

  @override
  $CharacterCopyWith<$Res> get leader;
}

/// @nodoc
class __$$LobbyingGroupImplCopyWithImpl<$Res>
    extends _$LobbyingGroupCopyWithImpl<$Res, _$LobbyingGroupImpl>
    implements _$$LobbyingGroupImplCopyWith<$Res> {
  __$$LobbyingGroupImplCopyWithImpl(
      _$LobbyingGroupImpl _value, $Res Function(_$LobbyingGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? agenda = null,
    Object? areasOfInfluence = null,
    Object? leader = null,
    Object? officeStyle = null,
    Object? supportBase = null,
    Object? influenceLevel = null,
    Object? financialStrength = null,
  }) {
    return _then(_$LobbyingGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      agenda: null == agenda
          ? _value.agenda
          : agenda // ignore: cast_nullable_to_non_nullable
              as String,
      areasOfInfluence: null == areasOfInfluence
          ? _value.areasOfInfluence
          : areasOfInfluence // ignore: cast_nullable_to_non_nullable
              as String,
      leader: null == leader
          ? _value.leader
          : leader // ignore: cast_nullable_to_non_nullable
              as Character,
      officeStyle: null == officeStyle
          ? _value.officeStyle
          : officeStyle // ignore: cast_nullable_to_non_nullable
              as String,
      supportBase: null == supportBase
          ? _value._supportBase
          : supportBase // ignore: cast_nullable_to_non_nullable
              as List<String>,
      influenceLevel: null == influenceLevel
          ? _value.influenceLevel
          : influenceLevel // ignore: cast_nullable_to_non_nullable
              as String,
      financialStrength: null == financialStrength
          ? _value.financialStrength
          : financialStrength // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LobbyingGroupImpl implements _LobbyingGroup {
  const _$LobbyingGroupImpl(
      {required this.id,
      required this.name,
      @StringConverter() required this.agenda,
      @StringConverter() required this.areasOfInfluence,
      required this.leader,
      required this.officeStyle,
      @StringListConverter() required final List<String> supportBase,
      required this.influenceLevel,
      required this.financialStrength})
      : _supportBase = supportBase;

  factory _$LobbyingGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$LobbyingGroupImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @StringConverter()
  final String agenda;
  @override
  @StringConverter()
  final String areasOfInfluence;
  @override
  final Character leader;
  @override
  final String officeStyle;
  final List<String> _supportBase;
  @override
  @StringListConverter()
  List<String> get supportBase {
    if (_supportBase is EqualUnmodifiableListView) return _supportBase;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportBase);
  }

  @override
  final String influenceLevel;
  @override
  final String financialStrength;

  @override
  String toString() {
    return 'LobbyingGroup(id: $id, name: $name, agenda: $agenda, areasOfInfluence: $areasOfInfluence, leader: $leader, officeStyle: $officeStyle, supportBase: $supportBase, influenceLevel: $influenceLevel, financialStrength: $financialStrength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LobbyingGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.agenda, agenda) || other.agenda == agenda) &&
            (identical(other.areasOfInfluence, areasOfInfluence) ||
                other.areasOfInfluence == areasOfInfluence) &&
            (identical(other.leader, leader) || other.leader == leader) &&
            (identical(other.officeStyle, officeStyle) ||
                other.officeStyle == officeStyle) &&
            const DeepCollectionEquality()
                .equals(other._supportBase, _supportBase) &&
            (identical(other.influenceLevel, influenceLevel) ||
                other.influenceLevel == influenceLevel) &&
            (identical(other.financialStrength, financialStrength) ||
                other.financialStrength == financialStrength));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      agenda,
      areasOfInfluence,
      leader,
      officeStyle,
      const DeepCollectionEquality().hash(_supportBase),
      influenceLevel,
      financialStrength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LobbyingGroupImplCopyWith<_$LobbyingGroupImpl> get copyWith =>
      __$$LobbyingGroupImplCopyWithImpl<_$LobbyingGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LobbyingGroupImplToJson(
      this,
    );
  }
}

abstract class _LobbyingGroup implements LobbyingGroup {
  const factory _LobbyingGroup(
      {required final String id,
      required final String name,
      @StringConverter() required final String agenda,
      @StringConverter() required final String areasOfInfluence,
      required final Character leader,
      required final String officeStyle,
      @StringListConverter() required final List<String> supportBase,
      required final String influenceLevel,
      required final String financialStrength}) = _$LobbyingGroupImpl;

  factory _LobbyingGroup.fromJson(Map<String, dynamic> json) =
      _$LobbyingGroupImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @StringConverter()
  String get agenda;
  @override
  @StringConverter()
  String get areasOfInfluence;
  @override
  Character get leader;
  @override
  String get officeStyle;
  @override
  @StringListConverter()
  List<String> get supportBase;
  @override
  String get influenceLevel;
  @override
  String get financialStrength;
  @override
  @JsonKey(ignore: true)
  _$$LobbyingGroupImplCopyWith<_$LobbyingGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
