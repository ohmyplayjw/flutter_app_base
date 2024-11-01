// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_score_list_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScoreListParam _$ScoreListParamFromJson(Map<String, dynamic> json) {
  return _ScoreListParam.fromJson(json);
}

/// @nodoc
mixin _$ScoreListParam {
  String get gymId => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  String get loginKey => throw _privateConstructorUsedError;
  int get reservationNum => throw _privateConstructorUsedError;
  int get setNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreListParamCopyWith<ScoreListParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreListParamCopyWith<$Res> {
  factory $ScoreListParamCopyWith(
          ScoreListParam value, $Res Function(ScoreListParam) then) =
      _$ScoreListParamCopyWithImpl<$Res, ScoreListParam>;
  @useResult
  $Res call(
      {String gymId,
      String macAddress,
      String loginKey,
      int reservationNum,
      int setNum});
}

/// @nodoc
class _$ScoreListParamCopyWithImpl<$Res, $Val extends ScoreListParam>
    implements $ScoreListParamCopyWith<$Res> {
  _$ScoreListParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? macAddress = null,
    Object? loginKey = null,
    Object? reservationNum = null,
    Object? setNum = null,
  }) {
    return _then(_value.copyWith(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      loginKey: null == loginKey
          ? _value.loginKey
          : loginKey // ignore: cast_nullable_to_non_nullable
              as String,
      reservationNum: null == reservationNum
          ? _value.reservationNum
          : reservationNum // ignore: cast_nullable_to_non_nullable
              as int,
      setNum: null == setNum
          ? _value.setNum
          : setNum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreListParamImplCopyWith<$Res>
    implements $ScoreListParamCopyWith<$Res> {
  factory _$$ScoreListParamImplCopyWith(_$ScoreListParamImpl value,
          $Res Function(_$ScoreListParamImpl) then) =
      __$$ScoreListParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymId,
      String macAddress,
      String loginKey,
      int reservationNum,
      int setNum});
}

/// @nodoc
class __$$ScoreListParamImplCopyWithImpl<$Res>
    extends _$ScoreListParamCopyWithImpl<$Res, _$ScoreListParamImpl>
    implements _$$ScoreListParamImplCopyWith<$Res> {
  __$$ScoreListParamImplCopyWithImpl(
      _$ScoreListParamImpl _value, $Res Function(_$ScoreListParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? macAddress = null,
    Object? loginKey = null,
    Object? reservationNum = null,
    Object? setNum = null,
  }) {
    return _then(_$ScoreListParamImpl(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      loginKey: null == loginKey
          ? _value.loginKey
          : loginKey // ignore: cast_nullable_to_non_nullable
              as String,
      reservationNum: null == reservationNum
          ? _value.reservationNum
          : reservationNum // ignore: cast_nullable_to_non_nullable
              as int,
      setNum: null == setNum
          ? _value.setNum
          : setNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreListParamImpl implements _ScoreListParam {
  const _$ScoreListParamImpl(
      {required this.gymId,
      required this.macAddress,
      required this.loginKey,
      required this.reservationNum,
      required this.setNum});

  factory _$ScoreListParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreListParamImplFromJson(json);

  @override
  final String gymId;
  @override
  final String macAddress;
  @override
  final String loginKey;
  @override
  final int reservationNum;
  @override
  final int setNum;

  @override
  String toString() {
    return 'ScoreListParam(gymId: $gymId, macAddress: $macAddress, loginKey: $loginKey, reservationNum: $reservationNum, setNum: $setNum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreListParamImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.loginKey, loginKey) ||
                other.loginKey == loginKey) &&
            (identical(other.reservationNum, reservationNum) ||
                other.reservationNum == reservationNum) &&
            (identical(other.setNum, setNum) || other.setNum == setNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, gymId, macAddress, loginKey, reservationNum, setNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreListParamImplCopyWith<_$ScoreListParamImpl> get copyWith =>
      __$$ScoreListParamImplCopyWithImpl<_$ScoreListParamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreListParamImplToJson(
      this,
    );
  }
}

abstract class _ScoreListParam implements ScoreListParam {
  const factory _ScoreListParam(
      {required final String gymId,
      required final String macAddress,
      required final String loginKey,
      required final int reservationNum,
      required final int setNum}) = _$ScoreListParamImpl;

  factory _ScoreListParam.fromJson(Map<String, dynamic> json) =
      _$ScoreListParamImpl.fromJson;

  @override
  String get gymId;
  @override
  String get macAddress;
  @override
  String get loginKey;
  @override
  int get reservationNum;
  @override
  int get setNum;
  @override
  @JsonKey(ignore: true)
  _$$ScoreListParamImplCopyWith<_$ScoreListParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
