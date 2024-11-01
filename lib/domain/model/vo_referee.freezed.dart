// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_referee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Referee _$RefereeFromJson(Map<String, dynamic> json) {
  return _Referee.fromJson(json);
}

/// @nodoc
mixin _$Referee {
  String get gymId => throw _privateConstructorUsedError;
  int? get refereeId => throw _privateConstructorUsedError;
  String get refereeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefereeCopyWith<Referee> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefereeCopyWith<$Res> {
  factory $RefereeCopyWith(Referee value, $Res Function(Referee) then) =
      _$RefereeCopyWithImpl<$Res, Referee>;
  @useResult
  $Res call({String gymId, int? refereeId, String refereeName});
}

/// @nodoc
class _$RefereeCopyWithImpl<$Res, $Val extends Referee>
    implements $RefereeCopyWith<$Res> {
  _$RefereeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? refereeId = freezed,
    Object? refereeName = null,
  }) {
    return _then(_value.copyWith(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      refereeId: freezed == refereeId
          ? _value.refereeId
          : refereeId // ignore: cast_nullable_to_non_nullable
              as int?,
      refereeName: null == refereeName
          ? _value.refereeName
          : refereeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefereeImplCopyWith<$Res> implements $RefereeCopyWith<$Res> {
  factory _$$RefereeImplCopyWith(
          _$RefereeImpl value, $Res Function(_$RefereeImpl) then) =
      __$$RefereeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String gymId, int? refereeId, String refereeName});
}

/// @nodoc
class __$$RefereeImplCopyWithImpl<$Res>
    extends _$RefereeCopyWithImpl<$Res, _$RefereeImpl>
    implements _$$RefereeImplCopyWith<$Res> {
  __$$RefereeImplCopyWithImpl(
      _$RefereeImpl _value, $Res Function(_$RefereeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? refereeId = freezed,
    Object? refereeName = null,
  }) {
    return _then(_$RefereeImpl(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      refereeId: freezed == refereeId
          ? _value.refereeId
          : refereeId // ignore: cast_nullable_to_non_nullable
              as int?,
      refereeName: null == refereeName
          ? _value.refereeName
          : refereeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefereeImpl implements _Referee {
  _$RefereeImpl(
      {required this.gymId, this.refereeId, required this.refereeName});

  factory _$RefereeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefereeImplFromJson(json);

  @override
  final String gymId;
  @override
  final int? refereeId;
  @override
  final String refereeName;

  @override
  String toString() {
    return 'Referee(gymId: $gymId, refereeId: $refereeId, refereeName: $refereeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefereeImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.refereeId, refereeId) ||
                other.refereeId == refereeId) &&
            (identical(other.refereeName, refereeName) ||
                other.refereeName == refereeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gymId, refereeId, refereeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefereeImplCopyWith<_$RefereeImpl> get copyWith =>
      __$$RefereeImplCopyWithImpl<_$RefereeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefereeImplToJson(
      this,
    );
  }
}

abstract class _Referee implements Referee {
  factory _Referee(
      {required final String gymId,
      final int? refereeId,
      required final String refereeName}) = _$RefereeImpl;

  factory _Referee.fromJson(Map<String, dynamic> json) = _$RefereeImpl.fromJson;

  @override
  String get gymId;
  @override
  int? get refereeId;
  @override
  String get refereeName;
  @override
  @JsonKey(ignore: true)
  _$$RefereeImplCopyWith<_$RefereeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
