// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_game_start_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStartParamImpl _$$GameStartParamImplFromJson(Map<String, dynamic> json) =>
    _$GameStartParamImpl(
      gymId: json['gymId'] as String,
      macAddress: json['macAddress'] as String,
      loginKey: json['loginKey'] as String,
      reservationNum: (json['reservationNum'] as num).toInt(),
      courtId: json['courtId'] as String,
      startUse: (json['startUse'] as num).toInt(),
    );

Map<String, dynamic> _$$GameStartParamImplToJson(
        _$GameStartParamImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'macAddress': instance.macAddress,
      'loginKey': instance.loginKey,
      'reservationNum': instance.reservationNum,
      'courtId': instance.courtId,
      'startUse': instance.startUse,
    };
