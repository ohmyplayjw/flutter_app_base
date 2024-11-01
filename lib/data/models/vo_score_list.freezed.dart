// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_score_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScoreList _$ScoreListFromJson(Map<String, dynamic> json) {
  return _ScoreList.fromJson(json);
}

/// @nodoc
mixin _$ScoreList {
  List<ScoresheetInfo> get scoreInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreListCopyWith<ScoreList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreListCopyWith<$Res> {
  factory $ScoreListCopyWith(ScoreList value, $Res Function(ScoreList) then) =
      _$ScoreListCopyWithImpl<$Res, ScoreList>;
  @useResult
  $Res call({List<ScoresheetInfo> scoreInfo});
}

/// @nodoc
class _$ScoreListCopyWithImpl<$Res, $Val extends ScoreList>
    implements $ScoreListCopyWith<$Res> {
  _$ScoreListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scoreInfo = null,
  }) {
    return _then(_value.copyWith(
      scoreInfo: null == scoreInfo
          ? _value.scoreInfo
          : scoreInfo // ignore: cast_nullable_to_non_nullable
              as List<ScoresheetInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreListImplCopyWith<$Res>
    implements $ScoreListCopyWith<$Res> {
  factory _$$ScoreListImplCopyWith(
          _$ScoreListImpl value, $Res Function(_$ScoreListImpl) then) =
      __$$ScoreListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ScoresheetInfo> scoreInfo});
}

/// @nodoc
class __$$ScoreListImplCopyWithImpl<$Res>
    extends _$ScoreListCopyWithImpl<$Res, _$ScoreListImpl>
    implements _$$ScoreListImplCopyWith<$Res> {
  __$$ScoreListImplCopyWithImpl(
      _$ScoreListImpl _value, $Res Function(_$ScoreListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scoreInfo = null,
  }) {
    return _then(_$ScoreListImpl(
      scoreInfo: null == scoreInfo
          ? _value._scoreInfo
          : scoreInfo // ignore: cast_nullable_to_non_nullable
              as List<ScoresheetInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreListImpl implements _ScoreList {
  _$ScoreListImpl({required final List<ScoresheetInfo> scoreInfo})
      : _scoreInfo = scoreInfo;

  factory _$ScoreListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreListImplFromJson(json);

  final List<ScoresheetInfo> _scoreInfo;
  @override
  List<ScoresheetInfo> get scoreInfo {
    if (_scoreInfo is EqualUnmodifiableListView) return _scoreInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scoreInfo);
  }

  @override
  String toString() {
    return 'ScoreList(scoreInfo: $scoreInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreListImpl &&
            const DeepCollectionEquality()
                .equals(other._scoreInfo, _scoreInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_scoreInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreListImplCopyWith<_$ScoreListImpl> get copyWith =>
      __$$ScoreListImplCopyWithImpl<_$ScoreListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreListImplToJson(
      this,
    );
  }
}

abstract class _ScoreList implements ScoreList {
  factory _ScoreList({required final List<ScoresheetInfo> scoreInfo}) =
      _$ScoreListImpl;

  factory _ScoreList.fromJson(Map<String, dynamic> json) =
      _$ScoreListImpl.fromJson;

  @override
  List<ScoresheetInfo> get scoreInfo;
  @override
  @JsonKey(ignore: true)
  _$$ScoreListImplCopyWith<_$ScoreListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
