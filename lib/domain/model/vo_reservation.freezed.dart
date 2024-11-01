// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return _Reservation.fromJson(json);
}

/// @nodoc
mixin _$Reservation {
  int get reservationNum => throw _privateConstructorUsedError;
  String get courtId => throw _privateConstructorUsedError;
  int get standBy => throw _privateConstructorUsedError;
  String get gameName => throw _privateConstructorUsedError;
  String get gameType => throw _privateConstructorUsedError;
  int get reservationTime => throw _privateConstructorUsedError;
  int get startUse => throw _privateConstructorUsedError;
  String? get externalTeamKey => throw _privateConstructorUsedError;
  String? get externalKey => throw _privateConstructorUsedError;
  String? get externalTnmtId => throw _privateConstructorUsedError;
  List<Player>? get btopiaUserCourtReservationList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationCopyWith<Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCopyWith<$Res> {
  factory $ReservationCopyWith(
          Reservation value, $Res Function(Reservation) then) =
      _$ReservationCopyWithImpl<$Res, Reservation>;
  @useResult
  $Res call(
      {int reservationNum,
      String courtId,
      int standBy,
      String gameName,
      String gameType,
      int reservationTime,
      int startUse,
      String? externalTeamKey,
      String? externalKey,
      String? externalTnmtId,
      List<Player>? btopiaUserCourtReservationList});
}

/// @nodoc
class _$ReservationCopyWithImpl<$Res, $Val extends Reservation>
    implements $ReservationCopyWith<$Res> {
  _$ReservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationNum = null,
    Object? courtId = null,
    Object? standBy = null,
    Object? gameName = null,
    Object? gameType = null,
    Object? reservationTime = null,
    Object? startUse = null,
    Object? externalTeamKey = freezed,
    Object? externalKey = freezed,
    Object? externalTnmtId = freezed,
    Object? btopiaUserCourtReservationList = freezed,
  }) {
    return _then(_value.copyWith(
      reservationNum: null == reservationNum
          ? _value.reservationNum
          : reservationNum // ignore: cast_nullable_to_non_nullable
              as int,
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      standBy: null == standBy
          ? _value.standBy
          : standBy // ignore: cast_nullable_to_non_nullable
              as int,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      reservationTime: null == reservationTime
          ? _value.reservationTime
          : reservationTime // ignore: cast_nullable_to_non_nullable
              as int,
      startUse: null == startUse
          ? _value.startUse
          : startUse // ignore: cast_nullable_to_non_nullable
              as int,
      externalTeamKey: freezed == externalTeamKey
          ? _value.externalTeamKey
          : externalTeamKey // ignore: cast_nullable_to_non_nullable
              as String?,
      externalKey: freezed == externalKey
          ? _value.externalKey
          : externalKey // ignore: cast_nullable_to_non_nullable
              as String?,
      externalTnmtId: freezed == externalTnmtId
          ? _value.externalTnmtId
          : externalTnmtId // ignore: cast_nullable_to_non_nullable
              as String?,
      btopiaUserCourtReservationList: freezed == btopiaUserCourtReservationList
          ? _value.btopiaUserCourtReservationList
          : btopiaUserCourtReservationList // ignore: cast_nullable_to_non_nullable
              as List<Player>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationImplCopyWith<$Res>
    implements $ReservationCopyWith<$Res> {
  factory _$$ReservationImplCopyWith(
          _$ReservationImpl value, $Res Function(_$ReservationImpl) then) =
      __$$ReservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int reservationNum,
      String courtId,
      int standBy,
      String gameName,
      String gameType,
      int reservationTime,
      int startUse,
      String? externalTeamKey,
      String? externalKey,
      String? externalTnmtId,
      List<Player>? btopiaUserCourtReservationList});
}

/// @nodoc
class __$$ReservationImplCopyWithImpl<$Res>
    extends _$ReservationCopyWithImpl<$Res, _$ReservationImpl>
    implements _$$ReservationImplCopyWith<$Res> {
  __$$ReservationImplCopyWithImpl(
      _$ReservationImpl _value, $Res Function(_$ReservationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationNum = null,
    Object? courtId = null,
    Object? standBy = null,
    Object? gameName = null,
    Object? gameType = null,
    Object? reservationTime = null,
    Object? startUse = null,
    Object? externalTeamKey = freezed,
    Object? externalKey = freezed,
    Object? externalTnmtId = freezed,
    Object? btopiaUserCourtReservationList = freezed,
  }) {
    return _then(_$ReservationImpl(
      reservationNum: null == reservationNum
          ? _value.reservationNum
          : reservationNum // ignore: cast_nullable_to_non_nullable
              as int,
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      standBy: null == standBy
          ? _value.standBy
          : standBy // ignore: cast_nullable_to_non_nullable
              as int,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      reservationTime: null == reservationTime
          ? _value.reservationTime
          : reservationTime // ignore: cast_nullable_to_non_nullable
              as int,
      startUse: null == startUse
          ? _value.startUse
          : startUse // ignore: cast_nullable_to_non_nullable
              as int,
      externalTeamKey: freezed == externalTeamKey
          ? _value.externalTeamKey
          : externalTeamKey // ignore: cast_nullable_to_non_nullable
              as String?,
      externalKey: freezed == externalKey
          ? _value.externalKey
          : externalKey // ignore: cast_nullable_to_non_nullable
              as String?,
      externalTnmtId: freezed == externalTnmtId
          ? _value.externalTnmtId
          : externalTnmtId // ignore: cast_nullable_to_non_nullable
              as String?,
      btopiaUserCourtReservationList: freezed == btopiaUserCourtReservationList
          ? _value._btopiaUserCourtReservationList
          : btopiaUserCourtReservationList // ignore: cast_nullable_to_non_nullable
              as List<Player>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationImpl implements _Reservation {
  const _$ReservationImpl(
      {required this.reservationNum,
      required this.courtId,
      required this.standBy,
      required this.gameName,
      required this.gameType,
      required this.reservationTime,
      required this.startUse,
      this.externalTeamKey,
      this.externalKey,
      this.externalTnmtId,
      required final List<Player>? btopiaUserCourtReservationList})
      : _btopiaUserCourtReservationList = btopiaUserCourtReservationList;

  factory _$ReservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationImplFromJson(json);

  @override
  final int reservationNum;
  @override
  final String courtId;
  @override
  final int standBy;
  @override
  final String gameName;
  @override
  final String gameType;
  @override
  final int reservationTime;
  @override
  final int startUse;
  @override
  final String? externalTeamKey;
  @override
  final String? externalKey;
  @override
  final String? externalTnmtId;
  final List<Player>? _btopiaUserCourtReservationList;
  @override
  List<Player>? get btopiaUserCourtReservationList {
    final value = _btopiaUserCourtReservationList;
    if (value == null) return null;
    if (_btopiaUserCourtReservationList is EqualUnmodifiableListView)
      return _btopiaUserCourtReservationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Reservation(reservationNum: $reservationNum, courtId: $courtId, standBy: $standBy, gameName: $gameName, gameType: $gameType, reservationTime: $reservationTime, startUse: $startUse, externalTeamKey: $externalTeamKey, externalKey: $externalKey, externalTnmtId: $externalTnmtId, btopiaUserCourtReservationList: $btopiaUserCourtReservationList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationImpl &&
            (identical(other.reservationNum, reservationNum) ||
                other.reservationNum == reservationNum) &&
            (identical(other.courtId, courtId) || other.courtId == courtId) &&
            (identical(other.standBy, standBy) || other.standBy == standBy) &&
            (identical(other.gameName, gameName) ||
                other.gameName == gameName) &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            (identical(other.reservationTime, reservationTime) ||
                other.reservationTime == reservationTime) &&
            (identical(other.startUse, startUse) ||
                other.startUse == startUse) &&
            (identical(other.externalTeamKey, externalTeamKey) ||
                other.externalTeamKey == externalTeamKey) &&
            (identical(other.externalKey, externalKey) ||
                other.externalKey == externalKey) &&
            (identical(other.externalTnmtId, externalTnmtId) ||
                other.externalTnmtId == externalTnmtId) &&
            const DeepCollectionEquality().equals(
                other._btopiaUserCourtReservationList,
                _btopiaUserCourtReservationList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reservationNum,
      courtId,
      standBy,
      gameName,
      gameType,
      reservationTime,
      startUse,
      externalTeamKey,
      externalKey,
      externalTnmtId,
      const DeepCollectionEquality().hash(_btopiaUserCourtReservationList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationImplCopyWith<_$ReservationImpl> get copyWith =>
      __$$ReservationImplCopyWithImpl<_$ReservationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationImplToJson(
      this,
    );
  }
}

abstract class _Reservation implements Reservation {
  const factory _Reservation(
          {required final int reservationNum,
          required final String courtId,
          required final int standBy,
          required final String gameName,
          required final String gameType,
          required final int reservationTime,
          required final int startUse,
          final String? externalTeamKey,
          final String? externalKey,
          final String? externalTnmtId,
          required final List<Player>? btopiaUserCourtReservationList}) =
      _$ReservationImpl;

  factory _Reservation.fromJson(Map<String, dynamic> json) =
      _$ReservationImpl.fromJson;

  @override
  int get reservationNum;
  @override
  String get courtId;
  @override
  int get standBy;
  @override
  String get gameName;
  @override
  String get gameType;
  @override
  int get reservationTime;
  @override
  int get startUse;
  @override
  String? get externalTeamKey;
  @override
  String? get externalKey;
  @override
  String? get externalTnmtId;
  @override
  List<Player>? get btopiaUserCourtReservationList;
  @override
  @JsonKey(ignore: true)
  _$$ReservationImplCopyWith<_$ReservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
