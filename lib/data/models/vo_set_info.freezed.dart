// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_set_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetInfo _$SetInfoFromJson(Map<String, dynamic> json) {
  return _SetInfo.fromJson(json);
}

/// @nodoc
mixin _$SetInfo {
  String get gymId => throw _privateConstructorUsedError;
  int get setNum => throw _privateConstructorUsedError;
  int get reservationNum => throw _privateConstructorUsedError;
  String get rightParticipantId => throw _privateConstructorUsedError;
  String get leftParticipantId => throw _privateConstructorUsedError;
  String get serverUserId => throw _privateConstructorUsedError;
  String get receiveUserId => throw _privateConstructorUsedError;
  int get registDate => throw _privateConstructorUsedError;
  List<ScoresheetInfo> get scoreInfo => throw _privateConstructorUsedError;
  String? get searchType => throw _privateConstructorUsedError; // nullable 필드
  String? get name => throw _privateConstructorUsedError; // nullable 필드
  String? get gameType => throw _privateConstructorUsedError;
  String? get viewType => throw _privateConstructorUsedError; // nullable 필드
  String? get externalTnmtId =>
      throw _privateConstructorUsedError; // nullable 필드
  String? get externalKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetInfoCopyWith<SetInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetInfoCopyWith<$Res> {
  factory $SetInfoCopyWith(SetInfo value, $Res Function(SetInfo) then) =
      _$SetInfoCopyWithImpl<$Res, SetInfo>;
  @useResult
  $Res call(
      {String gymId,
      int setNum,
      int reservationNum,
      String rightParticipantId,
      String leftParticipantId,
      String serverUserId,
      String receiveUserId,
      int registDate,
      List<ScoresheetInfo> scoreInfo,
      String? searchType,
      String? name,
      String? gameType,
      String? viewType,
      String? externalTnmtId,
      String? externalKey});
}

/// @nodoc
class _$SetInfoCopyWithImpl<$Res, $Val extends SetInfo>
    implements $SetInfoCopyWith<$Res> {
  _$SetInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? setNum = null,
    Object? reservationNum = null,
    Object? rightParticipantId = null,
    Object? leftParticipantId = null,
    Object? serverUserId = null,
    Object? receiveUserId = null,
    Object? registDate = null,
    Object? scoreInfo = null,
    Object? searchType = freezed,
    Object? name = freezed,
    Object? gameType = freezed,
    Object? viewType = freezed,
    Object? externalTnmtId = freezed,
    Object? externalKey = freezed,
  }) {
    return _then(_value.copyWith(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      setNum: null == setNum
          ? _value.setNum
          : setNum // ignore: cast_nullable_to_non_nullable
              as int,
      reservationNum: null == reservationNum
          ? _value.reservationNum
          : reservationNum // ignore: cast_nullable_to_non_nullable
              as int,
      rightParticipantId: null == rightParticipantId
          ? _value.rightParticipantId
          : rightParticipantId // ignore: cast_nullable_to_non_nullable
              as String,
      leftParticipantId: null == leftParticipantId
          ? _value.leftParticipantId
          : leftParticipantId // ignore: cast_nullable_to_non_nullable
              as String,
      serverUserId: null == serverUserId
          ? _value.serverUserId
          : serverUserId // ignore: cast_nullable_to_non_nullable
              as String,
      receiveUserId: null == receiveUserId
          ? _value.receiveUserId
          : receiveUserId // ignore: cast_nullable_to_non_nullable
              as String,
      registDate: null == registDate
          ? _value.registDate
          : registDate // ignore: cast_nullable_to_non_nullable
              as int,
      scoreInfo: null == scoreInfo
          ? _value.scoreInfo
          : scoreInfo // ignore: cast_nullable_to_non_nullable
              as List<ScoresheetInfo>,
      searchType: freezed == searchType
          ? _value.searchType
          : searchType // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      gameType: freezed == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String?,
      viewType: freezed == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as String?,
      externalTnmtId: freezed == externalTnmtId
          ? _value.externalTnmtId
          : externalTnmtId // ignore: cast_nullable_to_non_nullable
              as String?,
      externalKey: freezed == externalKey
          ? _value.externalKey
          : externalKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetInfoImplCopyWith<$Res> implements $SetInfoCopyWith<$Res> {
  factory _$$SetInfoImplCopyWith(
          _$SetInfoImpl value, $Res Function(_$SetInfoImpl) then) =
      __$$SetInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gymId,
      int setNum,
      int reservationNum,
      String rightParticipantId,
      String leftParticipantId,
      String serverUserId,
      String receiveUserId,
      int registDate,
      List<ScoresheetInfo> scoreInfo,
      String? searchType,
      String? name,
      String? gameType,
      String? viewType,
      String? externalTnmtId,
      String? externalKey});
}

/// @nodoc
class __$$SetInfoImplCopyWithImpl<$Res>
    extends _$SetInfoCopyWithImpl<$Res, _$SetInfoImpl>
    implements _$$SetInfoImplCopyWith<$Res> {
  __$$SetInfoImplCopyWithImpl(
      _$SetInfoImpl _value, $Res Function(_$SetInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? setNum = null,
    Object? reservationNum = null,
    Object? rightParticipantId = null,
    Object? leftParticipantId = null,
    Object? serverUserId = null,
    Object? receiveUserId = null,
    Object? registDate = null,
    Object? scoreInfo = null,
    Object? searchType = freezed,
    Object? name = freezed,
    Object? gameType = freezed,
    Object? viewType = freezed,
    Object? externalTnmtId = freezed,
    Object? externalKey = freezed,
  }) {
    return _then(_$SetInfoImpl(
      gymId: null == gymId
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
      setNum: null == setNum
          ? _value.setNum
          : setNum // ignore: cast_nullable_to_non_nullable
              as int,
      reservationNum: null == reservationNum
          ? _value.reservationNum
          : reservationNum // ignore: cast_nullable_to_non_nullable
              as int,
      rightParticipantId: null == rightParticipantId
          ? _value.rightParticipantId
          : rightParticipantId // ignore: cast_nullable_to_non_nullable
              as String,
      leftParticipantId: null == leftParticipantId
          ? _value.leftParticipantId
          : leftParticipantId // ignore: cast_nullable_to_non_nullable
              as String,
      serverUserId: null == serverUserId
          ? _value.serverUserId
          : serverUserId // ignore: cast_nullable_to_non_nullable
              as String,
      receiveUserId: null == receiveUserId
          ? _value.receiveUserId
          : receiveUserId // ignore: cast_nullable_to_non_nullable
              as String,
      registDate: null == registDate
          ? _value.registDate
          : registDate // ignore: cast_nullable_to_non_nullable
              as int,
      scoreInfo: null == scoreInfo
          ? _value._scoreInfo
          : scoreInfo // ignore: cast_nullable_to_non_nullable
              as List<ScoresheetInfo>,
      searchType: freezed == searchType
          ? _value.searchType
          : searchType // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      gameType: freezed == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String?,
      viewType: freezed == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as String?,
      externalTnmtId: freezed == externalTnmtId
          ? _value.externalTnmtId
          : externalTnmtId // ignore: cast_nullable_to_non_nullable
              as String?,
      externalKey: freezed == externalKey
          ? _value.externalKey
          : externalKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetInfoImpl implements _SetInfo {
  const _$SetInfoImpl(
      {required this.gymId,
      required this.setNum,
      required this.reservationNum,
      required this.rightParticipantId,
      required this.leftParticipantId,
      required this.serverUserId,
      required this.receiveUserId,
      required this.registDate,
      required final List<ScoresheetInfo> scoreInfo,
      this.searchType,
      this.name,
      this.gameType,
      this.viewType,
      this.externalTnmtId,
      this.externalKey})
      : _scoreInfo = scoreInfo;

  factory _$SetInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetInfoImplFromJson(json);

  @override
  final String gymId;
  @override
  final int setNum;
  @override
  final int reservationNum;
  @override
  final String rightParticipantId;
  @override
  final String leftParticipantId;
  @override
  final String serverUserId;
  @override
  final String receiveUserId;
  @override
  final int registDate;
  final List<ScoresheetInfo> _scoreInfo;
  @override
  List<ScoresheetInfo> get scoreInfo {
    if (_scoreInfo is EqualUnmodifiableListView) return _scoreInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scoreInfo);
  }

  @override
  final String? searchType;
// nullable 필드
  @override
  final String? name;
// nullable 필드
  @override
  final String? gameType;
  @override
  final String? viewType;
// nullable 필드
  @override
  final String? externalTnmtId;
// nullable 필드
  @override
  final String? externalKey;

  @override
  String toString() {
    return 'SetInfo(gymId: $gymId, setNum: $setNum, reservationNum: $reservationNum, rightParticipantId: $rightParticipantId, leftParticipantId: $leftParticipantId, serverUserId: $serverUserId, receiveUserId: $receiveUserId, registDate: $registDate, scoreInfo: $scoreInfo, searchType: $searchType, name: $name, gameType: $gameType, viewType: $viewType, externalTnmtId: $externalTnmtId, externalKey: $externalKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetInfoImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.setNum, setNum) || other.setNum == setNum) &&
            (identical(other.reservationNum, reservationNum) ||
                other.reservationNum == reservationNum) &&
            (identical(other.rightParticipantId, rightParticipantId) ||
                other.rightParticipantId == rightParticipantId) &&
            (identical(other.leftParticipantId, leftParticipantId) ||
                other.leftParticipantId == leftParticipantId) &&
            (identical(other.serverUserId, serverUserId) ||
                other.serverUserId == serverUserId) &&
            (identical(other.receiveUserId, receiveUserId) ||
                other.receiveUserId == receiveUserId) &&
            (identical(other.registDate, registDate) ||
                other.registDate == registDate) &&
            const DeepCollectionEquality()
                .equals(other._scoreInfo, _scoreInfo) &&
            (identical(other.searchType, searchType) ||
                other.searchType == searchType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType) &&
            (identical(other.externalTnmtId, externalTnmtId) ||
                other.externalTnmtId == externalTnmtId) &&
            (identical(other.externalKey, externalKey) ||
                other.externalKey == externalKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gymId,
      setNum,
      reservationNum,
      rightParticipantId,
      leftParticipantId,
      serverUserId,
      receiveUserId,
      registDate,
      const DeepCollectionEquality().hash(_scoreInfo),
      searchType,
      name,
      gameType,
      viewType,
      externalTnmtId,
      externalKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetInfoImplCopyWith<_$SetInfoImpl> get copyWith =>
      __$$SetInfoImplCopyWithImpl<_$SetInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetInfoImplToJson(
      this,
    );
  }
}

abstract class _SetInfo implements SetInfo {
  const factory _SetInfo(
      {required final String gymId,
      required final int setNum,
      required final int reservationNum,
      required final String rightParticipantId,
      required final String leftParticipantId,
      required final String serverUserId,
      required final String receiveUserId,
      required final int registDate,
      required final List<ScoresheetInfo> scoreInfo,
      final String? searchType,
      final String? name,
      final String? gameType,
      final String? viewType,
      final String? externalTnmtId,
      final String? externalKey}) = _$SetInfoImpl;

  factory _SetInfo.fromJson(Map<String, dynamic> json) = _$SetInfoImpl.fromJson;

  @override
  String get gymId;
  @override
  int get setNum;
  @override
  int get reservationNum;
  @override
  String get rightParticipantId;
  @override
  String get leftParticipantId;
  @override
  String get serverUserId;
  @override
  String get receiveUserId;
  @override
  int get registDate;
  @override
  List<ScoresheetInfo> get scoreInfo;
  @override
  String? get searchType;
  @override // nullable 필드
  String? get name;
  @override // nullable 필드
  String? get gameType;
  @override
  String? get viewType;
  @override // nullable 필드
  String? get externalTnmtId;
  @override // nullable 필드
  String? get externalKey;
  @override
  @JsonKey(ignore: true)
  _$$SetInfoImplCopyWith<_$SetInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
