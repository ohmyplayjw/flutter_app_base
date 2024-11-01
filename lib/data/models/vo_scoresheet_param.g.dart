// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_scoresheet_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoresheetParamImpl _$$ScoresheetParamImplFromJson(
        Map<String, dynamic> json) =>
    _$ScoresheetParamImpl(
      gymId: json['gymId'] as String,
      loginKey: json['loginKey'] as String,
      macAddress: json['macAddress'] as String,
      setNum: (json['setNum'] as num).toInt(),
      reservationNum: (json['reservationNum'] as num).toInt(),
      rallyNum: (json['rallyNum'] as num).toInt(),
      service: (json['service'] as num).toInt(),
      teamPosition: (json['teamPosition'] as num).toInt(),
      teamAPosition: (json['teamAPosition'] as num).toInt(),
      teamBPosition: (json['teamBPosition'] as num).toInt(),
      participantId: (json['participantId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      winnerUserId: (json['winnerUserId'] as num).toInt(),
      scoreType: (json['scoreType'] as num).toInt(),
      scoreValue: (json['scoreValue'] as num).toInt(),
    );

Map<String, dynamic> _$$ScoresheetParamImplToJson(
        _$ScoresheetParamImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'loginKey': instance.loginKey,
      'macAddress': instance.macAddress,
      'setNum': instance.setNum,
      'reservationNum': instance.reservationNum,
      'rallyNum': instance.rallyNum,
      'service': instance.service,
      'teamPosition': instance.teamPosition,
      'teamAPosition': instance.teamAPosition,
      'teamBPosition': instance.teamBPosition,
      'participantId': instance.participantId,
      'userId': instance.userId,
      'winnerUserId': instance.winnerUserId,
      'scoreType': instance.scoreType,
      'scoreValue': instance.scoreValue,
    };
