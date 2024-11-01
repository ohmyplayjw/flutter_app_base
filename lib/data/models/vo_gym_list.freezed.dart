// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_gym_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GymList _$GymListFromJson(Map<String, dynamic> json) {
  return _GymList.fromJson(json);
}

/// @nodoc
mixin _$GymList {
  List<Gym> get gyms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GymListCopyWith<GymList> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymListCopyWith<$Res> {
  factory $GymListCopyWith(GymList value, $Res Function(GymList) then) =
      _$GymListCopyWithImpl<$Res, GymList>;
  @useResult
  $Res call({List<Gym> gyms});
}

/// @nodoc
class _$GymListCopyWithImpl<$Res, $Val extends GymList>
    implements $GymListCopyWith<$Res> {
  _$GymListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gyms = null,
  }) {
    return _then(_value.copyWith(
      gyms: null == gyms
          ? _value.gyms
          : gyms // ignore: cast_nullable_to_non_nullable
              as List<Gym>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GymListImplCopyWith<$Res> implements $GymListCopyWith<$Res> {
  factory _$$GymListImplCopyWith(
          _$GymListImpl value, $Res Function(_$GymListImpl) then) =
      __$$GymListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Gym> gyms});
}

/// @nodoc
class __$$GymListImplCopyWithImpl<$Res>
    extends _$GymListCopyWithImpl<$Res, _$GymListImpl>
    implements _$$GymListImplCopyWith<$Res> {
  __$$GymListImplCopyWithImpl(
      _$GymListImpl _value, $Res Function(_$GymListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gyms = null,
  }) {
    return _then(_$GymListImpl(
      gyms: null == gyms
          ? _value._gyms
          : gyms // ignore: cast_nullable_to_non_nullable
              as List<Gym>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GymListImpl implements _GymList {
  _$GymListImpl({required final List<Gym> gyms}) : _gyms = gyms;

  factory _$GymListImpl.fromJson(Map<String, dynamic> json) =>
      _$$GymListImplFromJson(json);

  final List<Gym> _gyms;
  @override
  List<Gym> get gyms {
    if (_gyms is EqualUnmodifiableListView) return _gyms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gyms);
  }

  @override
  String toString() {
    return 'GymList(gyms: $gyms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GymListImpl &&
            const DeepCollectionEquality().equals(other._gyms, _gyms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_gyms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GymListImplCopyWith<_$GymListImpl> get copyWith =>
      __$$GymListImplCopyWithImpl<_$GymListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GymListImplToJson(
      this,
    );
  }
}

abstract class _GymList implements GymList {
  factory _GymList({required final List<Gym> gyms}) = _$GymListImpl;

  factory _GymList.fromJson(Map<String, dynamic> json) = _$GymListImpl.fromJson;

  @override
  List<Gym> get gyms;
  @override
  @JsonKey(ignore: true)
  _$$GymListImplCopyWith<_$GymListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
