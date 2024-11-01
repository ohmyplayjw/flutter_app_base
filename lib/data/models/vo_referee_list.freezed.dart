// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_referee_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefereeList _$RefereeListFromJson(Map<String, dynamic> json) {
  return _RefereeList.fromJson(json);
}

/// @nodoc
mixin _$RefereeList {
  List<Referee> get referees => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefereeListCopyWith<RefereeList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefereeListCopyWith<$Res> {
  factory $RefereeListCopyWith(
          RefereeList value, $Res Function(RefereeList) then) =
      _$RefereeListCopyWithImpl<$Res, RefereeList>;
  @useResult
  $Res call({List<Referee> referees});
}

/// @nodoc
class _$RefereeListCopyWithImpl<$Res, $Val extends RefereeList>
    implements $RefereeListCopyWith<$Res> {
  _$RefereeListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referees = null,
  }) {
    return _then(_value.copyWith(
      referees: null == referees
          ? _value.referees
          : referees // ignore: cast_nullable_to_non_nullable
              as List<Referee>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefereeListImplCopyWith<$Res>
    implements $RefereeListCopyWith<$Res> {
  factory _$$RefereeListImplCopyWith(
          _$RefereeListImpl value, $Res Function(_$RefereeListImpl) then) =
      __$$RefereeListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Referee> referees});
}

/// @nodoc
class __$$RefereeListImplCopyWithImpl<$Res>
    extends _$RefereeListCopyWithImpl<$Res, _$RefereeListImpl>
    implements _$$RefereeListImplCopyWith<$Res> {
  __$$RefereeListImplCopyWithImpl(
      _$RefereeListImpl _value, $Res Function(_$RefereeListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referees = null,
  }) {
    return _then(_$RefereeListImpl(
      referees: null == referees
          ? _value._referees
          : referees // ignore: cast_nullable_to_non_nullable
              as List<Referee>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefereeListImpl implements _RefereeList {
  _$RefereeListImpl({required final List<Referee> referees})
      : _referees = referees;

  factory _$RefereeListImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefereeListImplFromJson(json);

  final List<Referee> _referees;
  @override
  List<Referee> get referees {
    if (_referees is EqualUnmodifiableListView) return _referees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_referees);
  }

  @override
  String toString() {
    return 'RefereeList(referees: $referees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefereeListImpl &&
            const DeepCollectionEquality().equals(other._referees, _referees));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_referees));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefereeListImplCopyWith<_$RefereeListImpl> get copyWith =>
      __$$RefereeListImplCopyWithImpl<_$RefereeListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefereeListImplToJson(
      this,
    );
  }
}

abstract class _RefereeList implements RefereeList {
  factory _RefereeList({required final List<Referee> referees}) =
      _$RefereeListImpl;

  factory _RefereeList.fromJson(Map<String, dynamic> json) =
      _$RefereeListImpl.fromJson;

  @override
  List<Referee> get referees;
  @override
  @JsonKey(ignore: true)
  _$$RefereeListImplCopyWith<_$RefereeListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
