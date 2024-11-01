// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_score_delete_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScoreDeleteParam _$ScoreDeleteParamFromJson(Map<String, dynamic> json) {
  return _ScoreDeleteParam.fromJson(json);
}

/// @nodoc
mixin _$ScoreDeleteParam {
  String get gymId => throw _privateConstructorUsedError;
  String get loginKey => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  int get reservationNum => throw _privateConstructorUsedError;
  int get rallyNum => throw _privateConstructorUsedError;
  int get setNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreDeleteParamCopyWith<ScoreDeleteParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreDeleteParamCopyWith<$Res> {
  factory $ScoreDeleteParamCopyWith(
          ScoreDeleteParam value, $Res Function(ScoreDeleteParam) then) =
      _$ScoreDeleteParamCopyWithImpl<$Res, ScoreDeleteParam>;
  @useResult
  $Res call(
      {String gymId,
      String loginKey,
      String macAddress,
      int reservationNum,
      int rallyNum,
      int setNum});
}

/// @nodoc
class _$ScoreDeleteParamCopyWithImpl<$Res, $Val extends ScoreDeleteParam>
    implements $ScoreDeleteParamCopyWith<$Res> {
  _$ScoreDeleteParamCopyWithImpl(this._value, this._then);

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
    Object? rallyNum = null,
    Object? setNum = null,
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
      rallyNum: null == rallyNum
          ? _value.rallyNum
          : rallyNum // ignore: cast_nullable_to_non_nullable
              as int,
      setNum: null == setNum
          ? _value.setNum
          : setNum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreDeleteParamImplCopyWith<$Res>
    implements $ScoreDeleteParamCopyWith<$Res> {
  factory _$$ScoreDeleteParamImplCopyWith(_$ScoreDeleteParamImpl value,
          $Res Function(_$ScoreDeleteParamImpl) then) =
      __$$ScoreDeleteParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymId,
      String loginKey,
      String macAddress,
      int reservationNum,
      int rallyNum,
      int setNum});
}

/// @nodoc
class __$$ScoreDeleteParamImplCopyWithImpl<$Res>
    extends _$ScoreDeleteParamCopyWithImpl<$Res, _$ScoreDeleteParamImpl>
    implements _$$ScoreDeleteParamImplCopyWith<$Res> {
  __$$ScoreDeleteParamImplCopyWithImpl(_$ScoreDeleteParamImpl _value,
      $Res Function(_$ScoreDeleteParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? loginKey = null,
    Object? macAddress = null,
    Object? reservationNum = null,
    Object? rallyNum = null,
    Object? setNum = null,
  }) {
    return _then(_$ScoreDeleteParamImpl(
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
      rallyNum: null == rallyNum
          ? _value.rallyNum
          : rallyNum // ignore: cast_nullable_to_non_nullable
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
class _$ScoreDeleteParamImpl implements _ScoreDeleteParam {
  const _$ScoreDeleteParamImpl(
      {required this.gymId,
      required this.loginKey,
      required this.macAddress,
      required this.reservationNum,
      required this.rallyNum,
      required this.setNum});

  factory _$ScoreDeleteParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreDeleteParamImplFromJson(json);

  @override
  final String gymId;
  @override
  final String loginKey;
  @override
  final String macAddress;
  @override
  final int reservationNum;
  @override
  final int rallyNum;
  @override
  final int setNum;

  @override
  String toString() {
    return 'ScoreDeleteParam(gymId: $gymId, loginKey: $loginKey, macAddress: $macAddress, reservationNum: $reservationNum, rallyNum: $rallyNum, setNum: $setNum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreDeleteParamImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.loginKey, loginKey) ||
                other.loginKey == loginKey) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.reservationNum, reservationNum) ||
                other.reservationNum == reservationNum) &&
            (identical(other.rallyNum, rallyNum) ||
                other.rallyNum == rallyNum) &&
            (identical(other.setNum, setNum) || other.setNum == setNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gymId, loginKey, macAddress,
      reservationNum, rallyNum, setNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreDeleteParamImplCopyWith<_$ScoreDeleteParamImpl> get copyWith =>
      __$$ScoreDeleteParamImplCopyWithImpl<_$ScoreDeleteParamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreDeleteParamImplToJson(
      this,
    );
  }
}

abstract class _ScoreDeleteParam implements ScoreDeleteParam {
  const factory _ScoreDeleteParam(
      {required final String gymId,
      required final String loginKey,
      required final String macAddress,
      required final int reservationNum,
      required final int rallyNum,
      required final int setNum}) = _$ScoreDeleteParamImpl;

  factory _ScoreDeleteParam.fromJson(Map<String, dynamic> json) =
      _$ScoreDeleteParamImpl.fromJson;

  @override
  String get gymId;
  @override
  String get loginKey;
  @override
  String get macAddress;
  @override
  int get reservationNum;
  @override
  int get rallyNum;
  @override
  int get setNum;
  @override
  @JsonKey(ignore: true)
  _$$ScoreDeleteParamImplCopyWith<_$ScoreDeleteParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
