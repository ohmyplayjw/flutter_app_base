// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_challenge_result_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeResultParam _$ChallengeResultParamFromJson(Map<String, dynamic> json) {
  return _ChallengeResultParam.fromJson(json);
}

/// @nodoc
mixin _$ChallengeResultParam {
  String get gymId => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  String get loginKey => throw _privateConstructorUsedError;
  int get challengeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeResultParamCopyWith<ChallengeResultParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeResultParamCopyWith<$Res> {
  factory $ChallengeResultParamCopyWith(ChallengeResultParam value,
          $Res Function(ChallengeResultParam) then) =
      _$ChallengeResultParamCopyWithImpl<$Res, ChallengeResultParam>;
  @useResult
  $Res call(
      {String gymId, String macAddress, String loginKey, int challengeId});
}

/// @nodoc
class _$ChallengeResultParamCopyWithImpl<$Res,
        $Val extends ChallengeResultParam>
    implements $ChallengeResultParamCopyWith<$Res> {
  _$ChallengeResultParamCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeResultParamImplCopyWith<$Res>
    implements $ChallengeResultParamCopyWith<$Res> {
  factory _$$ChallengeResultParamImplCopyWith(_$ChallengeResultParamImpl value,
          $Res Function(_$ChallengeResultParamImpl) then) =
      __$$ChallengeResultParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymId, String macAddress, String loginKey, int challengeId});
}

/// @nodoc
class __$$ChallengeResultParamImplCopyWithImpl<$Res>
    extends _$ChallengeResultParamCopyWithImpl<$Res, _$ChallengeResultParamImpl>
    implements _$$ChallengeResultParamImplCopyWith<$Res> {
  __$$ChallengeResultParamImplCopyWithImpl(_$ChallengeResultParamImpl _value,
      $Res Function(_$ChallengeResultParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? macAddress = null,
    Object? loginKey = null,
    Object? challengeId = null,
  }) {
    return _then(_$ChallengeResultParamImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeResultParamImpl implements _ChallengeResultParam {
  const _$ChallengeResultParamImpl(
      {required this.gymId,
      required this.macAddress,
      required this.loginKey,
      required this.challengeId});

  factory _$ChallengeResultParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeResultParamImplFromJson(json);

  @override
  final String gymId;
  @override
  final String macAddress;
  @override
  final String loginKey;
  @override
  final int challengeId;

  @override
  String toString() {
    return 'ChallengeResultParam(gymId: $gymId, macAddress: $macAddress, loginKey: $loginKey, challengeId: $challengeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeResultParamImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.loginKey, loginKey) ||
                other.loginKey == loginKey) &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, gymId, macAddress, loginKey, challengeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeResultParamImplCopyWith<_$ChallengeResultParamImpl>
      get copyWith =>
          __$$ChallengeResultParamImplCopyWithImpl<_$ChallengeResultParamImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeResultParamImplToJson(
      this,
    );
  }
}

abstract class _ChallengeResultParam implements ChallengeResultParam {
  const factory _ChallengeResultParam(
      {required final String gymId,
      required final String macAddress,
      required final String loginKey,
      required final int challengeId}) = _$ChallengeResultParamImpl;

  factory _ChallengeResultParam.fromJson(Map<String, dynamic> json) =
      _$ChallengeResultParamImpl.fromJson;

  @override
  String get gymId;
  @override
  String get macAddress;
  @override
  String get loginKey;
  @override
  int get challengeId;
  @override
  @JsonKey(ignore: true)
  _$$ChallengeResultParamImplCopyWith<_$ChallengeResultParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}
