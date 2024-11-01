// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_scoreboard_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScoreboardSetting _$ScoreboardSettingFromJson(Map<String, dynamic> json) {
  return _GymScoreboardSettingInfo.fromJson(json);
}

/// @nodoc
mixin _$ScoreboardSetting {
  String get gymId => throw _privateConstructorUsedError;
  int get challengeCnt => throw _privateConstructorUsedError;
  int get totalSet => throw _privateConstructorUsedError;
  int get setPoint => throw _privateConstructorUsedError;
  int get maxPoint => throw _privateConstructorUsedError;
  int get waitingTime => throw _privateConstructorUsedError;
  String get completionButtonYn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreboardSettingCopyWith<ScoreboardSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreboardSettingCopyWith<$Res> {
  factory $ScoreboardSettingCopyWith(
          ScoreboardSetting value, $Res Function(ScoreboardSetting) then) =
      _$ScoreboardSettingCopyWithImpl<$Res, ScoreboardSetting>;
  @useResult
  $Res call(
      {String gymId,
      int challengeCnt,
      int totalSet,
      int setPoint,
      int maxPoint,
      int waitingTime,
      String completionButtonYn});
}

/// @nodoc
class _$ScoreboardSettingCopyWithImpl<$Res, $Val extends ScoreboardSetting>
    implements $ScoreboardSettingCopyWith<$Res> {
  _$ScoreboardSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? challengeCnt = null,
    Object? totalSet = null,
    Object? setPoint = null,
    Object? maxPoint = null,
    Object? waitingTime = null,
    Object? completionButtonYn = null,
  }) {
    return _then(_value.copyWith(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      challengeCnt: null == challengeCnt
          ? _value.challengeCnt
          : challengeCnt // ignore: cast_nullable_to_non_nullable
              as int,
      totalSet: null == totalSet
          ? _value.totalSet
          : totalSet // ignore: cast_nullable_to_non_nullable
              as int,
      setPoint: null == setPoint
          ? _value.setPoint
          : setPoint // ignore: cast_nullable_to_non_nullable
              as int,
      maxPoint: null == maxPoint
          ? _value.maxPoint
          : maxPoint // ignore: cast_nullable_to_non_nullable
              as int,
      waitingTime: null == waitingTime
          ? _value.waitingTime
          : waitingTime // ignore: cast_nullable_to_non_nullable
              as int,
      completionButtonYn: null == completionButtonYn
          ? _value.completionButtonYn
          : completionButtonYn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GymScoreboardSettingInfoImplCopyWith<$Res>
    implements $ScoreboardSettingCopyWith<$Res> {
  factory _$$GymScoreboardSettingInfoImplCopyWith(
          _$GymScoreboardSettingInfoImpl value,
          $Res Function(_$GymScoreboardSettingInfoImpl) then) =
      __$$GymScoreboardSettingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymId,
      int challengeCnt,
      int totalSet,
      int setPoint,
      int maxPoint,
      int waitingTime,
      String completionButtonYn});
}

/// @nodoc
class __$$GymScoreboardSettingInfoImplCopyWithImpl<$Res>
    extends _$ScoreboardSettingCopyWithImpl<$Res,
        _$GymScoreboardSettingInfoImpl>
    implements _$$GymScoreboardSettingInfoImplCopyWith<$Res> {
  __$$GymScoreboardSettingInfoImplCopyWithImpl(
      _$GymScoreboardSettingInfoImpl _value,
      $Res Function(_$GymScoreboardSettingInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? challengeCnt = null,
    Object? totalSet = null,
    Object? setPoint = null,
    Object? maxPoint = null,
    Object? waitingTime = null,
    Object? completionButtonYn = null,
  }) {
    return _then(_$GymScoreboardSettingInfoImpl(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      challengeCnt: null == challengeCnt
          ? _value.challengeCnt
          : challengeCnt // ignore: cast_nullable_to_non_nullable
              as int,
      totalSet: null == totalSet
          ? _value.totalSet
          : totalSet // ignore: cast_nullable_to_non_nullable
              as int,
      setPoint: null == setPoint
          ? _value.setPoint
          : setPoint // ignore: cast_nullable_to_non_nullable
              as int,
      maxPoint: null == maxPoint
          ? _value.maxPoint
          : maxPoint // ignore: cast_nullable_to_non_nullable
              as int,
      waitingTime: null == waitingTime
          ? _value.waitingTime
          : waitingTime // ignore: cast_nullable_to_non_nullable
              as int,
      completionButtonYn: null == completionButtonYn
          ? _value.completionButtonYn
          : completionButtonYn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GymScoreboardSettingInfoImpl implements _GymScoreboardSettingInfo {
  const _$GymScoreboardSettingInfoImpl(
      {required this.gymId,
      required this.challengeCnt,
      required this.totalSet,
      required this.setPoint,
      required this.maxPoint,
      required this.waitingTime,
      required this.completionButtonYn});

  factory _$GymScoreboardSettingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GymScoreboardSettingInfoImplFromJson(json);

  @override
  final String gymId;
  @override
  final int challengeCnt;
  @override
  final int totalSet;
  @override
  final int setPoint;
  @override
  final int maxPoint;
  @override
  final int waitingTime;
  @override
  final String completionButtonYn;

  @override
  String toString() {
    return 'ScoreboardSetting(gymId: $gymId, challengeCnt: $challengeCnt, totalSet: $totalSet, setPoint: $setPoint, maxPoint: $maxPoint, waitingTime: $waitingTime, completionButtonYn: $completionButtonYn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GymScoreboardSettingInfoImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.challengeCnt, challengeCnt) ||
                other.challengeCnt == challengeCnt) &&
            (identical(other.totalSet, totalSet) ||
                other.totalSet == totalSet) &&
            (identical(other.setPoint, setPoint) ||
                other.setPoint == setPoint) &&
            (identical(other.maxPoint, maxPoint) ||
                other.maxPoint == maxPoint) &&
            (identical(other.waitingTime, waitingTime) ||
                other.waitingTime == waitingTime) &&
            (identical(other.completionButtonYn, completionButtonYn) ||
                other.completionButtonYn == completionButtonYn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gymId, challengeCnt, totalSet,
      setPoint, maxPoint, waitingTime, completionButtonYn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GymScoreboardSettingInfoImplCopyWith<_$GymScoreboardSettingInfoImpl>
      get copyWith => __$$GymScoreboardSettingInfoImplCopyWithImpl<
          _$GymScoreboardSettingInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GymScoreboardSettingInfoImplToJson(
      this,
    );
  }
}

abstract class _GymScoreboardSettingInfo implements ScoreboardSetting {
  const factory _GymScoreboardSettingInfo(
          {required final String gymId,
          required final int challengeCnt,
          required final int totalSet,
          required final int setPoint,
          required final int maxPoint,
          required final int waitingTime,
          required final String completionButtonYn}) =
      _$GymScoreboardSettingInfoImpl;

  factory _GymScoreboardSettingInfo.fromJson(Map<String, dynamic> json) =
      _$GymScoreboardSettingInfoImpl.fromJson;

  @override
  String get gymId;
  @override
  int get challengeCnt;
  @override
  int get totalSet;
  @override
  int get setPoint;
  @override
  int get maxPoint;
  @override
  int get waitingTime;
  @override
  String get completionButtonYn;
  @override
  @JsonKey(ignore: true)
  _$$GymScoreboardSettingInfoImplCopyWith<_$GymScoreboardSettingInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
