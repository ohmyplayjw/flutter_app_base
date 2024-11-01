// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  String get gymId => throw _privateConstructorUsedError;
  String get gymName => throw _privateConstructorUsedError;
  int get practiceTime => throw _privateConstructorUsedError;
  int get courtCol => throw _privateConstructorUsedError;
  int get courtRow => throw _privateConstructorUsedError;
  String get loginKey => throw _privateConstructorUsedError;
  int get challengeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call(
      {String gymId,
      String gymName,
      int practiceTime,
      int courtCol,
      int courtRow,
      String loginKey,
      int challengeCount});
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? gymName = null,
    Object? practiceTime = null,
    Object? courtCol = null,
    Object? courtRow = null,
    Object? loginKey = null,
    Object? challengeCount = null,
  }) {
    return _then(_value.copyWith(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      gymName: null == gymName
          ? _value.gymName
          : gymName // ignore: cast_nullable_to_non_nullable
              as String,
      practiceTime: null == practiceTime
          ? _value.practiceTime
          : practiceTime // ignore: cast_nullable_to_non_nullable
              as int,
      courtCol: null == courtCol
          ? _value.courtCol
          : courtCol // ignore: cast_nullable_to_non_nullable
              as int,
      courtRow: null == courtRow
          ? _value.courtRow
          : courtRow // ignore: cast_nullable_to_non_nullable
              as int,
      loginKey: null == loginKey
          ? _value.loginKey
          : loginKey // ignore: cast_nullable_to_non_nullable
              as String,
      challengeCount: null == challengeCount
          ? _value.challengeCount
          : challengeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymId,
      String gymName,
      int practiceTime,
      int courtCol,
      int courtRow,
      String loginKey,
      int challengeCount});
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? gymName = null,
    Object? practiceTime = null,
    Object? courtCol = null,
    Object? courtRow = null,
    Object? loginKey = null,
    Object? challengeCount = null,
  }) {
    return _then(_$LoginResponseImpl(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      gymName: null == gymName
          ? _value.gymName
          : gymName // ignore: cast_nullable_to_non_nullable
              as String,
      practiceTime: null == practiceTime
          ? _value.practiceTime
          : practiceTime // ignore: cast_nullable_to_non_nullable
              as int,
      courtCol: null == courtCol
          ? _value.courtCol
          : courtCol // ignore: cast_nullable_to_non_nullable
              as int,
      courtRow: null == courtRow
          ? _value.courtRow
          : courtRow // ignore: cast_nullable_to_non_nullable
              as int,
      loginKey: null == loginKey
          ? _value.loginKey
          : loginKey // ignore: cast_nullable_to_non_nullable
              as String,
      challengeCount: null == challengeCount
          ? _value.challengeCount
          : challengeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl(
      {required this.gymId,
      required this.gymName,
      required this.practiceTime,
      required this.courtCol,
      required this.courtRow,
      required this.loginKey,
      required this.challengeCount});

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final String gymId;
  @override
  final String gymName;
  @override
  final int practiceTime;
  @override
  final int courtCol;
  @override
  final int courtRow;
  @override
  final String loginKey;
  @override
  final int challengeCount;

  @override
  String toString() {
    return 'LoginResponse(gymId: $gymId, gymName: $gymName, practiceTime: $practiceTime, courtCol: $courtCol, courtRow: $courtRow, loginKey: $loginKey, challengeCount: $challengeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.gymName, gymName) || other.gymName == gymName) &&
            (identical(other.practiceTime, practiceTime) ||
                other.practiceTime == practiceTime) &&
            (identical(other.courtCol, courtCol) ||
                other.courtCol == courtCol) &&
            (identical(other.courtRow, courtRow) ||
                other.courtRow == courtRow) &&
            (identical(other.loginKey, loginKey) ||
                other.loginKey == loginKey) &&
            (identical(other.challengeCount, challengeCount) ||
                other.challengeCount == challengeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gymId, gymName, practiceTime,
      courtCol, courtRow, loginKey, challengeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
      {required final String gymId,
      required final String gymName,
      required final int practiceTime,
      required final int courtCol,
      required final int courtRow,
      required final String loginKey,
      required final int challengeCount}) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  String get gymId;
  @override
  String get gymName;
  @override
  int get practiceTime;
  @override
  int get courtCol;
  @override
  int get courtRow;
  @override
  String get loginKey;
  @override
  int get challengeCount;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
