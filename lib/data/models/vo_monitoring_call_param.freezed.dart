// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_monitoring_call_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MonitoringCallParam _$MonitoringCallParamFromJson(Map<String, dynamic> json) {
  return _MonitoringCallParam.fromJson(json);
}

/// @nodoc
mixin _$MonitoringCallParam {
  String get gymId => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  String get loginKey => throw _privateConstructorUsedError;
  String get courtId => throw _privateConstructorUsedError;
  int get reservationNum => throw _privateConstructorUsedError;
  int get managerType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonitoringCallParamCopyWith<MonitoringCallParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoringCallParamCopyWith<$Res> {
  factory $MonitoringCallParamCopyWith(
          MonitoringCallParam value, $Res Function(MonitoringCallParam) then) =
      _$MonitoringCallParamCopyWithImpl<$Res, MonitoringCallParam>;
  @useResult
  $Res call(
      {String gymId,
      String macAddress,
      String loginKey,
      String courtId,
      int reservationNum,
      int managerType});
}

/// @nodoc
class _$MonitoringCallParamCopyWithImpl<$Res, $Val extends MonitoringCallParam>
    implements $MonitoringCallParamCopyWith<$Res> {
  _$MonitoringCallParamCopyWithImpl(this._value, this._then);

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
    Object? managerType = null,
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
      managerType: null == managerType
          ? _value.managerType
          : managerType // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonitoringCallParamImplCopyWith<$Res>
    implements $MonitoringCallParamCopyWith<$Res> {
  factory _$$MonitoringCallParamImplCopyWith(_$MonitoringCallParamImpl value,
          $Res Function(_$MonitoringCallParamImpl) then) =
      __$$MonitoringCallParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymId,
      String macAddress,
      String loginKey,
      String courtId,
      int reservationNum,
      int managerType});
}

/// @nodoc
class __$$MonitoringCallParamImplCopyWithImpl<$Res>
    extends _$MonitoringCallParamCopyWithImpl<$Res, _$MonitoringCallParamImpl>
    implements _$$MonitoringCallParamImplCopyWith<$Res> {
  __$$MonitoringCallParamImplCopyWithImpl(_$MonitoringCallParamImpl _value,
      $Res Function(_$MonitoringCallParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? macAddress = null,
    Object? loginKey = null,
    Object? courtId = null,
    Object? reservationNum = null,
    Object? managerType = null,
  }) {
    return _then(_$MonitoringCallParamImpl(
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
      managerType: null == managerType
          ? _value.managerType
          : managerType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonitoringCallParamImpl implements _MonitoringCallParam {
  const _$MonitoringCallParamImpl(
      {required this.gymId,
      required this.macAddress,
      required this.loginKey,
      required this.courtId,
      required this.reservationNum,
      required this.managerType});

  factory _$MonitoringCallParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonitoringCallParamImplFromJson(json);

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
  final int managerType;

  @override
  String toString() {
    return 'MonitoringCallParam(gymId: $gymId, macAddress: $macAddress, loginKey: $loginKey, courtId: $courtId, reservationNum: $reservationNum, managerType: $managerType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitoringCallParamImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.loginKey, loginKey) ||
                other.loginKey == loginKey) &&
            (identical(other.courtId, courtId) || other.courtId == courtId) &&
            (identical(other.reservationNum, reservationNum) ||
                other.reservationNum == reservationNum) &&
            (identical(other.managerType, managerType) ||
                other.managerType == managerType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gymId, macAddress, loginKey,
      courtId, reservationNum, managerType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitoringCallParamImplCopyWith<_$MonitoringCallParamImpl> get copyWith =>
      __$$MonitoringCallParamImplCopyWithImpl<_$MonitoringCallParamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonitoringCallParamImplToJson(
      this,
    );
  }
}

abstract class _MonitoringCallParam implements MonitoringCallParam {
  const factory _MonitoringCallParam(
      {required final String gymId,
      required final String macAddress,
      required final String loginKey,
      required final String courtId,
      required final int reservationNum,
      required final int managerType}) = _$MonitoringCallParamImpl;

  factory _MonitoringCallParam.fromJson(Map<String, dynamic> json) =
      _$MonitoringCallParamImpl.fromJson;

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
  int get managerType;
  @override
  @JsonKey(ignore: true)
  _$$MonitoringCallParamImplCopyWith<_$MonitoringCallParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
