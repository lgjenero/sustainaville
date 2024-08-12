// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameView _$GameViewFromJson(Map<String, dynamic> json) {
  return _GameView.fromJson(json);
}

/// @nodoc
mixin _$GameView {
  GameViewType get type => throw _privateConstructorUsedError;
  String? get typeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameViewCopyWith<GameView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameViewCopyWith<$Res> {
  factory $GameViewCopyWith(GameView value, $Res Function(GameView) then) =
      _$GameViewCopyWithImpl<$Res, GameView>;
  @useResult
  $Res call({GameViewType type, String? typeId});
}

/// @nodoc
class _$GameViewCopyWithImpl<$Res, $Val extends GameView>
    implements $GameViewCopyWith<$Res> {
  _$GameViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? typeId = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GameViewType,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameViewImplCopyWith<$Res>
    implements $GameViewCopyWith<$Res> {
  factory _$$GameViewImplCopyWith(
          _$GameViewImpl value, $Res Function(_$GameViewImpl) then) =
      __$$GameViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GameViewType type, String? typeId});
}

/// @nodoc
class __$$GameViewImplCopyWithImpl<$Res>
    extends _$GameViewCopyWithImpl<$Res, _$GameViewImpl>
    implements _$$GameViewImplCopyWith<$Res> {
  __$$GameViewImplCopyWithImpl(
      _$GameViewImpl _value, $Res Function(_$GameViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? typeId = freezed,
  }) {
    return _then(_$GameViewImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GameViewType,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameViewImpl implements _GameView {
  const _$GameViewImpl({required this.type, this.typeId});

  factory _$GameViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameViewImplFromJson(json);

  @override
  final GameViewType type;
  @override
  final String? typeId;

  @override
  String toString() {
    return 'GameView(type: $type, typeId: $typeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameViewImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.typeId, typeId) || other.typeId == typeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, typeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameViewImplCopyWith<_$GameViewImpl> get copyWith =>
      __$$GameViewImplCopyWithImpl<_$GameViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameViewImplToJson(
      this,
    );
  }
}

abstract class _GameView implements GameView {
  const factory _GameView(
      {required final GameViewType type,
      final String? typeId}) = _$GameViewImpl;

  factory _GameView.fromJson(Map<String, dynamic> json) =
      _$GameViewImpl.fromJson;

  @override
  GameViewType get type;
  @override
  String? get typeId;
  @override
  @JsonKey(ignore: true)
  _$$GameViewImplCopyWith<_$GameViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GameSatateData _$GameSatateDataFromJson(Map<String, dynamic> json) {
  return _GameSatateData.fromJson(json);
}

/// @nodoc
mixin _$GameSatateData {
  GameStatus get status => throw _privateConstructorUsedError;
  GameCreationPhase get creationPhase => throw _privateConstructorUsedError;
  GameView get view => throw _privateConstructorUsedError;
  List<Representative> get representatives =>
      throw _privateConstructorUsedError;
  List<Constituency> get constituencies => throw _privateConstructorUsedError;
  List<LobbyingGroup> get lobbyingGroups => throw _privateConstructorUsedError;
  List<Party> get parties => throw _privateConstructorUsedError;
  List<Bill> get bills => throw _privateConstructorUsedError;
  num get constituency => throw _privateConstructorUsedError;
  num get publicOpinion => throw _privateConstructorUsedError;
  num get funds => throw _privateConstructorUsedError;
  num get sustainabiliyScore => throw _privateConstructorUsedError;
  num get greenScore => throw _privateConstructorUsedError;
  List<String> get history => throw _privateConstructorUsedError;
  List<Campaign> get campaigns => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameSatateDataCopyWith<GameSatateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSatateDataCopyWith<$Res> {
  factory $GameSatateDataCopyWith(
          GameSatateData value, $Res Function(GameSatateData) then) =
      _$GameSatateDataCopyWithImpl<$Res, GameSatateData>;
  @useResult
  $Res call(
      {GameStatus status,
      GameCreationPhase creationPhase,
      GameView view,
      List<Representative> representatives,
      List<Constituency> constituencies,
      List<LobbyingGroup> lobbyingGroups,
      List<Party> parties,
      List<Bill> bills,
      num constituency,
      num publicOpinion,
      num funds,
      num sustainabiliyScore,
      num greenScore,
      List<String> history,
      List<Campaign> campaigns});

  $GameViewCopyWith<$Res> get view;
}

/// @nodoc
class _$GameSatateDataCopyWithImpl<$Res, $Val extends GameSatateData>
    implements $GameSatateDataCopyWith<$Res> {
  _$GameSatateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? creationPhase = null,
    Object? view = null,
    Object? representatives = null,
    Object? constituencies = null,
    Object? lobbyingGroups = null,
    Object? parties = null,
    Object? bills = null,
    Object? constituency = null,
    Object? publicOpinion = null,
    Object? funds = null,
    Object? sustainabiliyScore = null,
    Object? greenScore = null,
    Object? history = null,
    Object? campaigns = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      creationPhase: null == creationPhase
          ? _value.creationPhase
          : creationPhase // ignore: cast_nullable_to_non_nullable
              as GameCreationPhase,
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as GameView,
      representatives: null == representatives
          ? _value.representatives
          : representatives // ignore: cast_nullable_to_non_nullable
              as List<Representative>,
      constituencies: null == constituencies
          ? _value.constituencies
          : constituencies // ignore: cast_nullable_to_non_nullable
              as List<Constituency>,
      lobbyingGroups: null == lobbyingGroups
          ? _value.lobbyingGroups
          : lobbyingGroups // ignore: cast_nullable_to_non_nullable
              as List<LobbyingGroup>,
      parties: null == parties
          ? _value.parties
          : parties // ignore: cast_nullable_to_non_nullable
              as List<Party>,
      bills: null == bills
          ? _value.bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<Bill>,
      constituency: null == constituency
          ? _value.constituency
          : constituency // ignore: cast_nullable_to_non_nullable
              as num,
      publicOpinion: null == publicOpinion
          ? _value.publicOpinion
          : publicOpinion // ignore: cast_nullable_to_non_nullable
              as num,
      funds: null == funds
          ? _value.funds
          : funds // ignore: cast_nullable_to_non_nullable
              as num,
      sustainabiliyScore: null == sustainabiliyScore
          ? _value.sustainabiliyScore
          : sustainabiliyScore // ignore: cast_nullable_to_non_nullable
              as num,
      greenScore: null == greenScore
          ? _value.greenScore
          : greenScore // ignore: cast_nullable_to_non_nullable
              as num,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<String>,
      campaigns: null == campaigns
          ? _value.campaigns
          : campaigns // ignore: cast_nullable_to_non_nullable
              as List<Campaign>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameViewCopyWith<$Res> get view {
    return $GameViewCopyWith<$Res>(_value.view, (value) {
      return _then(_value.copyWith(view: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameSatateDataImplCopyWith<$Res>
    implements $GameSatateDataCopyWith<$Res> {
  factory _$$GameSatateDataImplCopyWith(_$GameSatateDataImpl value,
          $Res Function(_$GameSatateDataImpl) then) =
      __$$GameSatateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GameStatus status,
      GameCreationPhase creationPhase,
      GameView view,
      List<Representative> representatives,
      List<Constituency> constituencies,
      List<LobbyingGroup> lobbyingGroups,
      List<Party> parties,
      List<Bill> bills,
      num constituency,
      num publicOpinion,
      num funds,
      num sustainabiliyScore,
      num greenScore,
      List<String> history,
      List<Campaign> campaigns});

  @override
  $GameViewCopyWith<$Res> get view;
}

/// @nodoc
class __$$GameSatateDataImplCopyWithImpl<$Res>
    extends _$GameSatateDataCopyWithImpl<$Res, _$GameSatateDataImpl>
    implements _$$GameSatateDataImplCopyWith<$Res> {
  __$$GameSatateDataImplCopyWithImpl(
      _$GameSatateDataImpl _value, $Res Function(_$GameSatateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? creationPhase = null,
    Object? view = null,
    Object? representatives = null,
    Object? constituencies = null,
    Object? lobbyingGroups = null,
    Object? parties = null,
    Object? bills = null,
    Object? constituency = null,
    Object? publicOpinion = null,
    Object? funds = null,
    Object? sustainabiliyScore = null,
    Object? greenScore = null,
    Object? history = null,
    Object? campaigns = null,
  }) {
    return _then(_$GameSatateDataImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      creationPhase: null == creationPhase
          ? _value.creationPhase
          : creationPhase // ignore: cast_nullable_to_non_nullable
              as GameCreationPhase,
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as GameView,
      representatives: null == representatives
          ? _value._representatives
          : representatives // ignore: cast_nullable_to_non_nullable
              as List<Representative>,
      constituencies: null == constituencies
          ? _value._constituencies
          : constituencies // ignore: cast_nullable_to_non_nullable
              as List<Constituency>,
      lobbyingGroups: null == lobbyingGroups
          ? _value._lobbyingGroups
          : lobbyingGroups // ignore: cast_nullable_to_non_nullable
              as List<LobbyingGroup>,
      parties: null == parties
          ? _value._parties
          : parties // ignore: cast_nullable_to_non_nullable
              as List<Party>,
      bills: null == bills
          ? _value._bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<Bill>,
      constituency: null == constituency
          ? _value.constituency
          : constituency // ignore: cast_nullable_to_non_nullable
              as num,
      publicOpinion: null == publicOpinion
          ? _value.publicOpinion
          : publicOpinion // ignore: cast_nullable_to_non_nullable
              as num,
      funds: null == funds
          ? _value.funds
          : funds // ignore: cast_nullable_to_non_nullable
              as num,
      sustainabiliyScore: null == sustainabiliyScore
          ? _value.sustainabiliyScore
          : sustainabiliyScore // ignore: cast_nullable_to_non_nullable
              as num,
      greenScore: null == greenScore
          ? _value.greenScore
          : greenScore // ignore: cast_nullable_to_non_nullable
              as num,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<String>,
      campaigns: null == campaigns
          ? _value._campaigns
          : campaigns // ignore: cast_nullable_to_non_nullable
              as List<Campaign>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameSatateDataImpl implements _GameSatateData {
  const _$GameSatateDataImpl(
      {required this.status,
      required this.creationPhase,
      required this.view,
      required final List<Representative> representatives,
      required final List<Constituency> constituencies,
      required final List<LobbyingGroup> lobbyingGroups,
      required final List<Party> parties,
      required final List<Bill> bills,
      required this.constituency,
      required this.publicOpinion,
      required this.funds,
      required this.sustainabiliyScore,
      required this.greenScore,
      final List<String> history = const [],
      final List<Campaign> campaigns = const []})
      : _representatives = representatives,
        _constituencies = constituencies,
        _lobbyingGroups = lobbyingGroups,
        _parties = parties,
        _bills = bills,
        _history = history,
        _campaigns = campaigns;

  factory _$GameSatateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameSatateDataImplFromJson(json);

  @override
  final GameStatus status;
  @override
  final GameCreationPhase creationPhase;
  @override
  final GameView view;
  final List<Representative> _representatives;
  @override
  List<Representative> get representatives {
    if (_representatives is EqualUnmodifiableListView) return _representatives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_representatives);
  }

  final List<Constituency> _constituencies;
  @override
  List<Constituency> get constituencies {
    if (_constituencies is EqualUnmodifiableListView) return _constituencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_constituencies);
  }

  final List<LobbyingGroup> _lobbyingGroups;
  @override
  List<LobbyingGroup> get lobbyingGroups {
    if (_lobbyingGroups is EqualUnmodifiableListView) return _lobbyingGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lobbyingGroups);
  }

  final List<Party> _parties;
  @override
  List<Party> get parties {
    if (_parties is EqualUnmodifiableListView) return _parties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parties);
  }

  final List<Bill> _bills;
  @override
  List<Bill> get bills {
    if (_bills is EqualUnmodifiableListView) return _bills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bills);
  }

  @override
  final num constituency;
  @override
  final num publicOpinion;
  @override
  final num funds;
  @override
  final num sustainabiliyScore;
  @override
  final num greenScore;
  final List<String> _history;
  @override
  @JsonKey()
  List<String> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  final List<Campaign> _campaigns;
  @override
  @JsonKey()
  List<Campaign> get campaigns {
    if (_campaigns is EqualUnmodifiableListView) return _campaigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_campaigns);
  }

  @override
  String toString() {
    return 'GameSatateData(status: $status, creationPhase: $creationPhase, view: $view, representatives: $representatives, constituencies: $constituencies, lobbyingGroups: $lobbyingGroups, parties: $parties, bills: $bills, constituency: $constituency, publicOpinion: $publicOpinion, funds: $funds, sustainabiliyScore: $sustainabiliyScore, greenScore: $greenScore, history: $history, campaigns: $campaigns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSatateDataImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.creationPhase, creationPhase) ||
                other.creationPhase == creationPhase) &&
            (identical(other.view, view) || other.view == view) &&
            const DeepCollectionEquality()
                .equals(other._representatives, _representatives) &&
            const DeepCollectionEquality()
                .equals(other._constituencies, _constituencies) &&
            const DeepCollectionEquality()
                .equals(other._lobbyingGroups, _lobbyingGroups) &&
            const DeepCollectionEquality().equals(other._parties, _parties) &&
            const DeepCollectionEquality().equals(other._bills, _bills) &&
            (identical(other.constituency, constituency) ||
                other.constituency == constituency) &&
            (identical(other.publicOpinion, publicOpinion) ||
                other.publicOpinion == publicOpinion) &&
            (identical(other.funds, funds) || other.funds == funds) &&
            (identical(other.sustainabiliyScore, sustainabiliyScore) ||
                other.sustainabiliyScore == sustainabiliyScore) &&
            (identical(other.greenScore, greenScore) ||
                other.greenScore == greenScore) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            const DeepCollectionEquality()
                .equals(other._campaigns, _campaigns));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      creationPhase,
      view,
      const DeepCollectionEquality().hash(_representatives),
      const DeepCollectionEquality().hash(_constituencies),
      const DeepCollectionEquality().hash(_lobbyingGroups),
      const DeepCollectionEquality().hash(_parties),
      const DeepCollectionEquality().hash(_bills),
      constituency,
      publicOpinion,
      funds,
      sustainabiliyScore,
      greenScore,
      const DeepCollectionEquality().hash(_history),
      const DeepCollectionEquality().hash(_campaigns));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSatateDataImplCopyWith<_$GameSatateDataImpl> get copyWith =>
      __$$GameSatateDataImplCopyWithImpl<_$GameSatateDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameSatateDataImplToJson(
      this,
    );
  }
}

abstract class _GameSatateData implements GameSatateData {
  const factory _GameSatateData(
      {required final GameStatus status,
      required final GameCreationPhase creationPhase,
      required final GameView view,
      required final List<Representative> representatives,
      required final List<Constituency> constituencies,
      required final List<LobbyingGroup> lobbyingGroups,
      required final List<Party> parties,
      required final List<Bill> bills,
      required final num constituency,
      required final num publicOpinion,
      required final num funds,
      required final num sustainabiliyScore,
      required final num greenScore,
      final List<String> history,
      final List<Campaign> campaigns}) = _$GameSatateDataImpl;

  factory _GameSatateData.fromJson(Map<String, dynamic> json) =
      _$GameSatateDataImpl.fromJson;

  @override
  GameStatus get status;
  @override
  GameCreationPhase get creationPhase;
  @override
  GameView get view;
  @override
  List<Representative> get representatives;
  @override
  List<Constituency> get constituencies;
  @override
  List<LobbyingGroup> get lobbyingGroups;
  @override
  List<Party> get parties;
  @override
  List<Bill> get bills;
  @override
  num get constituency;
  @override
  num get publicOpinion;
  @override
  num get funds;
  @override
  num get sustainabiliyScore;
  @override
  num get greenScore;
  @override
  List<String> get history;
  @override
  List<Campaign> get campaigns;
  @override
  @JsonKey(ignore: true)
  _$$GameSatateDataImplCopyWith<_$GameSatateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
