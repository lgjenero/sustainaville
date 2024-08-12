// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turn_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TurnChatRequest _$TurnChatRequestFromJson(Map<String, dynamic> json) {
  return _TurnChatRequest.fromJson(json);
}

/// @nodoc
mixin _$TurnChatRequest {
  String get representativeId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnChatRequestCopyWith<TurnChatRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnChatRequestCopyWith<$Res> {
  factory $TurnChatRequestCopyWith(
          TurnChatRequest value, $Res Function(TurnChatRequest) then) =
      _$TurnChatRequestCopyWithImpl<$Res, TurnChatRequest>;
  @useResult
  $Res call({String representativeId, String message});
}

/// @nodoc
class _$TurnChatRequestCopyWithImpl<$Res, $Val extends TurnChatRequest>
    implements $TurnChatRequestCopyWith<$Res> {
  _$TurnChatRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? representativeId = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      representativeId: null == representativeId
          ? _value.representativeId
          : representativeId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TurnChatRequestImplCopyWith<$Res>
    implements $TurnChatRequestCopyWith<$Res> {
  factory _$$TurnChatRequestImplCopyWith(_$TurnChatRequestImpl value,
          $Res Function(_$TurnChatRequestImpl) then) =
      __$$TurnChatRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String representativeId, String message});
}

