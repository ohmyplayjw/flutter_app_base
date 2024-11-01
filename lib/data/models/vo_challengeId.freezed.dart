// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_challengeId.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeId _$ChallengeIdFromJson(Map<String, dynamic> json) {
  return _ChallengeId.fromJson(json);
}

/// @nodoc
mixin _$ChallengeId {
  int get challengeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeIdCopyWith<ChallengeId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeIdCopyWith<$Res> {
  factory $ChallengeIdCopyWith(
          ChallengeId value, $Res Function(ChallengeId) then) =
      _$ChallengeIdCopyWithImpl<$Res, ChallengeId>;
  @useResult
  $Res call({int challengeId});
}

/// @nodoc
class _$ChallengeIdCopyWithImpl<$Res, $Val extends ChallengeId>
    implements $ChallengeIdCopyWith<$Res> {
  _$ChallengeIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = null,
  }) {
    return _then(_value.copyWith(
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeIdImplCopyWith<$Res>
    implements $ChallengeIdCopyWith<$Res> {
  factory _$$ChallengeIdImplCopyWith(
          _$ChallengeIdImpl value, $Res Function(_$ChallengeIdImpl) then) =
      __$$ChallengeIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int challengeId});
}

/// @nodoc
class __$$ChallengeIdImplCopyWithImpl<$Res>
    extends _$ChallengeIdCopyWithImpl<$Res, _$ChallengeIdImpl>
    implements _$$ChallengeIdImplCopyWith<$Res> {
  __$$ChallengeIdImplCopyWithImpl(
      _$ChallengeIdImpl _value, $Res Function(_$ChallengeIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = null,
  }) {
    return _then(_$ChallengeIdImpl(
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeIdImpl implements _ChallengeId {
  _$ChallengeIdImpl({required this.challengeId});

  factory _$ChallengeIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeIdImplFromJson(json);

  @override
  final int challengeId;

  @override
  String toString() {
    return 'ChallengeId(challengeId: $challengeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeIdImpl &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, challengeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeIdImplCopyWith<_$ChallengeIdImpl> get copyWith =>
      __$$ChallengeIdImplCopyWithImpl<_$ChallengeIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeIdImplToJson(
      this,
    );
  }
}

abstract class _ChallengeId implements ChallengeId {
  factory _ChallengeId({required final int challengeId}) = _$ChallengeIdImpl;

  factory _ChallengeId.fromJson(Map<String, dynamic> json) =
      _$ChallengeIdImpl.fromJson;

  @override
  int get challengeId;
  @override
  @JsonKey(ignore: true)
  _$$ChallengeIdImplCopyWith<_$ChallengeIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
