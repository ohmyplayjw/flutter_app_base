// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_game_end_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameEndParamImpl _$$GameEndParamImplFromJson(Map<String, dynamic> json) =>
    _$GameEndParamImpl(
      gymId: json['gymId'] as String,
      macAddress: json['macAddress'] as String,
      loginKey: json['loginKey'] as String,
      reservationNum: (json['reservationNum'] as num).toInt(),
      courtId: json['courtId'] as String,
      startUse: (json['startUse'] as num).toInt(),
      winnerParticipantId: (json['winnerParticipantId'] as num).toInt(),
      scoreWin: json['scoreWin'] as String,
      scoreLost: json['scoreLost'] as String,
      isOpponentRetired: json['isOpponentRetired'] as String,
      externalTnmtId: json['externalTnmtId'] as String?,
      externalKey: json['externalKey'] as String?,
    );

Map<String, dynamic> _$$GameEndParamImplToJson(_$GameEndParamImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'macAddress': instance.macAddress,
      'loginKey': instance.loginKey,
      'reservationNum': instance.reservationNum,
      'courtId': instance.courtId,
      'startUse': instance.startUse,
      'winnerParticipantId': instance.winnerParticipantId,
      'scoreWin': instance.scoreWin,
      'scoreLost': instance.scoreLost,
      'isOpponentRetired': instance.isOpponentRetired,
      'externalTnmtId': instance.externalTnmtId,
      'externalKey': instance.externalKey,
    };
