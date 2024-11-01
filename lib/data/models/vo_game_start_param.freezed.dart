// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_game_start_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameStartParam _$GameStartParamFromJson(Map<String, dynamic> json) {
  return _GameStartParam.fromJson(json);
}

/// @nodoc
mixin _$GameStartParam {
  String get gymId => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  String get loginKey => throw _privateConstructorUsedError;
  int get reservationNum => throw _privateConstructorUsedError;
  String get courtId => throw _privateConstructorUsedError;
  int get startUse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStartParamCopyWith<GameStartParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStartParamCopyWith<$Res> {
  factory $GameStartParamCopyWith(
          GameStartParam value, $Res Function(GameStartParam) then) =
      _$GameStartParamCopyWithImpl<$Res, GameStartParam>;
  @useResult
  $Res call(
      {String gymId,
      String macAddress,
      String loginKey,
      int reservationNum,
      String courtId,
      int startUse});
}

/// @nodoc
class _$GameStartParamCopyWithImpl<$Res, $Val extends GameStartParam>
    implements $GameStartParamCopyWith<$Res> {
  _$GameStartParamCopyWithImpl(this._value, this._then);

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
    Object? courtId = null,
    Object? startUse = null,
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
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      startUse: null == startUse
          ? _value.startUse
          : startUse // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStartParamImplCopyWith<$Res>
    implements $GameStartParamCopyWith<$Res> {
  factory _$$GameStartParamImplCopyWith(_$GameStartParamImpl value,
          $Res Function(_$GameStartParamImpl) then) =
      __$$GameStartParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymId,
      String macAddress,
      String loginKey,
      int reservationNum,
      String courtId,
      int startUse});
}

/// @nodoc
class __$$GameStartParamImplCopyWithImpl<$Res>
    extends _$GameStartParamCopyWithImpl<$Res, _$GameStartParamImpl>
    implements _$$GameStartParamImplCopyWith<$Res> {
  __$$GameStartParamImplCopyWithImpl(
      _$GameStartParamImpl _value, $Res Function(_$GameStartParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? macAddress = null,
    Object? loginKey = null,
    Object? reservationNum = null,
    Object? courtId = null,
    Object? startUse = null,
  }) {
    return _then(_$GameStartParamImpl(
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
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      startUse: null == startUse
          ? _value.startUse
          : startUse // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStartParamImpl implements _GameStartParam {
  const _$GameStartParamImpl(
      {required this.gymId,
      required this.macAddress,
      required this.loginKey,
      required this.reservationNum,
      required this.courtId,
      required this.startUse});

  factory _$GameStartParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStartParamImplFromJson(json);

  @override
  final String gymId;
  @override
  final String macAddress;
  @override
  final String loginKey;
  @override
  final int reservationNum;
  @override
  final String courtId;
  @override
  final int startUse;

  @override
  String toString() {
    return 'GameStartParam(gymId: $gymId, macAddress: $macAddress, loginKey: $loginKey, reservationNum: $reservationNum, courtId: $courtId, startUse: $startUse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStartParamImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.loginKey, loginKey) ||
                other.loginKey == loginKey) &&
            (identical(other.reservationNum, reservationNum) ||
                other.reservationNum == reservationNum) &&
            (identical(other.courtId, courtId) || other.courtId == courtId) &&
            (identical(other.startUse, startUse) ||
                other.startUse == startUse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gymId, macAddress, loginKey,
      reservationNum, courtId, startUse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStartParamImplCopyWith<_$GameStartParamImpl> get copyWith =>
      __$$GameStartParamImplCopyWithImpl<_$GameStartParamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStartParamImplToJson(
      this,
    );
  }
}

abstract class _GameStartParam implements GameStartParam {
  const factory _GameStartParam(
      {required final String gymId,
      required final String macAddress,
      required final String loginKey,
      required final int reservationNum,
      required final String courtId,
      required final int startUse}) = _$GameStartParamImpl;

  factory _GameStartParam.fromJson(Map<String, dynamic> json) =
      _$GameStartParamImpl.fromJson;

  @override
  String get gymId;
  @override
  String get macAddress;
  @override
  String get loginKey;
  @override
  int get reservationNum;
  @override
  String get courtId;
  @override
  int get startUse;
  @override
  @JsonKey(ignore: true)
  _$$GameStartParamImplCopyWith<_$GameStartParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
