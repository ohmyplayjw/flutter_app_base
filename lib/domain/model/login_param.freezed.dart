// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginParam _$LoginParamFromJson(Map<String, dynamic> json) {
  return _LoginParam.fromJson(json);
}

/// @nodoc
mixin _$LoginParam {
  String get gymId => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginParamCopyWith<LoginParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginParamCopyWith<$Res> {
  factory $LoginParamCopyWith(
          LoginParam value, $Res Function(LoginParam) then) =
      _$LoginParamCopyWithImpl<$Res, LoginParam>;
  @useResult
  $Res call({String gymId, String macAddress});
}

/// @nodoc
class _$LoginParamCopyWithImpl<$Res, $Val extends LoginParam>
    implements $LoginParamCopyWith<$Res> {
  _$LoginParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? macAddress = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginParamImplCopyWith<$Res>
    implements $LoginParamCopyWith<$Res> {
  factory _$$LoginParamImplCopyWith(
          _$LoginParamImpl value, $Res Function(_$LoginParamImpl) then) =
      __$$LoginParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String gymId, String macAddress});
}

/// @nodoc
class __$$LoginParamImplCopyWithImpl<$Res>
    extends _$LoginParamCopyWithImpl<$Res, _$LoginParamImpl>
    implements _$$LoginParamImplCopyWith<$Res> {
  __$$LoginParamImplCopyWithImpl(
      _$LoginParamImpl _value, $Res Function(_$LoginParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? macAddress = null,
  }) {
    return _then(_$LoginParamImpl(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
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
class _$LoginParamImpl implements _LoginParam {
  const _$LoginParamImpl({required this.gymId, required this.macAddress});

  factory _$LoginParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginParamImplFromJson(json);

  @override
  final String gymId;
  @override
  final String macAddress;

  @override
  String toString() {
    return 'LoginParam(gymId: $gymId, macAddress: $macAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginParamImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gymId, macAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginParamImplCopyWith<_$LoginParamImpl> get copyWith =>
      __$$LoginParamImplCopyWithImpl<_$LoginParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginParamImplToJson(
      this,
    );
  }
}

abstract class _LoginParam implements LoginParam {
  const factory _LoginParam(
      {required final String gymId,
      required final String macAddress}) = _$LoginParamImpl;

  factory _LoginParam.fromJson(Map<String, dynamic> json) =
      _$LoginParamImpl.fromJson;

  @override
  String get gymId;
  @override
  String get macAddress;
  @override
  @JsonKey(ignore: true)
  _$$LoginParamImplCopyWith<_$LoginParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
