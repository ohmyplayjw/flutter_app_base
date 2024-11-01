// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_shuttle_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShuttleCountParam _$ShuttleCountParamFromJson(Map<String, dynamic> json) {
  return _ShuttleCountRequest.fromJson(json);
}

/// @nodoc
mixin _$ShuttleCountParam {
  String get gymId => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  String get loginKey => throw _privateConstructorUsedError;
  String get courtId => throw _privateConstructorUsedError;
  int get reservationNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShuttleCountParamCopyWith<ShuttleCountParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShuttleCountParamCopyWith<$Res> {
  factory $ShuttleCountParamCopyWith(
          ShuttleCountParam value, $Res Function(ShuttleCountParam) then) =
      _$ShuttleCountParamCopyWithImpl<$Res, ShuttleCountParam>;
  @useResult
  $Res call(
      {String gymId,
      String macAddress,
      String loginKey,
      String courtId,
      int reservationNum});
}

/// @nodoc
class _$ShuttleCountParamCopyWithImpl<$Res, $Val extends ShuttleCountParam>
    implements $ShuttleCountParamCopyWith<$Res> {
  _$ShuttleCountParamCopyWithImpl(this._value, this._then);

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
    Object? courtId = null,
    Object? reservationNum = null,
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
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      reservationNum: null == reservationNum
          ? _value.reservationNum
          : reservationNum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShuttleCountRequestImplCopyWith<$Res>
    implements $ShuttleCountParamCopyWith<$Res> {
  factory _$$ShuttleCountRequestImplCopyWith(_$ShuttleCountRequestImpl value,
          $Res Function(_$ShuttleCountRequestImpl) then) =
      __$$ShuttleCountRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymId,
      String macAddress,
      String loginKey,
      String courtId,
      int reservationNum});
}

/// @nodoc
class __$$ShuttleCountRequestImplCopyWithImpl<$Res>
    extends _$ShuttleCountParamCopyWithImpl<$Res, _$ShuttleCountRequestImpl>
    implements _$$ShuttleCountRequestImplCopyWith<$Res> {
  __$$ShuttleCountRequestImplCopyWithImpl(_$ShuttleCountRequestImpl _value,
      $Res Function(_$ShuttleCountRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? macAddress = null,
    Object? loginKey = null,
    Object? courtId = null,
    Object? reservationNum = null,
  }) {
    return _then(_$ShuttleCountRequestImpl(
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
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      reservationNum: null == reservationNum
          ? _value.reservationNum
          : reservationNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShuttleCountRequestImpl implements _ShuttleCountRequest {
  const _$ShuttleCountRequestImpl(
      {required this.gymId,
      required this.macAddress,
      required this.loginKey,
      required this.courtId,
      required this.reservationNum});

  factory _$ShuttleCountRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShuttleCountRequestImplFromJson(json);

  @override
  final String gymId;
  @override
  final String macAddress;
  @override
  final String loginKey;
  @override
  final String courtId;
  @override
  final int reservationNum;

  @override
  String toString() {
    return 'ShuttleCountParam(gymId: $gymId, macAddress: $macAddress, loginKey: $loginKey, courtId: $courtId, reservationNum: $reservationNum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShuttleCountRequestImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.loginKey, loginKey) ||
                other.loginKey == loginKey) &&
            (identical(other.courtId, courtId) || other.courtId == courtId) &&
            (identical(other.reservationNum, reservationNum) ||
                other.reservationNum == reservationNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, gymId, macAddress, loginKey, courtId, reservationNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShuttleCountRequestImplCopyWith<_$ShuttleCountRequestImpl> get copyWith =>
      __$$ShuttleCountRequestImplCopyWithImpl<_$ShuttleCountRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShuttleCountRequestImplToJson(
      this,
    );
  }
}

abstract class _ShuttleCountRequest implements ShuttleCountParam {
  const factory _ShuttleCountRequest(
      {required final String gymId,
      required final String macAddress,
      required final String loginKey,
      required final String courtId,
      required final int reservationNum}) = _$ShuttleCountRequestImpl;

  factory _ShuttleCountRequest.fromJson(Map<String, dynamic> json) =
      _$ShuttleCountRequestImpl.fromJson;

  @override
  String get gymId;
  @override
  String get macAddress;
  @override
  String get loginKey;
  @override
  String get courtId;
  @override
  int get reservationNum;
  @override
  @JsonKey(ignore: true)
  _$$ShuttleCountRequestImplCopyWith<_$ShuttleCountRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