/// @nodoc
class __$$TurnChatRequestImplCopyWithImpl<$Res>
    extends _$TurnChatRequestCopyWithImpl<$Res, _$TurnChatRequestImpl>
    implements _$$TurnChatRequestImplCopyWith<$Res> {
  __$$TurnChatRequestImplCopyWithImpl(
      _$TurnChatRequestImpl _value, $Res Function(_$TurnChatRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? representativeId = null,
    Object? message = null,
  }) {
    return _then(_$TurnChatRequestImpl(
      representativeId: null == representativeId
          ? _value.representativeId
          : representativeId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnChatRequestImpl implements _TurnChatRequest {
  const _$TurnChatRequestImpl(
      {required this.representativeId, required this.message});

  factory _$TurnChatRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnChatRequestImplFromJson(json);

  @override
  final String representativeId;
  @override
  final String message;

  @override
  String toString() {
    return 'TurnChatRequest(representativeId: $representativeId, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnChatRequestImpl &&
            (identical(other.representativeId, representativeId) ||
                other.representativeId == representativeId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, representativeId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnChatRequestImplCopyWith<_$TurnChatRequestImpl> get copyWith =>
      __$$TurnChatRequestImplCopyWithImpl<_$TurnChatRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnChatRequestImplToJson(
      this,
    );
  }
}

abstract class _TurnChatRequest implements TurnChatRequest {
  const factory _TurnChatRequest(
      {required final String representativeId,
      required final String message}) = _$TurnChatRequestImpl;

  factory _TurnChatRequest.fromJson(Map<String, dynamic> json) =
      _$TurnChatRequestImpl.fromJson;

  @override
  String get representativeId;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$TurnChatRequestImplCopyWith<_$TurnChatRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TurnIncidentRequest _$TurnIncidentRequestFromJson(Map<String, dynamic> json) {
  return _TurnIncidentRequest.fromJson(json);
}

/// @nodoc
mixin _$TurnIncidentRequest {
  String get representativeId => throw _privateConstructorUsedError;
  IncidentType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnIncidentRequestCopyWith<TurnIncidentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnIncidentRequestCopyWith<$Res> {
  factory $TurnIncidentRequestCopyWith(
          TurnIncidentRequest value, $Res Function(TurnIncidentRequest) then) =
      _$TurnIncidentRequestCopyWithImpl<$Res, TurnIncidentRequest>;
  @useResult
  $Res call({String representativeId, IncidentType type});
}

/// @nodoc
class _$TurnIncidentRequestCopyWithImpl<$Res, $Val extends TurnIncidentRequest>
    implements $TurnIncidentRequestCopyWith<$Res> {
  _$TurnIncidentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? representativeId = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      representativeId: null == representativeId
          ? _value.representativeId
          : representativeId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IncidentType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TurnIncidentRequestImplCopyWith<$Res>
    implements $TurnIncidentRequestCopyWith<$Res> {
  factory _$$TurnIncidentRequestImplCopyWith(_$TurnIncidentRequestImpl value,
          $Res Function(_$TurnIncidentRequestImpl) then) =
      __$$TurnIncidentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String representativeId, IncidentType type});
}

/// @nodoc
class __$$TurnIncidentRequestImplCopyWithImpl<$Res>
    extends _$TurnIncidentRequestCopyWithImpl<$Res, _$TurnIncidentRequestImpl>
    implements _$$TurnIncidentRequestImplCopyWith<$Res> {
  __$$TurnIncidentRequestImplCopyWithImpl(_$TurnIncidentRequestImpl _value,
      $Res Function(_$TurnIncidentRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? representativeId = null,
    Object? type = null,
  }) {
    return _then(_$TurnIncidentRequestImpl(
      representativeId: null == representativeId
          ? _value.representativeId
          : representativeId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IncidentType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnIncidentRequestImpl implements _TurnIncidentRequest {
  const _$TurnIncidentRequestImpl(
      {required this.representativeId, required this.type});

  factory _$TurnIncidentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnIncidentRequestImplFromJson(json);

  @override
  final String representativeId;
  @override
  final IncidentType type;

  @override
  String toString() {
    return 'TurnIncidentRequest(representativeId: $representativeId, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnIncidentRequestImpl &&
            (identical(other.representativeId, representativeId) ||
                other.representativeId == representativeId) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, representativeId, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnIncidentRequestImplCopyWith<_$TurnIncidentRequestImpl> get copyWith =>
      __$$TurnIncidentRequestImplCopyWithImpl<_$TurnIncidentRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnIncidentRequestImplToJson(
      this,
    );
  }
}

abstract class _TurnIncidentRequest implements TurnIncidentRequest {
  const factory _TurnIncidentRequest(
      {required final String representativeId,
      required final IncidentType type}) = _$TurnIncidentRequestImpl;

  factory _TurnIncidentRequest.fromJson(Map<String, dynamic> json) =
      _$TurnIncidentRequestImpl.fromJson;

  @override
  String get representativeId;
  @override
  IncidentType get type;
  @override
  @JsonKey(ignore: true)
  _$$TurnIncidentRequestImplCopyWith<_$TurnIncidentRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TurnRequest _$TurnRequestFromJson(Map<String, dynamic> json) {
  return _TurnRequest.fromJson(json);
}

/// @nodoc
mixin _$TurnRequest {
  TurnChatRequest? get turnChatRequest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnRequestCopyWith<TurnRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnRequestCopyWith<$Res> {
  factory $TurnRequestCopyWith(
          TurnRequest value, $Res Function(TurnRequest) then) =
      _$TurnRequestCopyWithImpl<$Res, TurnRequest>;
  @useResult
  $Res call({TurnChatRequest? turnChatRequest});

  $TurnChatRequestCopyWith<$Res>? get turnChatRequest;
}

/// @nodoc
class _$TurnRequestCopyWithImpl<$Res, $Val extends TurnRequest>
    implements $TurnRequestCopyWith<$Res> {
  _$TurnRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? turnChatRequest = freezed,
  }) {
    return _then(_value.copyWith(
      turnChatRequest: freezed == turnChatRequest
          ? _value.turnChatRequest
          : turnChatRequest // ignore: cast_nullable_to_non_nullable
              as TurnChatRequest?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TurnChatRequestCopyWith<$Res>? get turnChatRequest {
    if (_value.turnChatRequest == null) {
      return null;
    }

    return $TurnChatRequestCopyWith<$Res>(_value.turnChatRequest!, (value) {
      return _then(_value.copyWith(turnChatRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TurnRequestImplCopyWith<$Res>
    implements $TurnRequestCopyWith<$Res> {
  factory _$$TurnRequestImplCopyWith(
          _$TurnRequestImpl value, $Res Function(_$TurnRequestImpl) then) =
      __$$TurnRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TurnChatRequest? turnChatRequest});

  @override
  $TurnChatRequestCopyWith<$Res>? get turnChatRequest;
}

/// @nodoc
class __$$TurnRequestImplCopyWithImpl<$Res>
    extends _$TurnRequestCopyWithImpl<$Res, _$TurnRequestImpl>
    implements _$$TurnRequestImplCopyWith<$Res> {
  __$$TurnRequestImplCopyWithImpl(
      _$TurnRequestImpl _value, $Res Function(_$TurnRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? turnChatRequest = freezed,
  }) {
    return _then(_$TurnRequestImpl(
      turnChatRequest: freezed == turnChatRequest
          ? _value.turnChatRequest
          : turnChatRequest // ignore: cast_nullable_to_non_nullable
              as TurnChatRequest?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnRequestImpl implements _TurnRequest {
  const _$TurnRequestImpl({this.turnChatRequest});

  factory _$TurnRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnRequestImplFromJson(json);

  @override
  final TurnChatRequest? turnChatRequest;

  @override
  String toString() {
    return 'TurnRequest(turnChatRequest: $turnChatRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnRequestImpl &&
            (identical(other.turnChatRequest, turnChatRequest) ||
                other.turnChatRequest == turnChatRequest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, turnChatRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnRequestImplCopyWith<_$TurnRequestImpl> get copyWith =>
      __$$TurnRequestImplCopyWithImpl<_$TurnRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnRequestImplToJson(
      this,
    );
  }
}

abstract class _TurnRequest implements TurnRequest {
  const factory _TurnRequest({final TurnChatRequest? turnChatRequest}) =
      _$TurnRequestImpl;

  factory _TurnRequest.fromJson(Map<String, dynamic> json) =
      _$TurnRequestImpl.fromJson;

  @override
  TurnChatRequest? get turnChatRequest;
  @override
  @JsonKey(ignore: true)
  _$$TurnRequestImplCopyWith<_$TurnRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
