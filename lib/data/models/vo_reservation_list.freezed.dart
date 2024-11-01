// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_reservation_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReservationList _$ReservationListFromJson(Map<String, dynamic> json) {
  return _ReservationList.fromJson(json);
}

/// @nodoc
mixin _$ReservationList {
  List<Reservation> get reservations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationListCopyWith<ReservationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationListCopyWith<$Res> {
  factory $ReservationListCopyWith(
          ReservationList value, $Res Function(ReservationList) then) =
      _$ReservationListCopyWithImpl<$Res, ReservationList>;
  @useResult
  $Res call({List<Reservation> reservations});
}

/// @nodoc
class _$ReservationListCopyWithImpl<$Res, $Val extends ReservationList>
    implements $ReservationListCopyWith<$Res> {
  _$ReservationListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservations = null,
  }) {
    return _then(_value.copyWith(
      reservations: null == reservations
          ? _value.reservations
          : reservations // ignore: cast_nullable_to_non_nullable
              as List<Reservation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationListImplCopyWith<$Res>
    implements $ReservationListCopyWith<$Res> {
  factory _$$ReservationListImplCopyWith(_$ReservationListImpl value,
          $Res Function(_$ReservationListImpl) then) =
      __$$ReservationListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Reservation> reservations});
}

/// @nodoc
class __$$ReservationListImplCopyWithImpl<$Res>
    extends _$ReservationListCopyWithImpl<$Res, _$ReservationListImpl>
    implements _$$ReservationListImplCopyWith<$Res> {
  __$$ReservationListImplCopyWithImpl(
      _$ReservationListImpl _value, $Res Function(_$ReservationListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservations = null,
  }) {
    return _then(_$ReservationListImpl(
      reservations: null == reservations
          ? _value._reservations
          : reservations // ignore: cast_nullable_to_non_nullable
              as List<Reservation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationListImpl implements _ReservationList {
  _$ReservationListImpl({required final List<Reservation> reservations})
      : _reservations = reservations;

  factory _$ReservationListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationListImplFromJson(json);

  final List<Reservation> _reservations;
  @override
  List<Reservation> get reservations {
    if (_reservations is EqualUnmodifiableListView) return _reservations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservations);
  }

  @override
  String toString() {
    return 'ReservationList(reservations: $reservations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationListImpl &&
            const DeepCollectionEquality()
                .equals(other._reservations, _reservations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_reservations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationListImplCopyWith<_$ReservationListImpl> get copyWith =>
      __$$ReservationListImplCopyWithImpl<_$ReservationListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationListImplToJson(
      this,
    );
  }
}

abstract class _ReservationList implements ReservationList {
  factory _ReservationList({required final List<Reservation> reservations}) =
      _$ReservationListImpl;

  factory _ReservationList.fromJson(Map<String, dynamic> json) =
      _$ReservationListImpl.fromJson;

  @override
  List<Reservation> get reservations;
  @override
  @JsonKey(ignore: true)
  _$$ReservationListImplCopyWith<_$ReservationListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
