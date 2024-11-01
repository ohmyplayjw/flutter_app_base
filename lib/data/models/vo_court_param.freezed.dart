// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_court_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourtParam _$CourtParamFromJson(Map<String, dynamic> json) {
  return _CourtParam.fromJson(json);
}

/// @nodoc
mixin _$CourtParam {
  String get loginKey => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  String get gymId => throw _privateConstructorUsedError;
  String get courtId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourtParamCopyWith<CourtParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourtParamCopyWith<$Res> {
  factory $CourtParamCopyWith(
          CourtParam value, $Res Function(CourtParam) then) =
      _$CourtParamCopyWithImpl<$Res, CourtParam>;
  @useResult
  $Res call({String loginKey, String macAddress, String gymId, String courtId});
}

/// @nodoc
class _$CourtParamCopyWithImpl<$Res, $Val extends CourtParam>
    implements $CourtParamCopyWith<$Res> {
  _$CourtParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginKey = null,
    Object? macAddress = null,
    Object? gymId = null,
    Object? courtId = null,
  }) {
    return _then(_value.copyWith(
      loginKey: null == loginKey
          ? _value.loginKey
          : loginKey // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourtParamImplCopyWith<$Res>
    implements $CourtParamCopyWith<$Res> {
  factory _$$CourtParamImplCopyWith(
          _$CourtParamImpl value, $Res Function(_$CourtParamImpl) then) =
      __$$CourtParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String loginKey, String macAddress, String gymId, String courtId});
}

/// @nodoc
class __$$CourtParamImplCopyWithImpl<$Res>
    extends _$CourtParamCopyWithImpl<$Res, _$CourtParamImpl>
    implements _$$CourtParamImplCopyWith<$Res> {
  __$$CourtParamImplCopyWithImpl(
      _$CourtParamImpl _value, $Res Function(_$CourtParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginKey = null,
    Object? macAddress = null,
    Object? gymId = null,
    Object? courtId = null,
  }) {
    return _then(_$CourtParamImpl(
      loginKey: null == loginKey
          ? _value.loginKey
          : loginKey // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourtParamImpl implements _CourtParam {
  _$CourtParamImpl(
      {required this.loginKey,
      required this.macAddress,
      required this.gymId,
      required this.courtId});

  factory _$CourtParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourtParamImplFromJson(json);

  @override
  final String loginKey;
  @override
  final String macAddress;
  @override
  final String gymId;
  @override
  final String courtId;

  @override
  String toString() {
    return 'CourtParam(loginKey: $loginKey, macAddress: $macAddress, gymId: $gymId, courtId: $courtId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourtParamImpl &&
            (identical(other.loginKey, loginKey) ||
                other.loginKey == loginKey) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.courtId, courtId) || other.courtId == courtId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, loginKey, macAddress, gymId, courtId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourtParamImplCopyWith<_$CourtParamImpl> get copyWith =>
      __$$CourtParamImplCopyWithImpl<_$CourtParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourtParamImplToJson(
      this,
    );
  }
}

abstract class _CourtParam implements CourtParam {
  factory _CourtParam(
      {required final String loginKey,
      required final String macAddress,
      required final String gymId,
      required final String courtId}) = _$CourtParamImpl;

  factory _CourtParam.fromJson(Map<String, dynamic> json) =
      _$CourtParamImpl.fromJson;

  @override
  String get loginKey;
  @override
  String get macAddress;
  @override
  String get gymId;
  @override
  String get courtId;
  @override
  @JsonKey(ignore: true)
  _$$CourtParamImplCopyWith<_$CourtParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
