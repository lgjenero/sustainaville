// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bill _$BillFromJson(Map<String, dynamic> json) {
  return _Bill.fromJson(json);
}

/// @nodoc
mixin _$Bill {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get sponsorId => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get suggestedAmendments => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get amendments => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get votedFor => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get votedAgainst => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillCopyWith<Bill> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillCopyWith<$Res> {
  factory $BillCopyWith(Bill value, $Res Function(Bill) then) =
      _$BillCopyWithImpl<$Res, Bill>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String sponsorId,
      @StringListConverter() List<String> suggestedAmendments,
      @StringListConverter() List<String> amendments,
      @StringListConverter() List<String> votedFor,
      @StringListConverter() List<String> votedAgainst});
}

/// @nodoc
class _$BillCopyWithImpl<$Res, $Val extends Bill>
    implements $BillCopyWith<$Res> {
  _$BillCopyWithImpl(this._value, this._then);

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
    Object? sponsorId = null,
    Object? suggestedAmendments = null,
    Object? amendments = null,
    Object? votedFor = null,
    Object? votedAgainst = null,
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
      sponsorId: null == sponsorId
          ? _value.sponsorId
          : sponsorId // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedAmendments: null == suggestedAmendments
          ? _value.suggestedAmendments
          : suggestedAmendments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      amendments: null == amendments
          ? _value.amendments
          : amendments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      votedFor: null == votedFor
          ? _value.votedFor
          : votedFor // ignore: cast_nullable_to_non_nullable
              as List<String>,
      votedAgainst: null == votedAgainst
          ? _value.votedAgainst
          : votedAgainst // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillImplCopyWith<$Res> implements $BillCopyWith<$Res> {
  factory _$$BillImplCopyWith(
          _$BillImpl value, $Res Function(_$BillImpl) then) =
      __$$BillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String sponsorId,
      @StringListConverter() List<String> suggestedAmendments,
      @StringListConverter() List<String> amendments,
      @StringListConverter() List<String> votedFor,
      @StringListConverter() List<String> votedAgainst});
}

/// @nodoc
class __$$BillImplCopyWithImpl<$Res>
    extends _$BillCopyWithImpl<$Res, _$BillImpl>
    implements _$$BillImplCopyWith<$Res> {
  __$$BillImplCopyWithImpl(_$BillImpl _value, $Res Function(_$BillImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? sponsorId = null,
    Object? suggestedAmendments = null,
    Object? amendments = null,
    Object? votedFor = null,
    Object? votedAgainst = null,
  }) {
    return _then(_$BillImpl(
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
      sponsorId: null == sponsorId
          ? _value.sponsorId
          : sponsorId // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedAmendments: null == suggestedAmendments
          ? _value._suggestedAmendments
          : suggestedAmendments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      amendments: null == amendments
          ? _value._amendments
          : amendments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      votedFor: null == votedFor
          ? _value._votedFor
          : votedFor // ignore: cast_nullable_to_non_nullable
              as List<String>,
      votedAgainst: null == votedAgainst
          ? _value._votedAgainst
          : votedAgainst // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillImpl implements _Bill {
  const _$BillImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.sponsorId,
      @StringListConverter() final List<String> suggestedAmendments = const [],
      @StringListConverter() final List<String> amendments = const [],
      @StringListConverter() final List<String> votedFor = const [],
      @StringListConverter() final List<String> votedAgainst = const []})
      : _suggestedAmendments = suggestedAmendments,
        _amendments = amendments,
        _votedFor = votedFor,
        _votedAgainst = votedAgainst;

  factory _$BillImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String sponsorId;
  final List<String> _suggestedAmendments;
  @override
  @JsonKey()
  @StringListConverter()
  List<String> get suggestedAmendments {
    if (_suggestedAmendments is EqualUnmodifiableListView)
      return _suggestedAmendments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedAmendments);
  }

  final List<String> _amendments;
  @override
  @JsonKey()
  @StringListConverter()
  List<String> get amendments {
    if (_amendments is EqualUnmodifiableListView) return _amendments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amendments);
  }

  final List<String> _votedFor;
  @override
  @JsonKey()
  @StringListConverter()
  List<String> get votedFor {
    if (_votedFor is EqualUnmodifiableListView) return _votedFor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_votedFor);
  }

  final List<String> _votedAgainst;
  @override
  @JsonKey()
  @StringListConverter()
  List<String> get votedAgainst {
    if (_votedAgainst is EqualUnmodifiableListView) return _votedAgainst;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_votedAgainst);
  }

  @override
  String toString() {
    return 'Bill(id: $id, name: $name, description: $description, sponsorId: $sponsorId, suggestedAmendments: $suggestedAmendments, amendments: $amendments, votedFor: $votedFor, votedAgainst: $votedAgainst)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sponsorId, sponsorId) ||
                other.sponsorId == sponsorId) &&
            const DeepCollectionEquality()
                .equals(other._suggestedAmendments, _suggestedAmendments) &&
            const DeepCollectionEquality()
                .equals(other._amendments, _amendments) &&
            const DeepCollectionEquality().equals(other._votedFor, _votedFor) &&
            const DeepCollectionEquality()
                .equals(other._votedAgainst, _votedAgainst));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      sponsorId,
      const DeepCollectionEquality().hash(_suggestedAmendments),
      const DeepCollectionEquality().hash(_amendments),
      const DeepCollectionEquality().hash(_votedFor),
      const DeepCollectionEquality().hash(_votedAgainst));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillImplCopyWith<_$BillImpl> get copyWith =>
      __$$BillImplCopyWithImpl<_$BillImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillImplToJson(
      this,
    );
  }
}

abstract class _Bill implements Bill {
  const factory _Bill(
      {required final String id,
      required final String name,
      required final String description,
      required final String sponsorId,
      @StringListConverter() final List<String> suggestedAmendments,
      @StringListConverter() final List<String> amendments,
      @StringListConverter() final List<String> votedFor,
      @StringListConverter() final List<String> votedAgainst}) = _$BillImpl;

  factory _Bill.fromJson(Map<String, dynamic> json) = _$BillImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get sponsorId;
  @override
  @StringListConverter()
  List<String> get suggestedAmendments;
  @override
  @StringListConverter()
  List<String> get amendments;
  @override
  @StringListConverter()
  List<String> get votedFor;
  @override
  @StringListConverter()
  List<String> get votedAgainst;
  @override
  @JsonKey(ignore: true)
  _$$BillImplCopyWith<_$BillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
