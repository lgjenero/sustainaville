// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turn_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TurnRepresentativeResponse _$TurnRepresentativeResponseFromJson(
    Map<String, dynamic> json) {
  return _TurnRepresentativeResponse.fromJson(json);
}

/// @nodoc
mixin _$TurnRepresentativeResponse {
  String get representativeId => throw _privateConstructorUsedError;
  num? get support => throw _privateConstructorUsedError;
  String get response => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnRepresentativeResponseCopyWith<TurnRepresentativeResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnRepresentativeResponseCopyWith<$Res> {
  factory $TurnRepresentativeResponseCopyWith(TurnRepresentativeResponse value,
          $Res Function(TurnRepresentativeResponse) then) =
      _$TurnRepresentativeResponseCopyWithImpl<$Res,
          TurnRepresentativeResponse>;
  @useResult
  $Res call({String representativeId, num? support, String response});
}

/// @nodoc
class _$TurnRepresentativeResponseCopyWithImpl<$Res,
        $Val extends TurnRepresentativeResponse>
    implements $TurnRepresentativeResponseCopyWith<$Res> {
  _$TurnRepresentativeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? representativeId = null,
    Object? support = freezed,
    Object? response = null,
  }) {
    return _then(_value.copyWith(
      representativeId: null == representativeId
          ? _value.representativeId
          : representativeId // ignore: cast_nullable_to_non_nullable
              as String,
      support: freezed == support
          ? _value.support
          : support // ignore: cast_nullable_to_non_nullable
              as num?,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TurnRepresentativeResponseImplCopyWith<$Res>
    implements $TurnRepresentativeResponseCopyWith<$Res> {
  factory _$$TurnRepresentativeResponseImplCopyWith(
          _$TurnRepresentativeResponseImpl value,
          $Res Function(_$TurnRepresentativeResponseImpl) then) =
      __$$TurnRepresentativeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String representativeId, num? support, String response});
}

/// @nodoc
class __$$TurnRepresentativeResponseImplCopyWithImpl<$Res>
    extends _$TurnRepresentativeResponseCopyWithImpl<$Res,
        _$TurnRepresentativeResponseImpl>
    implements _$$TurnRepresentativeResponseImplCopyWith<$Res> {
  __$$TurnRepresentativeResponseImplCopyWithImpl(
      _$TurnRepresentativeResponseImpl _value,
      $Res Function(_$TurnRepresentativeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? representativeId = null,
    Object? support = freezed,
    Object? response = null,
  }) {
    return _then(_$TurnRepresentativeResponseImpl(
      representativeId: null == representativeId
          ? _value.representativeId
          : representativeId // ignore: cast_nullable_to_non_nullable
              as String,
      support: freezed == support
          ? _value.support
          : support // ignore: cast_nullable_to_non_nullable
              as num?,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnRepresentativeResponseImpl implements _TurnRepresentativeResponse {
  const _$TurnRepresentativeResponseImpl(
      {required this.representativeId, this.support, required this.response});

  factory _$TurnRepresentativeResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TurnRepresentativeResponseImplFromJson(json);

  @override
  final String representativeId;
  @override
  final num? support;
  @override
  final String response;

  @override
  String toString() {
    return 'TurnRepresentativeResponse(representativeId: $representativeId, support: $support, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnRepresentativeResponseImpl &&
            (identical(other.representativeId, representativeId) ||
                other.representativeId == representativeId) &&
            (identical(other.support, support) || other.support == support) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, representativeId, support, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnRepresentativeResponseImplCopyWith<_$TurnRepresentativeResponseImpl>
      get copyWith => __$$TurnRepresentativeResponseImplCopyWithImpl<
          _$TurnRepresentativeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnRepresentativeResponseImplToJson(
      this,
    );
  }
}

abstract class _TurnRepresentativeResponse
    implements TurnRepresentativeResponse {
  const factory _TurnRepresentativeResponse(
      {required final String representativeId,
      final num? support,
      required final String response}) = _$TurnRepresentativeResponseImpl;

  factory _TurnRepresentativeResponse.fromJson(Map<String, dynamic> json) =
      _$TurnRepresentativeResponseImpl.fromJson;

  @override
  String get representativeId;
  @override
  num? get support;
  @override
  String get response;
  @override
  @JsonKey(ignore: true)
  _$$TurnRepresentativeResponseImplCopyWith<_$TurnRepresentativeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TurnBillResponse _$TurnBillResponseFromJson(Map<String, dynamic> json) {
  return _TurnBillResponse.fromJson(json);
}

/// @nodoc
mixin _$TurnBillResponse {
  String get billId => throw _privateConstructorUsedError;
  num? get constituency => throw _privateConstructorUsedError;
  num? get publicOpinion => throw _privateConstructorUsedError;
  num? get sustainabiliyScore => throw _privateConstructorUsedError;
  num? get greenScore => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get votedFor => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get votedAgainst => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnBillResponseCopyWith<TurnBillResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnBillResponseCopyWith<$Res> {
  factory $TurnBillResponseCopyWith(
          TurnBillResponse value, $Res Function(TurnBillResponse) then) =
      _$TurnBillResponseCopyWithImpl<$Res, TurnBillResponse>;
  @useResult
  $Res call(
      {String billId,
      num? constituency,
      num? publicOpinion,
      num? sustainabiliyScore,
      num? greenScore,
      @StringListConverter() List<String> votedFor,
      @StringListConverter() List<String> votedAgainst});
}

/// @nodoc
class _$TurnBillResponseCopyWithImpl<$Res, $Val extends TurnBillResponse>
    implements $TurnBillResponseCopyWith<$Res> {
  _$TurnBillResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billId = null,
    Object? constituency = freezed,
    Object? publicOpinion = freezed,
    Object? sustainabiliyScore = freezed,
    Object? greenScore = freezed,
    Object? votedFor = null,
    Object? votedAgainst = null,
  }) {
    return _then(_value.copyWith(
      billId: null == billId
          ? _value.billId
          : billId // ignore: cast_nullable_to_non_nullable
              as String,
      constituency: freezed == constituency
          ? _value.constituency
          : constituency // ignore: cast_nullable_to_non_nullable
              as num?,
      publicOpinion: freezed == publicOpinion
          ? _value.publicOpinion
          : publicOpinion // ignore: cast_nullable_to_non_nullable
              as num?,
      sustainabiliyScore: freezed == sustainabiliyScore
          ? _value.sustainabiliyScore
          : sustainabiliyScore // ignore: cast_nullable_to_non_nullable
              as num?,
      greenScore: freezed == greenScore
          ? _value.greenScore
          : greenScore // ignore: cast_nullable_to_non_nullable
              as num?,
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
abstract class _$$TurnBillResponseImplCopyWith<$Res>
    implements $TurnBillResponseCopyWith<$Res> {
  factory _$$TurnBillResponseImplCopyWith(_$TurnBillResponseImpl value,
          $Res Function(_$TurnBillResponseImpl) then) =
      __$$TurnBillResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String billId,
      num? constituency,
      num? publicOpinion,
      num? sustainabiliyScore,
      num? greenScore,
      @StringListConverter() List<String> votedFor,
      @StringListConverter() List<String> votedAgainst});
}

/// @nodoc
class __$$TurnBillResponseImplCopyWithImpl<$Res>
    extends _$TurnBillResponseCopyWithImpl<$Res, _$TurnBillResponseImpl>
    implements _$$TurnBillResponseImplCopyWith<$Res> {
  __$$TurnBillResponseImplCopyWithImpl(_$TurnBillResponseImpl _value,
      $Res Function(_$TurnBillResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billId = null,
    Object? constituency = freezed,
    Object? publicOpinion = freezed,
    Object? sustainabiliyScore = freezed,
    Object? greenScore = freezed,
    Object? votedFor = null,
    Object? votedAgainst = null,
  }) {
    return _then(_$TurnBillResponseImpl(
      billId: null == billId
          ? _value.billId
          : billId // ignore: cast_nullable_to_non_nullable
              as String,
      constituency: freezed == constituency
          ? _value.constituency
          : constituency // ignore: cast_nullable_to_non_nullable
              as num?,
      publicOpinion: freezed == publicOpinion
          ? _value.publicOpinion
          : publicOpinion // ignore: cast_nullable_to_non_nullable
              as num?,
      sustainabiliyScore: freezed == sustainabiliyScore
          ? _value.sustainabiliyScore
          : sustainabiliyScore // ignore: cast_nullable_to_non_nullable
              as num?,
      greenScore: freezed == greenScore
          ? _value.greenScore
          : greenScore // ignore: cast_nullable_to_non_nullable
              as num?,
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
class _$TurnBillResponseImpl implements _TurnBillResponse {
  const _$TurnBillResponseImpl(
      {required this.billId,
      this.constituency,
      this.publicOpinion,
      this.sustainabiliyScore,
      this.greenScore,
      @StringListConverter() final List<String> votedFor = const [],
      @StringListConverter() final List<String> votedAgainst = const []})
      : _votedFor = votedFor,
        _votedAgainst = votedAgainst;

  factory _$TurnBillResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnBillResponseImplFromJson(json);

  @override
  final String billId;
  @override
  final num? constituency;
  @override
  final num? publicOpinion;
  @override
  final num? sustainabiliyScore;
  @override
  final num? greenScore;
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
    return 'TurnBillResponse(billId: $billId, constituency: $constituency, publicOpinion: $publicOpinion, sustainabiliyScore: $sustainabiliyScore, greenScore: $greenScore, votedFor: $votedFor, votedAgainst: $votedAgainst)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnBillResponseImpl &&
            (identical(other.billId, billId) || other.billId == billId) &&
            (identical(other.constituency, constituency) ||
                other.constituency == constituency) &&
            (identical(other.publicOpinion, publicOpinion) ||
                other.publicOpinion == publicOpinion) &&
            (identical(other.sustainabiliyScore, sustainabiliyScore) ||
                other.sustainabiliyScore == sustainabiliyScore) &&
            (identical(other.greenScore, greenScore) ||
                other.greenScore == greenScore) &&
            const DeepCollectionEquality().equals(other._votedFor, _votedFor) &&
            const DeepCollectionEquality()
                .equals(other._votedAgainst, _votedAgainst));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      billId,
      constituency,
      publicOpinion,
      sustainabiliyScore,
      greenScore,
      const DeepCollectionEquality().hash(_votedFor),
      const DeepCollectionEquality().hash(_votedAgainst));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnBillResponseImplCopyWith<_$TurnBillResponseImpl> get copyWith =>
      __$$TurnBillResponseImplCopyWithImpl<_$TurnBillResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnBillResponseImplToJson(
      this,
    );
  }
}

abstract class _TurnBillResponse implements TurnBillResponse {
  const factory _TurnBillResponse(
          {required final String billId,
          final num? constituency,
          final num? publicOpinion,
          final num? sustainabiliyScore,
          final num? greenScore,
          @StringListConverter() final List<String> votedFor,
          @StringListConverter() final List<String> votedAgainst}) =
      _$TurnBillResponseImpl;

  factory _TurnBillResponse.fromJson(Map<String, dynamic> json) =
      _$TurnBillResponseImpl.fromJson;

  @override
  String get billId;
  @override
  num? get constituency;
  @override
  num? get publicOpinion;
  @override
  num? get sustainabiliyScore;
  @override
  num? get greenScore;
  @override
  @StringListConverter()
  List<String> get votedFor;
  @override
  @StringListConverter()
  List<String> get votedAgainst;
  @override
  @JsonKey(ignore: true)
  _$$TurnBillResponseImplCopyWith<_$TurnBillResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TurnIncidentResponse _$TurnIncidentResponseFromJson(Map<String, dynamic> json) {
  return _TurnIncidentResponse.fromJson(json);
}

/// @nodoc
mixin _$TurnIncidentResponse {
  String get incidentId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  num? get constituency => throw _privateConstructorUsedError;
  num? get publicOpinion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnIncidentResponseCopyWith<TurnIncidentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnIncidentResponseCopyWith<$Res> {
  factory $TurnIncidentResponseCopyWith(TurnIncidentResponse value,
          $Res Function(TurnIncidentResponse) then) =
      _$TurnIncidentResponseCopyWithImpl<$Res, TurnIncidentResponse>;
  @useResult
  $Res call(
      {String incidentId,
      String description,
      num? constituency,
      num? publicOpinion});
}

/// @nodoc
class _$TurnIncidentResponseCopyWithImpl<$Res,
        $Val extends TurnIncidentResponse>
    implements $TurnIncidentResponseCopyWith<$Res> {
  _$TurnIncidentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incidentId = null,
    Object? description = null,
    Object? constituency = freezed,
    Object? publicOpinion = freezed,
  }) {
    return _then(_value.copyWith(
      incidentId: null == incidentId
          ? _value.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      constituency: freezed == constituency
          ? _value.constituency
          : constituency // ignore: cast_nullable_to_non_nullable
              as num?,
      publicOpinion: freezed == publicOpinion
          ? _value.publicOpinion
          : publicOpinion // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TurnIncidentResponseImplCopyWith<$Res>
    implements $TurnIncidentResponseCopyWith<$Res> {
  factory _$$TurnIncidentResponseImplCopyWith(_$TurnIncidentResponseImpl value,
          $Res Function(_$TurnIncidentResponseImpl) then) =
      __$$TurnIncidentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String incidentId,
      String description,
      num? constituency,
      num? publicOpinion});
}

/// @nodoc
class __$$TurnIncidentResponseImplCopyWithImpl<$Res>
    extends _$TurnIncidentResponseCopyWithImpl<$Res, _$TurnIncidentResponseImpl>
    implements _$$TurnIncidentResponseImplCopyWith<$Res> {
  __$$TurnIncidentResponseImplCopyWithImpl(_$TurnIncidentResponseImpl _value,
      $Res Function(_$TurnIncidentResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incidentId = null,
    Object? description = null,
    Object? constituency = freezed,
    Object? publicOpinion = freezed,
  }) {
    return _then(_$TurnIncidentResponseImpl(
      incidentId: null == incidentId
          ? _value.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      constituency: freezed == constituency
          ? _value.constituency
          : constituency // ignore: cast_nullable_to_non_nullable
              as num?,
      publicOpinion: freezed == publicOpinion
          ? _value.publicOpinion
          : publicOpinion // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnIncidentResponseImpl implements _TurnIncidentResponse {
  const _$TurnIncidentResponseImpl(
      {required this.incidentId,
      required this.description,
      this.constituency,
      this.publicOpinion});

  factory _$TurnIncidentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnIncidentResponseImplFromJson(json);

  @override
  final String incidentId;
  @override
  final String description;
  @override
  final num? constituency;
  @override
  final num? publicOpinion;

  @override
  String toString() {
    return 'TurnIncidentResponse(incidentId: $incidentId, description: $description, constituency: $constituency, publicOpinion: $publicOpinion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnIncidentResponseImpl &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.constituency, constituency) ||
                other.constituency == constituency) &&
            (identical(other.publicOpinion, publicOpinion) ||
                other.publicOpinion == publicOpinion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, incidentId, description, constituency, publicOpinion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnIncidentResponseImplCopyWith<_$TurnIncidentResponseImpl>
      get copyWith =>
          __$$TurnIncidentResponseImplCopyWithImpl<_$TurnIncidentResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnIncidentResponseImplToJson(
      this,
    );
  }
}

abstract class _TurnIncidentResponse implements TurnIncidentResponse {
  const factory _TurnIncidentResponse(
      {required final String incidentId,
      required final String description,
      final num? constituency,
      final num? publicOpinion}) = _$TurnIncidentResponseImpl;

  factory _TurnIncidentResponse.fromJson(Map<String, dynamic> json) =
      _$TurnIncidentResponseImpl.fromJson;

  @override
  String get incidentId;
  @override
  String get description;
  @override
  num? get constituency;
  @override
  num? get publicOpinion;
  @override
  @JsonKey(ignore: true)
  _$$TurnIncidentResponseImplCopyWith<_$TurnIncidentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TurnFundingResponse _$TurnFundingResponseFromJson(Map<String, dynamic> json) {
  return _TurnFundingResponse.fromJson(json);
}

/// @nodoc
mixin _$TurnFundingResponse {
  num? get amount => throw _privateConstructorUsedError;
  num? get constituency => throw _privateConstructorUsedError;
  num? get publicOpinion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnFundingResponseCopyWith<TurnFundingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnFundingResponseCopyWith<$Res> {
  factory $TurnFundingResponseCopyWith(
          TurnFundingResponse value, $Res Function(TurnFundingResponse) then) =
      _$TurnFundingResponseCopyWithImpl<$Res, TurnFundingResponse>;
  @useResult
  $Res call({num? amount, num? constituency, num? publicOpinion});
}

/// @nodoc
class _$TurnFundingResponseCopyWithImpl<$Res, $Val extends TurnFundingResponse>
    implements $TurnFundingResponseCopyWith<$Res> {
  _$TurnFundingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? constituency = freezed,
    Object? publicOpinion = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      constituency: freezed == constituency
          ? _value.constituency
          : constituency // ignore: cast_nullable_to_non_nullable
              as num?,
      publicOpinion: freezed == publicOpinion
          ? _value.publicOpinion
          : publicOpinion // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TurnFundingResponseImplCopyWith<$Res>
    implements $TurnFundingResponseCopyWith<$Res> {
  factory _$$TurnFundingResponseImplCopyWith(_$TurnFundingResponseImpl value,
          $Res Function(_$TurnFundingResponseImpl) then) =
      __$$TurnFundingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num? amount, num? constituency, num? publicOpinion});
}

/// @nodoc
class __$$TurnFundingResponseImplCopyWithImpl<$Res>
    extends _$TurnFundingResponseCopyWithImpl<$Res, _$TurnFundingResponseImpl>
    implements _$$TurnFundingResponseImplCopyWith<$Res> {
  __$$TurnFundingResponseImplCopyWithImpl(_$TurnFundingResponseImpl _value,
      $Res Function(_$TurnFundingResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? constituency = freezed,
    Object? publicOpinion = freezed,
  }) {
    return _then(_$TurnFundingResponseImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      constituency: freezed == constituency
          ? _value.constituency
          : constituency // ignore: cast_nullable_to_non_nullable
              as num?,
      publicOpinion: freezed == publicOpinion
          ? _value.publicOpinion
          : publicOpinion // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnFundingResponseImpl implements _TurnFundingResponse {
  const _$TurnFundingResponseImpl(
      {this.amount, this.constituency, this.publicOpinion});

  factory _$TurnFundingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnFundingResponseImplFromJson(json);

  @override
  final num? amount;
  @override
  final num? constituency;
  @override
  final num? publicOpinion;

  @override
  String toString() {
    return 'TurnFundingResponse(amount: $amount, constituency: $constituency, publicOpinion: $publicOpinion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnFundingResponseImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.constituency, constituency) ||
                other.constituency == constituency) &&
            (identical(other.publicOpinion, publicOpinion) ||
                other.publicOpinion == publicOpinion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, constituency, publicOpinion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnFundingResponseImplCopyWith<_$TurnFundingResponseImpl> get copyWith =>
      __$$TurnFundingResponseImplCopyWithImpl<_$TurnFundingResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnFundingResponseImplToJson(
      this,
    );
  }
}

abstract class _TurnFundingResponse implements TurnFundingResponse {
  const factory _TurnFundingResponse(
      {final num? amount,
      final num? constituency,
      final num? publicOpinion}) = _$TurnFundingResponseImpl;

  factory _TurnFundingResponse.fromJson(Map<String, dynamic> json) =
      _$TurnFundingResponseImpl.fromJson;

  @override
  num? get amount;
  @override
  num? get constituency;
  @override
  num? get publicOpinion;
  @override
  @JsonKey(ignore: true)
  _$$TurnFundingResponseImplCopyWith<_$TurnFundingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TurnCampaignResponse _$TurnCampaignResponseFromJson(Map<String, dynamic> json) {
  return _TurnCampaignResponse.fromJson(json);
}

/// @nodoc
mixin _$TurnCampaignResponse {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  num? get amount => throw _privateConstructorUsedError;
  num? get constituency => throw _privateConstructorUsedError;
  num? get publicOpinion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnCampaignResponseCopyWith<TurnCampaignResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnCampaignResponseCopyWith<$Res> {
  factory $TurnCampaignResponseCopyWith(TurnCampaignResponse value,
          $Res Function(TurnCampaignResponse) then) =
      _$TurnCampaignResponseCopyWithImpl<$Res, TurnCampaignResponse>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String result,
      num? amount,
      num? constituency,
      num? publicOpinion});
}

/// @nodoc
class _$TurnCampaignResponseCopyWithImpl<$Res,
        $Val extends TurnCampaignResponse>
    implements $TurnCampaignResponseCopyWith<$Res> {
  _$TurnCampaignResponseCopyWithImpl(this._value, this._then);

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
    Object? result = null,
    Object? amount = freezed,
    Object? constituency = freezed,
    Object? publicOpinion = freezed,
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
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      constituency: freezed == constituency
          ? _value.constituency
          : constituency // ignore: cast_nullable_to_non_nullable
              as num?,
      publicOpinion: freezed == publicOpinion
          ? _value.publicOpinion
          : publicOpinion // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TurnCampaignResponseImplCopyWith<$Res>
    implements $TurnCampaignResponseCopyWith<$Res> {
  factory _$$TurnCampaignResponseImplCopyWith(_$TurnCampaignResponseImpl value,
          $Res Function(_$TurnCampaignResponseImpl) then) =
      __$$TurnCampaignResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String result,
      num? amount,
      num? constituency,
      num? publicOpinion});
}

/// @nodoc
class __$$TurnCampaignResponseImplCopyWithImpl<$Res>
    extends _$TurnCampaignResponseCopyWithImpl<$Res, _$TurnCampaignResponseImpl>
    implements _$$TurnCampaignResponseImplCopyWith<$Res> {
  __$$TurnCampaignResponseImplCopyWithImpl(_$TurnCampaignResponseImpl _value,
      $Res Function(_$TurnCampaignResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? result = null,
    Object? amount = freezed,
    Object? constituency = freezed,
    Object? publicOpinion = freezed,
  }) {
    return _then(_$TurnCampaignResponseImpl(
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
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      constituency: freezed == constituency
          ? _value.constituency
          : constituency // ignore: cast_nullable_to_non_nullable
              as num?,
      publicOpinion: freezed == publicOpinion
          ? _value.publicOpinion
          : publicOpinion // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnCampaignResponseImpl implements _TurnCampaignResponse {
  const _$TurnCampaignResponseImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.result,
      this.amount,
      this.constituency,
      this.publicOpinion});

  factory _$TurnCampaignResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnCampaignResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String result;
  @override
  final num? amount;
  @override
  final num? constituency;
  @override
  final num? publicOpinion;

  @override
  String toString() {
    return 'TurnCampaignResponse(id: $id, name: $name, description: $description, result: $result, amount: $amount, constituency: $constituency, publicOpinion: $publicOpinion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnCampaignResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.constituency, constituency) ||
                other.constituency == constituency) &&
            (identical(other.publicOpinion, publicOpinion) ||
                other.publicOpinion == publicOpinion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, result,
      amount, constituency, publicOpinion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnCampaignResponseImplCopyWith<_$TurnCampaignResponseImpl>
      get copyWith =>
          __$$TurnCampaignResponseImplCopyWithImpl<_$TurnCampaignResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnCampaignResponseImplToJson(
      this,
    );
  }
}

abstract class _TurnCampaignResponse implements TurnCampaignResponse {
  const factory _TurnCampaignResponse(
      {required final String id,
      required final String name,
      required final String description,
      required final String result,
      final num? amount,
      final num? constituency,
      final num? publicOpinion}) = _$TurnCampaignResponseImpl;

  factory _TurnCampaignResponse.fromJson(Map<String, dynamic> json) =
      _$TurnCampaignResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get result;
  @override
  num? get amount;
  @override
  num? get constituency;
  @override
  num? get publicOpinion;
  @override
  @JsonKey(ignore: true)
  _$$TurnCampaignResponseImplCopyWith<_$TurnCampaignResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TurnFeedbackResponse _$TurnFeedbackResponseFromJson(Map<String, dynamic> json) {
  return _TurnFeedbackResponse.fromJson(json);
}

/// @nodoc
mixin _$TurnFeedbackResponse {
  String? get partyId => throw _privateConstructorUsedError;
  String? get lobbyingGroupId => throw _privateConstructorUsedError;
  String get response => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnFeedbackResponseCopyWith<TurnFeedbackResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnFeedbackResponseCopyWith<$Res> {
  factory $TurnFeedbackResponseCopyWith(TurnFeedbackResponse value,
          $Res Function(TurnFeedbackResponse) then) =
      _$TurnFeedbackResponseCopyWithImpl<$Res, TurnFeedbackResponse>;
  @useResult
  $Res call({String? partyId, String? lobbyingGroupId, String response});
}

/// @nodoc
class _$TurnFeedbackResponseCopyWithImpl<$Res,
        $Val extends TurnFeedbackResponse>
    implements $TurnFeedbackResponseCopyWith<$Res> {
  _$TurnFeedbackResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partyId = freezed,
    Object? lobbyingGroupId = freezed,
    Object? response = null,
  }) {
    return _then(_value.copyWith(
      partyId: freezed == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String?,
      lobbyingGroupId: freezed == lobbyingGroupId
          ? _value.lobbyingGroupId
          : lobbyingGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TurnFeedbackResponseImplCopyWith<$Res>
    implements $TurnFeedbackResponseCopyWith<$Res> {
  factory _$$TurnFeedbackResponseImplCopyWith(_$TurnFeedbackResponseImpl value,
          $Res Function(_$TurnFeedbackResponseImpl) then) =
      __$$TurnFeedbackResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? partyId, String? lobbyingGroupId, String response});
}

/// @nodoc
class __$$TurnFeedbackResponseImplCopyWithImpl<$Res>
    extends _$TurnFeedbackResponseCopyWithImpl<$Res, _$TurnFeedbackResponseImpl>
    implements _$$TurnFeedbackResponseImplCopyWith<$Res> {
  __$$TurnFeedbackResponseImplCopyWithImpl(_$TurnFeedbackResponseImpl _value,
      $Res Function(_$TurnFeedbackResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partyId = freezed,
    Object? lobbyingGroupId = freezed,
    Object? response = null,
  }) {
    return _then(_$TurnFeedbackResponseImpl(
      partyId: freezed == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String?,
      lobbyingGroupId: freezed == lobbyingGroupId
          ? _value.lobbyingGroupId
          : lobbyingGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnFeedbackResponseImpl implements _TurnFeedbackResponse {
  const _$TurnFeedbackResponseImpl(
      {this.partyId, this.lobbyingGroupId, required this.response});

  factory _$TurnFeedbackResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnFeedbackResponseImplFromJson(json);

  @override
  final String? partyId;
  @override
  final String? lobbyingGroupId;
  @override
  final String response;

  @override
  String toString() {
    return 'TurnFeedbackResponse(partyId: $partyId, lobbyingGroupId: $lobbyingGroupId, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnFeedbackResponseImpl &&
            (identical(other.partyId, partyId) || other.partyId == partyId) &&
            (identical(other.lobbyingGroupId, lobbyingGroupId) ||
                other.lobbyingGroupId == lobbyingGroupId) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, partyId, lobbyingGroupId, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnFeedbackResponseImplCopyWith<_$TurnFeedbackResponseImpl>
      get copyWith =>
          __$$TurnFeedbackResponseImplCopyWithImpl<_$TurnFeedbackResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnFeedbackResponseImplToJson(
      this,
    );
  }
}

abstract class _TurnFeedbackResponse implements TurnFeedbackResponse {
  const factory _TurnFeedbackResponse(
      {final String? partyId,
      final String? lobbyingGroupId,
      required final String response}) = _$TurnFeedbackResponseImpl;

  factory _TurnFeedbackResponse.fromJson(Map<String, dynamic> json) =
      _$TurnFeedbackResponseImpl.fromJson;

  @override
  String? get partyId;
  @override
  String? get lobbyingGroupId;
  @override
  String get response;
  @override
  @JsonKey(ignore: true)
  _$$TurnFeedbackResponseImplCopyWith<_$TurnFeedbackResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TurnBillAmendmentResponse _$TurnBillAmendmentResponseFromJson(
    Map<String, dynamic> json) {
  return _TurnBillAmendmentResponse.fromJson(json);
}

/// @nodoc
mixin _$TurnBillAmendmentResponse {
  String? get billId => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get amendments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnBillAmendmentResponseCopyWith<TurnBillAmendmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnBillAmendmentResponseCopyWith<$Res> {
  factory $TurnBillAmendmentResponseCopyWith(TurnBillAmendmentResponse value,
          $Res Function(TurnBillAmendmentResponse) then) =
      _$TurnBillAmendmentResponseCopyWithImpl<$Res, TurnBillAmendmentResponse>;
  @useResult
  $Res call({String? billId, @StringListConverter() List<String> amendments});
}

/// @nodoc
class _$TurnBillAmendmentResponseCopyWithImpl<$Res,
        $Val extends TurnBillAmendmentResponse>
    implements $TurnBillAmendmentResponseCopyWith<$Res> {
  _$TurnBillAmendmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billId = freezed,
    Object? amendments = null,
  }) {
    return _then(_value.copyWith(
      billId: freezed == billId
          ? _value.billId
          : billId // ignore: cast_nullable_to_non_nullable
              as String?,
      amendments: null == amendments
          ? _value.amendments
          : amendments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TurnBillAmendmentResponseImplCopyWith<$Res>
    implements $TurnBillAmendmentResponseCopyWith<$Res> {
  factory _$$TurnBillAmendmentResponseImplCopyWith(
          _$TurnBillAmendmentResponseImpl value,
          $Res Function(_$TurnBillAmendmentResponseImpl) then) =
      __$$TurnBillAmendmentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? billId, @StringListConverter() List<String> amendments});
}

/// @nodoc
class __$$TurnBillAmendmentResponseImplCopyWithImpl<$Res>
    extends _$TurnBillAmendmentResponseCopyWithImpl<$Res,
        _$TurnBillAmendmentResponseImpl>
    implements _$$TurnBillAmendmentResponseImplCopyWith<$Res> {
  __$$TurnBillAmendmentResponseImplCopyWithImpl(
      _$TurnBillAmendmentResponseImpl _value,
      $Res Function(_$TurnBillAmendmentResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billId = freezed,
    Object? amendments = null,
  }) {
    return _then(_$TurnBillAmendmentResponseImpl(
      billId: freezed == billId
          ? _value.billId
          : billId // ignore: cast_nullable_to_non_nullable
              as String?,
      amendments: null == amendments
          ? _value._amendments
          : amendments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnBillAmendmentResponseImpl implements _TurnBillAmendmentResponse {
  const _$TurnBillAmendmentResponseImpl(
      {this.billId,
      @StringListConverter() final List<String> amendments = const []})
      : _amendments = amendments;

  factory _$TurnBillAmendmentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnBillAmendmentResponseImplFromJson(json);

  @override
  final String? billId;
  final List<String> _amendments;
  @override
  @JsonKey()
  @StringListConverter()
  List<String> get amendments {
    if (_amendments is EqualUnmodifiableListView) return _amendments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amendments);
  }

  @override
  String toString() {
    return 'TurnBillAmendmentResponse(billId: $billId, amendments: $amendments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnBillAmendmentResponseImpl &&
            (identical(other.billId, billId) || other.billId == billId) &&
            const DeepCollectionEquality()
                .equals(other._amendments, _amendments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, billId, const DeepCollectionEquality().hash(_amendments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnBillAmendmentResponseImplCopyWith<_$TurnBillAmendmentResponseImpl>
      get copyWith => __$$TurnBillAmendmentResponseImplCopyWithImpl<
          _$TurnBillAmendmentResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnBillAmendmentResponseImplToJson(
      this,
    );
  }
}

abstract class _TurnBillAmendmentResponse implements TurnBillAmendmentResponse {
  const factory _TurnBillAmendmentResponse(
          {final String? billId,
          @StringListConverter() final List<String> amendments}) =
      _$TurnBillAmendmentResponseImpl;

  factory _TurnBillAmendmentResponse.fromJson(Map<String, dynamic> json) =
      _$TurnBillAmendmentResponseImpl.fromJson;

  @override
  String? get billId;
  @override
  @StringListConverter()
  List<String> get amendments;
  @override
  @JsonKey(ignore: true)
  _$$TurnBillAmendmentResponseImplCopyWith<_$TurnBillAmendmentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TurnResponse _$TurnResponseFromJson(Map<String, dynamic> json) {
  return _TurnResponse.fromJson(json);
}

/// @nodoc
mixin _$TurnResponse {
  List<TurnRepresentativeResponse> get representatives =>
      throw _privateConstructorUsedError;
  TurnBillResponse? get bill => throw _privateConstructorUsedError;
  TurnFundingResponse? get funding => throw _privateConstructorUsedError;
  TurnCampaignResponse? get campaign => throw _privateConstructorUsedError;
  TurnFeedbackResponse? get feedback => throw _privateConstructorUsedError;
  TurnIncidentResponse? get incident => throw _privateConstructorUsedError;
  List<TurnBillAmendmentResponse> get billAmendments =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnResponseCopyWith<TurnResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnResponseCopyWith<$Res> {
  factory $TurnResponseCopyWith(
          TurnResponse value, $Res Function(TurnResponse) then) =
      _$TurnResponseCopyWithImpl<$Res, TurnResponse>;
  @useResult
  $Res call(
      {List<TurnRepresentativeResponse> representatives,
      TurnBillResponse? bill,
      TurnFundingResponse? funding,
      TurnCampaignResponse? campaign,
      TurnFeedbackResponse? feedback,
      TurnIncidentResponse? incident,
      List<TurnBillAmendmentResponse> billAmendments});

  $TurnBillResponseCopyWith<$Res>? get bill;
  $TurnFundingResponseCopyWith<$Res>? get funding;
  $TurnCampaignResponseCopyWith<$Res>? get campaign;
  $TurnFeedbackResponseCopyWith<$Res>? get feedback;
  $TurnIncidentResponseCopyWith<$Res>? get incident;
}

/// @nodoc
class _$TurnResponseCopyWithImpl<$Res, $Val extends TurnResponse>
    implements $TurnResponseCopyWith<$Res> {
  _$TurnResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? representatives = null,
    Object? bill = freezed,
    Object? funding = freezed,
    Object? campaign = freezed,
    Object? feedback = freezed,
    Object? incident = freezed,
    Object? billAmendments = null,
  }) {
    return _then(_value.copyWith(
      representatives: null == representatives
          ? _value.representatives
          : representatives // ignore: cast_nullable_to_non_nullable
              as List<TurnRepresentativeResponse>,
      bill: freezed == bill
          ? _value.bill
          : bill // ignore: cast_nullable_to_non_nullable
              as TurnBillResponse?,
      funding: freezed == funding
          ? _value.funding
          : funding // ignore: cast_nullable_to_non_nullable
              as TurnFundingResponse?,
      campaign: freezed == campaign
          ? _value.campaign
          : campaign // ignore: cast_nullable_to_non_nullable
              as TurnCampaignResponse?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as TurnFeedbackResponse?,
      incident: freezed == incident
          ? _value.incident
          : incident // ignore: cast_nullable_to_non_nullable
              as TurnIncidentResponse?,
      billAmendments: null == billAmendments
          ? _value.billAmendments
          : billAmendments // ignore: cast_nullable_to_non_nullable
              as List<TurnBillAmendmentResponse>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TurnBillResponseCopyWith<$Res>? get bill {
    if (_value.bill == null) {
      return null;
    }

    return $TurnBillResponseCopyWith<$Res>(_value.bill!, (value) {
      return _then(_value.copyWith(bill: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TurnFundingResponseCopyWith<$Res>? get funding {
    if (_value.funding == null) {
      return null;
    }

    return $TurnFundingResponseCopyWith<$Res>(_value.funding!, (value) {
      return _then(_value.copyWith(funding: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TurnCampaignResponseCopyWith<$Res>? get campaign {
    if (_value.campaign == null) {
      return null;
    }

    return $TurnCampaignResponseCopyWith<$Res>(_value.campaign!, (value) {
      return _then(_value.copyWith(campaign: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TurnFeedbackResponseCopyWith<$Res>? get feedback {
    if (_value.feedback == null) {
      return null;
    }

    return $TurnFeedbackResponseCopyWith<$Res>(_value.feedback!, (value) {
      return _then(_value.copyWith(feedback: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TurnIncidentResponseCopyWith<$Res>? get incident {
    if (_value.incident == null) {
      return null;
    }

    return $TurnIncidentResponseCopyWith<$Res>(_value.incident!, (value) {
      return _then(_value.copyWith(incident: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TurnResponseImplCopyWith<$Res>
    implements $TurnResponseCopyWith<$Res> {
  factory _$$TurnResponseImplCopyWith(
          _$TurnResponseImpl value, $Res Function(_$TurnResponseImpl) then) =
      __$$TurnResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TurnRepresentativeResponse> representatives,
      TurnBillResponse? bill,
      TurnFundingResponse? funding,
      TurnCampaignResponse? campaign,
      TurnFeedbackResponse? feedback,
      TurnIncidentResponse? incident,
      List<TurnBillAmendmentResponse> billAmendments});

  @override
  $TurnBillResponseCopyWith<$Res>? get bill;
  @override
  $TurnFundingResponseCopyWith<$Res>? get funding;
  @override
  $TurnCampaignResponseCopyWith<$Res>? get campaign;
  @override
  $TurnFeedbackResponseCopyWith<$Res>? get feedback;
  @override
  $TurnIncidentResponseCopyWith<$Res>? get incident;
}

/// @nodoc
class __$$TurnResponseImplCopyWithImpl<$Res>
    extends _$TurnResponseCopyWithImpl<$Res, _$TurnResponseImpl>
    implements _$$TurnResponseImplCopyWith<$Res> {
  __$$TurnResponseImplCopyWithImpl(
      _$TurnResponseImpl _value, $Res Function(_$TurnResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? representatives = null,
    Object? bill = freezed,
    Object? funding = freezed,
    Object? campaign = freezed,
    Object? feedback = freezed,
    Object? incident = freezed,
    Object? billAmendments = null,
  }) {
    return _then(_$TurnResponseImpl(
      representatives: null == representatives
          ? _value._representatives
          : representatives // ignore: cast_nullable_to_non_nullable
              as List<TurnRepresentativeResponse>,
      bill: freezed == bill
          ? _value.bill
          : bill // ignore: cast_nullable_to_non_nullable
              as TurnBillResponse?,
      funding: freezed == funding
          ? _value.funding
          : funding // ignore: cast_nullable_to_non_nullable
              as TurnFundingResponse?,
      campaign: freezed == campaign
          ? _value.campaign
          : campaign // ignore: cast_nullable_to_non_nullable
              as TurnCampaignResponse?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as TurnFeedbackResponse?,
      incident: freezed == incident
          ? _value.incident
          : incident // ignore: cast_nullable_to_non_nullable
              as TurnIncidentResponse?,
      billAmendments: null == billAmendments
          ? _value._billAmendments
          : billAmendments // ignore: cast_nullable_to_non_nullable
              as List<TurnBillAmendmentResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnResponseImpl implements _TurnResponse {
  const _$TurnResponseImpl(
      {final List<TurnRepresentativeResponse> representatives = const [],
      this.bill,
      this.funding,
      this.campaign,
      this.feedback,
      this.incident,
      final List<TurnBillAmendmentResponse> billAmendments = const []})
      : _representatives = representatives,
        _billAmendments = billAmendments;

  factory _$TurnResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnResponseImplFromJson(json);

  final List<TurnRepresentativeResponse> _representatives;
  @override
  @JsonKey()
  List<TurnRepresentativeResponse> get representatives {
    if (_representatives is EqualUnmodifiableListView) return _representatives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_representatives);
  }

  @override
  final TurnBillResponse? bill;
  @override
  final TurnFundingResponse? funding;
  @override
  final TurnCampaignResponse? campaign;
  @override
  final TurnFeedbackResponse? feedback;
  @override
  final TurnIncidentResponse? incident;
  final List<TurnBillAmendmentResponse> _billAmendments;
  @override
  @JsonKey()
  List<TurnBillAmendmentResponse> get billAmendments {
    if (_billAmendments is EqualUnmodifiableListView) return _billAmendments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billAmendments);
  }

  @override
  String toString() {
    return 'TurnResponse(representatives: $representatives, bill: $bill, funding: $funding, campaign: $campaign, feedback: $feedback, incident: $incident, billAmendments: $billAmendments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._representatives, _representatives) &&
            (identical(other.bill, bill) || other.bill == bill) &&
            (identical(other.funding, funding) || other.funding == funding) &&
            (identical(other.campaign, campaign) ||
                other.campaign == campaign) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.incident, incident) ||
                other.incident == incident) &&
            const DeepCollectionEquality()
                .equals(other._billAmendments, _billAmendments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_representatives),
      bill,
      funding,
      campaign,
      feedback,
      incident,
      const DeepCollectionEquality().hash(_billAmendments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnResponseImplCopyWith<_$TurnResponseImpl> get copyWith =>
      __$$TurnResponseImplCopyWithImpl<_$TurnResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnResponseImplToJson(
      this,
    );
  }
}

abstract class _TurnResponse implements TurnResponse {
  const factory _TurnResponse(
          {final List<TurnRepresentativeResponse> representatives,
          final TurnBillResponse? bill,
          final TurnFundingResponse? funding,
          final TurnCampaignResponse? campaign,
          final TurnFeedbackResponse? feedback,
          final TurnIncidentResponse? incident,
          final List<TurnBillAmendmentResponse> billAmendments}) =
      _$TurnResponseImpl;

  factory _TurnResponse.fromJson(Map<String, dynamic> json) =
      _$TurnResponseImpl.fromJson;

  @override
  List<TurnRepresentativeResponse> get representatives;
  @override
  TurnBillResponse? get bill;
  @override
  TurnFundingResponse? get funding;
  @override
  TurnCampaignResponse? get campaign;
  @override
  TurnFeedbackResponse? get feedback;
  @override
  TurnIncidentResponse? get incident;
  @override
  List<TurnBillAmendmentResponse> get billAmendments;
  @override
  @JsonKey(ignore: true)
  _$$TurnResponseImplCopyWith<_$TurnResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
