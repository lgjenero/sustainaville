// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'representative.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Representative _$RepresentativeFromJson(Map<String, dynamic> json) {
  return _Representative.fromJson(json);
}

/// @nodoc
mixin _$Representative {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ChararcterDesign get design => throw _privateConstructorUsedError;
  String get partyId => throw _privateConstructorUsedError;
  String get constituencyId => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get lobbyingGroupIds => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get supportBase => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get ideals => throw _privateConstructorUsedError;
  String get goals => throw _privateConstructorUsedError;
  String get previousOccupation => throw _privateConstructorUsedError;
  String get education => throw _privateConstructorUsedError;
  String get personalBackground => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get personalityTraits => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get strengths => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get weaknesses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepresentativeCopyWith<Representative> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepresentativeCopyWith<$Res> {
  factory $RepresentativeCopyWith(
          Representative value, $Res Function(Representative) then) =
      _$RepresentativeCopyWithImpl<$Res, Representative>;
  @useResult
  $Res call(
      {String id,
      String name,
      ChararcterDesign design,
      String partyId,
      String constituencyId,
      @StringListConverter() List<String> lobbyingGroupIds,
      @StringListConverter() List<String> supportBase,
      @StringListConverter() List<String> ideals,
      String goals,
      String previousOccupation,
      String education,
      String personalBackground,
      @StringListConverter() List<String> personalityTraits,
      @StringListConverter() List<String> strengths,
      @StringListConverter() List<String> weaknesses});

  $ChararcterDesignCopyWith<$Res> get design;
}

/// @nodoc
class _$RepresentativeCopyWithImpl<$Res, $Val extends Representative>
    implements $RepresentativeCopyWith<$Res> {
  _$RepresentativeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? design = null,
    Object? partyId = null,
    Object? constituencyId = null,
    Object? lobbyingGroupIds = null,
    Object? supportBase = null,
    Object? ideals = null,
    Object? goals = null,
    Object? previousOccupation = null,
    Object? education = null,
    Object? personalBackground = null,
    Object? personalityTraits = null,
    Object? strengths = null,
    Object? weaknesses = null,
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
      design: null == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as ChararcterDesign,
      partyId: null == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String,
      constituencyId: null == constituencyId
          ? _value.constituencyId
          : constituencyId // ignore: cast_nullable_to_non_nullable
              as String,
      lobbyingGroupIds: null == lobbyingGroupIds
          ? _value.lobbyingGroupIds
          : lobbyingGroupIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      supportBase: null == supportBase
          ? _value.supportBase
          : supportBase // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ideals: null == ideals
          ? _value.ideals
          : ideals // ignore: cast_nullable_to_non_nullable
              as List<String>,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as String,
      previousOccupation: null == previousOccupation
          ? _value.previousOccupation
          : previousOccupation // ignore: cast_nullable_to_non_nullable
              as String,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String,
      personalBackground: null == personalBackground
          ? _value.personalBackground
          : personalBackground // ignore: cast_nullable_to_non_nullable
              as String,
      personalityTraits: null == personalityTraits
          ? _value.personalityTraits
          : personalityTraits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      strengths: null == strengths
          ? _value.strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      weaknesses: null == weaknesses
          ? _value.weaknesses
          : weaknesses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChararcterDesignCopyWith<$Res> get design {
    return $ChararcterDesignCopyWith<$Res>(_value.design, (value) {
      return _then(_value.copyWith(design: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepresentativeImplCopyWith<$Res>
    implements $RepresentativeCopyWith<$Res> {
  factory _$$RepresentativeImplCopyWith(_$RepresentativeImpl value,
          $Res Function(_$RepresentativeImpl) then) =
      __$$RepresentativeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      ChararcterDesign design,
      String partyId,
      String constituencyId,
      @StringListConverter() List<String> lobbyingGroupIds,
      @StringListConverter() List<String> supportBase,
      @StringListConverter() List<String> ideals,
      String goals,
      String previousOccupation,
      String education,
      String personalBackground,
      @StringListConverter() List<String> personalityTraits,
      @StringListConverter() List<String> strengths,
      @StringListConverter() List<String> weaknesses});

  @override
  $ChararcterDesignCopyWith<$Res> get design;
}

/// @nodoc
class __$$RepresentativeImplCopyWithImpl<$Res>
    extends _$RepresentativeCopyWithImpl<$Res, _$RepresentativeImpl>
    implements _$$RepresentativeImplCopyWith<$Res> {
  __$$RepresentativeImplCopyWithImpl(
      _$RepresentativeImpl _value, $Res Function(_$RepresentativeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? design = null,
    Object? partyId = null,
    Object? constituencyId = null,
    Object? lobbyingGroupIds = null,
    Object? supportBase = null,
    Object? ideals = null,
    Object? goals = null,
    Object? previousOccupation = null,
    Object? education = null,
    Object? personalBackground = null,
    Object? personalityTraits = null,
    Object? strengths = null,
    Object? weaknesses = null,
  }) {
    return _then(_$RepresentativeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      design: null == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as ChararcterDesign,
      partyId: null == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String,
      constituencyId: null == constituencyId
          ? _value.constituencyId
          : constituencyId // ignore: cast_nullable_to_non_nullable
              as String,
      lobbyingGroupIds: null == lobbyingGroupIds
          ? _value._lobbyingGroupIds
          : lobbyingGroupIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      supportBase: null == supportBase
          ? _value._supportBase
          : supportBase // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ideals: null == ideals
          ? _value._ideals
          : ideals // ignore: cast_nullable_to_non_nullable
              as List<String>,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as String,
      previousOccupation: null == previousOccupation
          ? _value.previousOccupation
          : previousOccupation // ignore: cast_nullable_to_non_nullable
              as String,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String,
      personalBackground: null == personalBackground
          ? _value.personalBackground
          : personalBackground // ignore: cast_nullable_to_non_nullable
              as String,
      personalityTraits: null == personalityTraits
          ? _value._personalityTraits
          : personalityTraits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      strengths: null == strengths
          ? _value._strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      weaknesses: null == weaknesses
          ? _value._weaknesses
          : weaknesses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepresentativeImpl implements _Representative {
  const _$RepresentativeImpl(
      {required this.id,
      required this.name,
      required this.design,
      required this.partyId,
      required this.constituencyId,
      @StringListConverter() required final List<String> lobbyingGroupIds,
      @StringListConverter() required final List<String> supportBase,
      @StringListConverter() required final List<String> ideals,
      required this.goals,
      required this.previousOccupation,
      required this.education,
      required this.personalBackground,
      @StringListConverter() required final List<String> personalityTraits,
      @StringListConverter() required final List<String> strengths,
      @StringListConverter() required final List<String> weaknesses})
      : _lobbyingGroupIds = lobbyingGroupIds,
        _supportBase = supportBase,
        _ideals = ideals,
        _personalityTraits = personalityTraits,
        _strengths = strengths,
        _weaknesses = weaknesses;

  factory _$RepresentativeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepresentativeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final ChararcterDesign design;
  @override
  final String partyId;
  @override
  final String constituencyId;
  final List<String> _lobbyingGroupIds;
  @override
  @StringListConverter()
  List<String> get lobbyingGroupIds {
    if (_lobbyingGroupIds is EqualUnmodifiableListView)
      return _lobbyingGroupIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lobbyingGroupIds);
  }

  final List<String> _supportBase;
  @override
  @StringListConverter()
  List<String> get supportBase {
    if (_supportBase is EqualUnmodifiableListView) return _supportBase;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportBase);
  }

  final List<String> _ideals;
  @override
  @StringListConverter()
  List<String> get ideals {
    if (_ideals is EqualUnmodifiableListView) return _ideals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ideals);
  }

  @override
  final String goals;
  @override
  final String previousOccupation;
  @override
  final String education;
  @override
  final String personalBackground;
  final List<String> _personalityTraits;
  @override
  @StringListConverter()
  List<String> get personalityTraits {
    if (_personalityTraits is EqualUnmodifiableListView)
      return _personalityTraits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_personalityTraits);
  }

  final List<String> _strengths;
  @override
  @StringListConverter()
  List<String> get strengths {
    if (_strengths is EqualUnmodifiableListView) return _strengths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strengths);
  }

  final List<String> _weaknesses;
  @override
  @StringListConverter()
  List<String> get weaknesses {
    if (_weaknesses is EqualUnmodifiableListView) return _weaknesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weaknesses);
  }

  @override
  String toString() {
    return 'Representative(id: $id, name: $name, design: $design, partyId: $partyId, constituencyId: $constituencyId, lobbyingGroupIds: $lobbyingGroupIds, supportBase: $supportBase, ideals: $ideals, goals: $goals, previousOccupation: $previousOccupation, education: $education, personalBackground: $personalBackground, personalityTraits: $personalityTraits, strengths: $strengths, weaknesses: $weaknesses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepresentativeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.design, design) || other.design == design) &&
            (identical(other.partyId, partyId) || other.partyId == partyId) &&
            (identical(other.constituencyId, constituencyId) ||
                other.constituencyId == constituencyId) &&
            const DeepCollectionEquality()
                .equals(other._lobbyingGroupIds, _lobbyingGroupIds) &&
            const DeepCollectionEquality()
                .equals(other._supportBase, _supportBase) &&
            const DeepCollectionEquality().equals(other._ideals, _ideals) &&
            (identical(other.goals, goals) || other.goals == goals) &&
            (identical(other.previousOccupation, previousOccupation) ||
                other.previousOccupation == previousOccupation) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.personalBackground, personalBackground) ||
                other.personalBackground == personalBackground) &&
            const DeepCollectionEquality()
                .equals(other._personalityTraits, _personalityTraits) &&
            const DeepCollectionEquality()
                .equals(other._strengths, _strengths) &&
            const DeepCollectionEquality()
                .equals(other._weaknesses, _weaknesses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      design,
      partyId,
      constituencyId,
      const DeepCollectionEquality().hash(_lobbyingGroupIds),
      const DeepCollectionEquality().hash(_supportBase),
      const DeepCollectionEquality().hash(_ideals),
      goals,
      previousOccupation,
      education,
      personalBackground,
      const DeepCollectionEquality().hash(_personalityTraits),
      const DeepCollectionEquality().hash(_strengths),
      const DeepCollectionEquality().hash(_weaknesses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepresentativeImplCopyWith<_$RepresentativeImpl> get copyWith =>
      __$$RepresentativeImplCopyWithImpl<_$RepresentativeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepresentativeImplToJson(
      this,
    );
  }
}

abstract class _Representative implements Representative {
  const factory _Representative(
          {required final String id,
          required final String name,
          required final ChararcterDesign design,
          required final String partyId,
          required final String constituencyId,
          @StringListConverter() required final List<String> lobbyingGroupIds,
          @StringListConverter() required final List<String> supportBase,
          @StringListConverter() required final List<String> ideals,
          required final String goals,
          required final String previousOccupation,
          required final String education,
          required final String personalBackground,
          @StringListConverter() required final List<String> personalityTraits,
          @StringListConverter() required final List<String> strengths,
          @StringListConverter() required final List<String> weaknesses}) =
      _$RepresentativeImpl;

  factory _Representative.fromJson(Map<String, dynamic> json) =
      _$RepresentativeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  ChararcterDesign get design;
  @override
  String get partyId;
  @override
  String get constituencyId;
  @override
  @StringListConverter()
  List<String> get lobbyingGroupIds;
  @override
  @StringListConverter()
  List<String> get supportBase;
  @override
  @StringListConverter()
  List<String> get ideals;
  @override
  String get goals;
  @override
  String get previousOccupation;
  @override
  String get education;
  @override
  String get personalBackground;
  @override
  @StringListConverter()
  List<String> get personalityTraits;
  @override
  @StringListConverter()
  List<String> get strengths;
  @override
  @StringListConverter()
  List<String> get weaknesses;
  @override
  @JsonKey(ignore: true)
  _$$RepresentativeImplCopyWith<_$RepresentativeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
