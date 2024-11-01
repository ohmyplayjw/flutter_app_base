// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_game_setting_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameSettingParamImpl _$$GameSettingParamImplFromJson(
        Map<String, dynamic> json) =>
    _$GameSettingParamImpl(
      gymId: json['gymId'] as String,
      macAddress: json['macAddress'] as String,
      loginKey: json['loginKey'] as String,
      reservationNum: (json['reservationNum'] as num).toInt(),
      rightParticipantId: json['rightParticipantId'] as String,
      leftParticipantId: json['leftParticipantId'] as String,
      serverUserId: json['serverUserId'] as String,
      receiveUserId: json['receiveUserId'] as String,
      setNum: (json['setNum'] as num).toInt(),
    );

Map<String, dynamic> _$$GameSettingParamImplToJson(
        _$GameSettingParamImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'macAddress': instance.macAddress,
      'loginKey': instance.loginKey,
      'reservationNum': instance.reservationNum,
      'rightParticipantId': instance.rightParticipantId,
      'leftParticipantId': instance.leftParticipantId,
      'serverUserId': instance.serverUserId,
      'receiveUserId': instance.receiveUserId,
      'setNum': instance.setNum,
    };
