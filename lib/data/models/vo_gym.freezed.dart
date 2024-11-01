// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_gym.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Gym _$GymFromJson(Map<String, dynamic> json) {
  return _Gym.fromJson(json);
}

/// @nodoc
mixin _$Gym {
  String get gymId => throw _privateConstructorUsedError;
  String get gymName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GymCopyWith<Gym> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymCopyWith<$Res> {
  factory $GymCopyWith(Gym value, $Res Function(Gym) then) =
      _$GymCopyWithImpl<$Res, Gym>;
  @useResult
  $Res call({String gymId, String gymName});
}

/// @nodoc
class _$GymCopyWithImpl<$Res, $Val extends Gym> implements $GymCopyWith<$Res> {
  _$GymCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? gymName = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GymImplCopyWith<$Res> implements $GymCopyWith<$Res> {
  factory _$$GymImplCopyWith(_$GymImpl value, $Res Function(_$GymImpl) then) =
      __$$GymImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String gymId, String gymName});
}

/// @nodoc
class __$$GymImplCopyWithImpl<$Res> extends _$GymCopyWithImpl<$Res, _$GymImpl>
    implements _$$GymImplCopyWith<$Res> {
  __$$GymImplCopyWithImpl(_$GymImpl _value, $Res Function(_$GymImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? gymName = null,
  }) {
    return _then(_$GymImpl(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      gymName: null == gymName
          ? _value.gymName
          : gymName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GymImpl implements _Gym {
  const _$GymImpl({required this.gymId, required this.gymName});

  factory _$GymImpl.fromJson(Map<String, dynamic> json) =>
      _$$GymImplFromJson(json);

  @override
  final String gymId;
  @override
  final String gymName;

  @override
  String toString() {
    return 'Gym(gymId: $gymId, gymName: $gymName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GymImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.gymName, gymName) || other.gymName == gymName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gymId, gymName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GymImplCopyWith<_$GymImpl> get copyWith =>
      __$$GymImplCopyWithImpl<_$GymImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GymImplToJson(
      this,
    );
  }
}

abstract class _Gym implements Gym {
  const factory _Gym(
      {required final String gymId, required final String gymName}) = _$GymImpl;

  factory _Gym.fromJson(Map<String, dynamic> json) = _$GymImpl.fromJson;

  @override
  String get gymId;
  @override
  String get gymName;
  @override
  @JsonKey(ignore: true)
  _$$GymImplCopyWith<_$GymImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
