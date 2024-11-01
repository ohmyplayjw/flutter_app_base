// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_score_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreParamImpl _$$ScoreParamImplFromJson(Map<String, dynamic> json) =>
    _$ScoreParamImpl(
      gymId: json['gymId'] as String,
      loginKey: json['loginKey'] as String,
      macAddress: json['macAddress'] as String,
      courtId: json['courtId'] as String,
      reservationNum: (json['reservationNum'] as num).toInt(),
      ateamScore: (json['ateamScore'] as num).toInt(),
      bteamScore: (json['bteamScore'] as num).toInt(),
      setChanged: json['setChanged'] as bool,
      setNum: (json['setNum'] as num).toInt(),
    );

Map<String, dynamic> _$$ScoreParamImplToJson(_$ScoreParamImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'loginKey': instance.loginKey,
      'macAddress': instance.macAddress,
      'courtId': instance.courtId,
      'reservationNum': instance.reservationNum,
      'ateamScore': instance.ateamScore,
      'bteamScore': instance.bteamScore,
      'setChanged': instance.setChanged,
      'setNum': instance.setNum,
    };
