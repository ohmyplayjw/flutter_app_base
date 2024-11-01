// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_score_list_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreListParamImpl _$$ScoreListParamImplFromJson(Map<String, dynamic> json) =>
    _$ScoreListParamImpl(
      gymId: json['gymId'] as String,
      macAddress: json['macAddress'] as String,
      loginKey: json['loginKey'] as String,
      reservationNum: (json['reservationNum'] as num).toInt(),
      setNum: (json['setNum'] as num).toInt(),
    );

Map<String, dynamic> _$$ScoreListParamImplToJson(
        _$ScoreListParamImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'macAddress': instance.macAddress,
      'loginKey': instance.loginKey,
      'reservationNum': instance.reservationNum,
      'setNum': instance.setNum,
    };
