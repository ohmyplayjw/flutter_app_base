// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_refereeId.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefereeId _$RefereeIdFromJson(Map<String, dynamic> json) {
  return _RefereeId.fromJson(json);
}

/// @nodoc
mixin _$RefereeId {
  int get refereeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefereeIdCopyWith<RefereeId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefereeIdCopyWith<$Res> {
  factory $RefereeIdCopyWith(RefereeId value, $Res Function(RefereeId) then) =
      _$RefereeIdCopyWithImpl<$Res, RefereeId>;
  @useResult
  $Res call({int refereeId});
}

/// @nodoc
class _$RefereeIdCopyWithImpl<$Res, $Val extends RefereeId>
    implements $RefereeIdCopyWith<$Res> {
  _$RefereeIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refereeId = null,
  }) {
    return _then(_value.copyWith(
      refereeId: null == refereeId
          ? _value.refereeId
          : refereeId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefereeIdImplCopyWith<$Res>
    implements $RefereeIdCopyWith<$Res> {
  factory _$$RefereeIdImplCopyWith(
          _$RefereeIdImpl value, $Res Function(_$RefereeIdImpl) then) =
      __$$RefereeIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int refereeId});
}

/// @nodoc
class __$$RefereeIdImplCopyWithImpl<$Res>
    extends _$RefereeIdCopyWithImpl<$Res, _$RefereeIdImpl>
    implements _$$RefereeIdImplCopyWith<$Res> {
  __$$RefereeIdImplCopyWithImpl(
      _$RefereeIdImpl _value, $Res Function(_$RefereeIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refereeId = null,
  }) {
    return _then(_$RefereeIdImpl(
      refereeId: null == refereeId
          ? _value.refereeId
          : refereeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefereeIdImpl implements _RefereeId {
  _$RefereeIdImpl({required this.refereeId});

  factory _$RefereeIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefereeIdImplFromJson(json);

  @override
  final int refereeId;

  @override
  String toString() {
    return 'RefereeId(refereeId: $refereeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefereeIdImpl &&
            (identical(other.refereeId, refereeId) ||
                other.refereeId == refereeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, refereeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefereeIdImplCopyWith<_$RefereeIdImpl> get copyWith =>
      __$$RefereeIdImplCopyWithImpl<_$RefereeIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefereeIdImplToJson(
      this,
    );
  }
}

abstract class _RefereeId implements RefereeId {
  factory _RefereeId({required final int refereeId}) = _$RefereeIdImpl;

  factory _RefereeId.fromJson(Map<String, dynamic> json) =
      _$RefereeIdImpl.fromJson;

  @override
  int get refereeId;
  @override
  @JsonKey(ignore: true)
  _$$RefereeIdImplCopyWith<_$RefereeIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
