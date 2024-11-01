// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_default_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DefaultParam _$DefaultParamFromJson(Map<String, dynamic> json) {
  return _DefaultParam.fromJson(json);
}

/// @nodoc
mixin _$DefaultParam {
  String get gymId => throw _privateConstructorUsedError;
  String get loginKey => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultParamCopyWith<DefaultParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultParamCopyWith<$Res> {
  factory $DefaultParamCopyWith(
          DefaultParam value, $Res Function(DefaultParam) then) =
      _$DefaultParamCopyWithImpl<$Res, DefaultParam>;
  @useResult
  $Res call({String gymId, String loginKey, String macAddress});
}

/// @nodoc
class _$DefaultParamCopyWithImpl<$Res, $Val extends DefaultParam>
    implements $DefaultParamCopyWith<$Res> {
  _$DefaultParamCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefaultParamImplCopyWith<$Res>
    implements $DefaultParamCopyWith<$Res> {
  factory _$$DefaultParamImplCopyWith(
          _$DefaultParamImpl value, $Res Function(_$DefaultParamImpl) then) =
      __$$DefaultParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String gymId, String loginKey, String macAddress});
}

/// @nodoc
class __$$DefaultParamImplCopyWithImpl<$Res>
    extends _$DefaultParamCopyWithImpl<$Res, _$DefaultParamImpl>
    implements _$$DefaultParamImplCopyWith<$Res> {
  __$$DefaultParamImplCopyWithImpl(
      _$DefaultParamImpl _value, $Res Function(_$DefaultParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? loginKey = null,
    Object? macAddress = null,
  }) {
    return _then(_$DefaultParamImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefaultParamImpl implements _DefaultParam {
  _$DefaultParamImpl(
      {required this.gymId, required this.loginKey, required this.macAddress});

  factory _$DefaultParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefaultParamImplFromJson(json);

  @override
  final String gymId;
  @override
  final String loginKey;
  @override
  final String macAddress;

  @override
  String toString() {
    return 'DefaultParam(gymId: $gymId, loginKey: $loginKey, macAddress: $macAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultParamImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.loginKey, loginKey) ||
                other.loginKey == loginKey) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gymId, loginKey, macAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultParamImplCopyWith<_$DefaultParamImpl> get copyWith =>
      __$$DefaultParamImplCopyWithImpl<_$DefaultParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefaultParamImplToJson(
      this,
    );
  }
}

abstract class _DefaultParam implements DefaultParam {
  factory _DefaultParam(
      {required final String gymId,
      required final String loginKey,
      required final String macAddress}) = _$DefaultParamImpl;

  factory _DefaultParam.fromJson(Map<String, dynamic> json) =
      _$DefaultParamImpl.fromJson;

  @override
  String get gymId;
  @override
  String get loginKey;
  @override
  String get macAddress;
  @override
  @JsonKey(ignore: true)
  _$$DefaultParamImplCopyWith<_$DefaultParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
