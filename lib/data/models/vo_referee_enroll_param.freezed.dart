// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_referee_enroll_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefereeEnrollParam _$RefereeEnrollParamFromJson(Map<String, dynamic> json) {
  return _RefereeEnrollParam.fromJson(json);
}

/// @nodoc
mixin _$RefereeEnrollParam {
  String get gymId => throw _privateConstructorUsedError;
  String get loginKey => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  int get reservationNum => throw _privateConstructorUsedError;
  int get refereeId => throw _privateConstructorUsedError; // 기본값 설정
  int? get refereeSupportId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefereeEnrollParamCopyWith<RefereeEnrollParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefereeEnrollParamCopyWith<$Res> {
  factory $RefereeEnrollParamCopyWith(
          RefereeEnrollParam value, $Res Function(RefereeEnrollParam) then) =
      _$RefereeEnrollParamCopyWithImpl<$Res, RefereeEnrollParam>;
  @useResult
  $Res call(
      {String gymId,
      String loginKey,
      String macAddress,
      int reservationNum,
      int refereeId,
      int? refereeSupportId});
}

/// @nodoc
class _$RefereeEnrollParamCopyWithImpl<$Res, $Val extends RefereeEnrollParam>
    implements $RefereeEnrollParamCopyWith<$Res> {
  _$RefereeEnrollParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? loginKey = null,
    Object? macAddress = null,
    Object? reservationNum = null,
    Object? refereeId = null,
    Object? refereeSupportId = freezed,
  }) {
    return _then(_value.copyWith(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      loginKey: null == loginKey
          ? _value.loginKey
          : loginKey // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      reservationNum: null == reservationNum
          ? _value.reservationNum
          : reservationNum // ignore: cast_nullable_to_non_nullable
              as int,
      refereeId: null == refereeId
          ? _value.refereeId
          : refereeId // ignore: cast_nullable_to_non_nullable
              as int,
      refereeSupportId: freezed == refereeSupportId
          ? _value.refereeSupportId
          : refereeSupportId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefereeEnrollParamImplCopyWith<$Res>
    implements $RefereeEnrollParamCopyWith<$Res> {
  factory _$$RefereeEnrollParamImplCopyWith(_$RefereeEnrollParamImpl value,
          $Res Function(_$RefereeEnrollParamImpl) then) =
      __$$RefereeEnrollParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymId,
      String loginKey,
      String macAddress,
      int reservationNum,
      int refereeId,
      int? refereeSupportId});
}

/// @nodoc
class __$$RefereeEnrollParamImplCopyWithImpl<$Res>
    extends _$RefereeEnrollParamCopyWithImpl<$Res, _$RefereeEnrollParamImpl>
    implements _$$RefereeEnrollParamImplCopyWith<$Res> {
  __$$RefereeEnrollParamImplCopyWithImpl(_$RefereeEnrollParamImpl _value,
      $Res Function(_$RefereeEnrollParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? loginKey = null,
    Object? macAddress = null,
    Object? reservationNum = null,
    Object? refereeId = null,
    Object? refereeSupportId = freezed,
  }) {
    return _then(_$RefereeEnrollParamImpl(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      loginKey: null == loginKey
          ? _value.loginKey
          : loginKey // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      reservationNum: null == reservationNum
          ? _value.reservationNum
          : reservationNum // ignore: cast_nullable_to_non_nullable
              as int,
      refereeId: null == refereeId
          ? _value.refereeId
          : refereeId // ignore: cast_nullable_to_non_nullable
              as int,
      refereeSupportId: freezed == refereeSupportId
          ? _value.refereeSupportId
          : refereeSupportId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefereeEnrollParamImpl implements _RefereeEnrollParam {
  _$RefereeEnrollParamImpl(
      {required this.gymId,
      required this.loginKey,
      required this.macAddress,
      required this.reservationNum,
      required this.refereeId,
      this.refereeSupportId});

  factory _$RefereeEnrollParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefereeEnrollParamImplFromJson(json);

  @override
  final String gymId;
  @override
  final String loginKey;
  @override
  final String macAddress;
  @override
  final int reservationNum;
  @override
  final int refereeId;
// 기본값 설정
  @override
  final int? refereeSupportId;

  @override
  String toString() {
    return 'RefereeEnrollParam(gymId: $gymId, loginKey: $loginKey, macAddress: $macAddress, reservationNum: $reservationNum, refereeId: $refereeId, refereeSupportId: $refereeSupportId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefereeEnrollParamImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.loginKey, loginKey) ||
                other.loginKey == loginKey) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.reservationNum, reservationNum) ||
                other.reservationNum == reservationNum) &&
            (identical(other.refereeId, refereeId) ||
                other.refereeId == refereeId) &&
            (identical(other.refereeSupportId, refereeSupportId) ||
                other.refereeSupportId == refereeSupportId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gymId, loginKey, macAddress,
      reservationNum, refereeId, refereeSupportId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefereeEnrollParamImplCopyWith<_$RefereeEnrollParamImpl> get copyWith =>
      __$$RefereeEnrollParamImplCopyWithImpl<_$RefereeEnrollParamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefereeEnrollParamImplToJson(
      this,
    );
  }
}

abstract class _RefereeEnrollParam implements RefereeEnrollParam {
  factory _RefereeEnrollParam(
      {required final String gymId,
      required final String loginKey,
      required final String macAddress,
      required final int reservationNum,
      required final int refereeId,
      final int? refereeSupportId}) = _$RefereeEnrollParamImpl;

  factory _RefereeEnrollParam.fromJson(Map<String, dynamic> json) =
      _$RefereeEnrollParamImpl.fromJson;

  @override
  String get gymId;
  @override
  String get loginKey;
  @override
  String get macAddress;
  @override
  int get reservationNum;
  @override
  int get refereeId;
  @override // 기본값 설정
  int? get refereeSupportId;
  @override
  @JsonKey(ignore: true)
  _$$RefereeEnrollParamImplCopyWith<_$RefereeEnrollParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
