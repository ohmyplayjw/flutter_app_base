// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_score_delete_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreDeleteParamImpl _$$ScoreDeleteParamImplFromJson(
        Map<String, dynamic> json) =>
    _$ScoreDeleteParamImpl(
      gymId: json['gymId'] as String,
      loginKey: json['loginKey'] as String,
      macAddress: json['macAddress'] as String,
      reservationNum: (json['reservationNum'] as num).toInt(),
      rallyNum: (json['rallyNum'] as num).toInt(),
      setNum: (json['setNum'] as num).toInt(),
    );

Map<String, dynamic> _$$ScoreDeleteParamImplToJson(
        _$ScoreDeleteParamImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'loginKey': instance.loginKey,
      'macAddress': instance.macAddress,
      'reservationNum': instance.reservationNum,
      'rallyNum': instance.rallyNum,
      'setNum': instance.setNum,
    };
