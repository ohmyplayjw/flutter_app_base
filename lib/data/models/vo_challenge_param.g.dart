// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_challenge_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeParamImpl _$$ChallengeParamImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeParamImpl(
      gymId: json['gymId'] as String,
      macAddress: json['macAddress'] as String,
      loginKey: json['loginKey'] as String,
      reservationNum: (json['reservationNum'] as num).toInt(),
      courtId: json['courtId'] as String,
      setNum: (json['setNum'] as num).toInt(),
      participantId: json['participantId'] as String,
      cameraNum: (json['cameraNum'] as num).toInt(),
    );

Map<String, dynamic> _$$ChallengeParamImplToJson(
        _$ChallengeParamImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'macAddress': instance.macAddress,
      'loginKey': instance.loginKey,
      'reservationNum': instance.reservationNum,
      'courtId': instance.courtId,
      'setNum': instance.setNum,
      'participantId': instance.participantId,
      'cameraNum': instance.cameraNum,
    };
