// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_challenge_result_enroll_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeResultEnrollParam _$ChallengeResultEnrollParamFromJson(
    Map<String, dynamic> json) {
  return _ChallengeResultEnrollParam.fromJson(json);
}

/// @nodoc
mixin _$ChallengeResultEnrollParam {
  String get gymId => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  String get loginKey => throw _privateConstructorUsedError;
  int get challengeId => throw _privateConstructorUsedError;
  String get challengeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeResultEnrollParamCopyWith<ChallengeResultEnrollParam>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeResultEnrollParamCopyWith<$Res> {
  factory $ChallengeResultEnrollParamCopyWith(ChallengeResultEnrollParam value,
          $Res Function(ChallengeResultEnrollParam) then) =
      _$ChallengeResultEnrollParamCopyWithImpl<$Res,
          ChallengeResultEnrollParam>;
  @useResult
  $Res call(
      {String gymId,
      String macAddress,
      String loginKey,
      int challengeId,
      String challengeType});
}

/// @nodoc
class _$ChallengeResultEnrollParamCopyWithImpl<$Res,
        $Val extends ChallengeResultEnrollParam>
    implements $ChallengeResultEnrollParamCopyWith<$Res> {
  _$ChallengeResultEnrollParamCopyWithImpl(this._value, this._then);

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
    Object? challengeId = null,
    Object? challengeType = null,
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
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int,
      challengeType: null == challengeType
          ? _value.challengeType
          : challengeType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeResultEnrollParamImplCopyWith<$Res>
    implements $ChallengeResultEnrollParamCopyWith<$Res> {
  factory _$$ChallengeResultEnrollParamImplCopyWith(
          _$ChallengeResultEnrollParamImpl value,
          $Res Function(_$ChallengeResultEnrollParamImpl) then) =
      __$$ChallengeResultEnrollParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymId,
      String macAddress,
      String loginKey,
      int challengeId,
      String challengeType});
}

/// @nodoc
class __$$ChallengeResultEnrollParamImplCopyWithImpl<$Res>
    extends _$ChallengeResultEnrollParamCopyWithImpl<$Res,
        _$ChallengeResultEnrollParamImpl>
    implements _$$ChallengeResultEnrollParamImplCopyWith<$Res> {
  __$$ChallengeResultEnrollParamImplCopyWithImpl(
      _$ChallengeResultEnrollParamImpl _value,
      $Res Function(_$ChallengeResultEnrollParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? macAddress = null,
    Object? loginKey = null,
    Object? challengeId = null,
    Object? challengeType = null,
  }) {
    return _then(_$ChallengeResultEnrollParamImpl(
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
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int,
      challengeType: null == challengeType
          ? _value.challengeType
          : challengeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeResultEnrollParamImpl implements _ChallengeResultEnrollParam {
  const _$ChallengeResultEnrollParamImpl(
      {required this.gymId,
      required this.macAddress,
      required this.loginKey,
      required this.challengeId,
      required this.challengeType});

  factory _$ChallengeResultEnrollParamImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChallengeResultEnrollParamImplFromJson(json);

  @override
  final String gymId;
  @override
  final String macAddress;
  @override
  final String loginKey;
  @override
  final int challengeId;
  @override
  final String challengeType;

  @override
  String toString() {
    return 'ChallengeResultEnrollParam(gymId: $gymId, macAddress: $macAddress, loginKey: $loginKey, challengeId: $challengeId, challengeType: $challengeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeResultEnrollParamImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.loginKey, loginKey) ||
                other.loginKey == loginKey) &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            (identical(other.challengeType, challengeType) ||
                other.challengeType == challengeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, gymId, macAddress, loginKey, challengeId, challengeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeResultEnrollParamImplCopyWith<_$ChallengeResultEnrollParamImpl>
      get copyWith => __$$ChallengeResultEnrollParamImplCopyWithImpl<
          _$ChallengeResultEnrollParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeResultEnrollParamImplToJson(
      this,
    );
  }
}

abstract class _ChallengeResultEnrollParam
    implements ChallengeResultEnrollParam {
  const factory _ChallengeResultEnrollParam(
      {required final String gymId,
      required final String macAddress,
      required final String loginKey,
      required final int challengeId,
      required final String challengeType}) = _$ChallengeResultEnrollParamImpl;

  factory _ChallengeResultEnrollParam.fromJson(Map<String, dynamic> json) =
      _$ChallengeResultEnrollParamImpl.fromJson;

  @override
  String get gymId;
  @override
  String get macAddress;
  @override
  String get loginKey;
  @override
  int get challengeId;
  @override
  String get challengeType;
  @override
  @JsonKey(ignore: true)
  _$$ChallengeResultEnrollParamImplCopyWith<_$ChallengeResultEnrollParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}
