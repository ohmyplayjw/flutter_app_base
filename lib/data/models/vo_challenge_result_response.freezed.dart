// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_challenge_result_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeResultResponse _$ChallengeResultResponseFromJson(
    Map<String, dynamic> json) {
  return _ChallengeResultResponse.fromJson(json);
}

/// @nodoc
mixin _$ChallengeResultResponse {
  String? get challengeResult => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeResultResponseCopyWith<ChallengeResultResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeResultResponseCopyWith<$Res> {
  factory $ChallengeResultResponseCopyWith(ChallengeResultResponse value,
          $Res Function(ChallengeResultResponse) then) =
      _$ChallengeResultResponseCopyWithImpl<$Res, ChallengeResultResponse>;
  @useResult
  $Res call({String? challengeResult});
}

/// @nodoc
class _$ChallengeResultResponseCopyWithImpl<$Res,
        $Val extends ChallengeResultResponse>
    implements $ChallengeResultResponseCopyWith<$Res> {
  _$ChallengeResultResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeResult = freezed,
  }) {
    return _then(_value.copyWith(
      challengeResult: freezed == challengeResult
          ? _value.challengeResult
          : challengeResult // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeResultResponseImplCopyWith<$Res>
    implements $ChallengeResultResponseCopyWith<$Res> {
  factory _$$ChallengeResultResponseImplCopyWith(
          _$ChallengeResultResponseImpl value,
          $Res Function(_$ChallengeResultResponseImpl) then) =
      __$$ChallengeResultResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? challengeResult});
}

/// @nodoc
class __$$ChallengeResultResponseImplCopyWithImpl<$Res>
    extends _$ChallengeResultResponseCopyWithImpl<$Res,
        _$ChallengeResultResponseImpl>
    implements _$$ChallengeResultResponseImplCopyWith<$Res> {
  __$$ChallengeResultResponseImplCopyWithImpl(
      _$ChallengeResultResponseImpl _value,
      $Res Function(_$ChallengeResultResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeResult = freezed,
  }) {
    return _then(_$ChallengeResultResponseImpl(
      challengeResult: freezed == challengeResult
          ? _value.challengeResult
          : challengeResult // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeResultResponseImpl implements _ChallengeResultResponse {
  _$ChallengeResultResponseImpl({required this.challengeResult});

  factory _$ChallengeResultResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeResultResponseImplFromJson(json);

  @override
  final String? challengeResult;

  @override
  String toString() {
    return 'ChallengeResultResponse(challengeResult: $challengeResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeResultResponseImpl &&
            (identical(other.challengeResult, challengeResult) ||
                other.challengeResult == challengeResult));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, challengeResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeResultResponseImplCopyWith<_$ChallengeResultResponseImpl>
      get copyWith => __$$ChallengeResultResponseImplCopyWithImpl<
          _$ChallengeResultResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeResultResponseImplToJson(
      this,
    );
  }
}

abstract class _ChallengeResultResponse implements ChallengeResultResponse {
  factory _ChallengeResultResponse({required final String? challengeResult}) =
      _$ChallengeResultResponseImpl;

  factory _ChallengeResultResponse.fromJson(Map<String, dynamic> json) =
      _$ChallengeResultResponseImpl.fromJson;

  @override
  String? get challengeResult;
  @override
  @JsonKey(ignore: true)
  _$$ChallengeResultResponseImplCopyWith<_$ChallengeResultResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
