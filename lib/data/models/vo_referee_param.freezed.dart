// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_referee_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefereeParam _$RefereeParamFromJson(Map<String, dynamic> json) {
  return _RefereeParam.fromJson(json);
}

/// @nodoc
mixin _$RefereeParam {
  String get gymId => throw _privateConstructorUsedError;
  String get loginKey => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  String get refereeName => throw _privateConstructorUsedError;
  String get refereeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefereeParamCopyWith<RefereeParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefereeParamCopyWith<$Res> {
  factory $RefereeParamCopyWith(
          RefereeParam value, $Res Function(RefereeParam) then) =
      _$RefereeParamCopyWithImpl<$Res, RefereeParam>;
  @useResult
  $Res call(
      {String gymId,
      String loginKey,
      String macAddress,
      String refereeName,
      String refereeType});
}

/// @nodoc
class _$RefereeParamCopyWithImpl<$Res, $Val extends RefereeParam>
    implements $RefereeParamCopyWith<$Res> {
  _$RefereeParamCopyWithImpl(this._value, this._then);

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
    Object? refereeName = null,
    Object? refereeType = null,
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
      refereeName: null == refereeName
          ? _value.refereeName
          : refereeName // ignore: cast_nullable_to_non_nullable
              as String,
      refereeType: null == refereeType
          ? _value.refereeType
          : refereeType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefereeParamImplCopyWith<$Res>
    implements $RefereeParamCopyWith<$Res> {
  factory _$$RefereeParamImplCopyWith(
          _$RefereeParamImpl value, $Res Function(_$RefereeParamImpl) then) =
      __$$RefereeParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymId,
      String loginKey,
      String macAddress,
      String refereeName,
      String refereeType});
}

/// @nodoc
class __$$RefereeParamImplCopyWithImpl<$Res>
    extends _$RefereeParamCopyWithImpl<$Res, _$RefereeParamImpl>
    implements _$$RefereeParamImplCopyWith<$Res> {
  __$$RefereeParamImplCopyWithImpl(
      _$RefereeParamImpl _value, $Res Function(_$RefereeParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? loginKey = null,
    Object? macAddress = null,
    Object? refereeName = null,
    Object? refereeType = null,
  }) {
    return _then(_$RefereeParamImpl(
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
      refereeName: null == refereeName
          ? _value.refereeName
          : refereeName // ignore: cast_nullable_to_non_nullable
              as String,
      refereeType: null == refereeType
          ? _value.refereeType
          : refereeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefereeParamImpl implements _RefereeParam {
  _$RefereeParamImpl(
      {required this.gymId,
      required this.loginKey,
      required this.macAddress,
      required this.refereeName,
      required this.refereeType});

  factory _$RefereeParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefereeParamImplFromJson(json);

  @override
  final String gymId;
  @override
  final String loginKey;
  @override
  final String macAddress;
  @override
  final String refereeName;
  @override
  final String refereeType;

  @override
  String toString() {
    return 'RefereeParam(gymId: $gymId, loginKey: $loginKey, macAddress: $macAddress, refereeName: $refereeName, refereeType: $refereeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefereeParamImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.loginKey, loginKey) ||
                other.loginKey == loginKey) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.refereeName, refereeName) ||
                other.refereeName == refereeName) &&
            (identical(other.refereeType, refereeType) ||
                other.refereeType == refereeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, gymId, loginKey, macAddress, refereeName, refereeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefereeParamImplCopyWith<_$RefereeParamImpl> get copyWith =>
      __$$RefereeParamImplCopyWithImpl<_$RefereeParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefereeParamImplToJson(
      this,
    );
  }
}

abstract class _RefereeParam implements RefereeParam {
  factory _RefereeParam(
      {required final String gymId,
      required final String loginKey,
      required final String macAddress,
      required final String refereeName,
      required final String refereeType}) = _$RefereeParamImpl;

  factory _RefereeParam.fromJson(Map<String, dynamic> json) =
      _$RefereeParamImpl.fromJson;

  @override
  String get gymId;
  @override
  String get loginKey;
  @override
  String get macAddress;
  @override
  String get refereeName;
  @override
  String get refereeType;
  @override
  @JsonKey(ignore: true)
  _$$RefereeParamImplCopyWith<_$RefereeParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
