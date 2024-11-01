// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_court_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourtList _$CourtListFromJson(Map<String, dynamic> json) {
  return _CourtList.fromJson(json);
}

/// @nodoc
mixin _$CourtList {
  List<Court> get courts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourtListCopyWith<CourtList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourtListCopyWith<$Res> {
  factory $CourtListCopyWith(CourtList value, $Res Function(CourtList) then) =
      _$CourtListCopyWithImpl<$Res, CourtList>;
  @useResult
  $Res call({List<Court> courts});
}

/// @nodoc
class _$CourtListCopyWithImpl<$Res, $Val extends CourtList>
    implements $CourtListCopyWith<$Res> {
  _$CourtListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courts = null,
  }) {
    return _then(_value.copyWith(
      courts: null == courts
          ? _value.courts
          : courts // ignore: cast_nullable_to_non_nullable
              as List<Court>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourtListImplCopyWith<$Res>
    implements $CourtListCopyWith<$Res> {
  factory _$$CourtListImplCopyWith(
          _$CourtListImpl value, $Res Function(_$CourtListImpl) then) =
      __$$CourtListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Court> courts});
}

/// @nodoc
class __$$CourtListImplCopyWithImpl<$Res>
    extends _$CourtListCopyWithImpl<$Res, _$CourtListImpl>
    implements _$$CourtListImplCopyWith<$Res> {
  __$$CourtListImplCopyWithImpl(
      _$CourtListImpl _value, $Res Function(_$CourtListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courts = null,
  }) {
    return _then(_$CourtListImpl(
      courts: null == courts
          ? _value._courts
          : courts // ignore: cast_nullable_to_non_nullable
              as List<Court>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourtListImpl implements _CourtList {
  _$CourtListImpl({required final List<Court> courts}) : _courts = courts;

  factory _$CourtListImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourtListImplFromJson(json);

  final List<Court> _courts;
  @override
  List<Court> get courts {
    if (_courts is EqualUnmodifiableListView) return _courts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courts);
  }

  @override
  String toString() {
    return 'CourtList(courts: $courts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourtListImpl &&
            const DeepCollectionEquality().equals(other._courts, _courts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourtListImplCopyWith<_$CourtListImpl> get copyWith =>
      __$$CourtListImplCopyWithImpl<_$CourtListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourtListImplToJson(
      this,
    );
  }
}

abstract class _CourtList implements CourtList {
  factory _CourtList({required final List<Court> courts}) = _$CourtListImpl;

  factory _CourtList.fromJson(Map<String, dynamic> json) =
      _$CourtListImpl.fromJson;

  @override
  List<Court> get courts;
  @override
  @JsonKey(ignore: true)
  _$$CourtListImplCopyWith<_$CourtListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
