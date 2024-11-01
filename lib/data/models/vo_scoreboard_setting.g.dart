// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_scoreboard_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GymScoreboardSettingInfoImpl _$$GymScoreboardSettingInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$GymScoreboardSettingInfoImpl(
      gymId: json['gymId'] as String,
      challengeCnt: (json['challengeCnt'] as num).toInt(),
      totalSet: (json['totalSet'] as num).toInt(),
      setPoint: (json['setPoint'] as num).toInt(),
      maxPoint: (json['maxPoint'] as num).toInt(),
      waitingTime: (json['waitingTime'] as num).toInt(),
      completionButtonYn: json['completionButtonYn'] as String,
    );

Map<String, dynamic> _$$GymScoreboardSettingInfoImplToJson(
        _$GymScoreboardSettingInfoImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'challengeCnt': instance.challengeCnt,
      'totalSet': instance.totalSet,
      'setPoint': instance.setPoint,
      'maxPoint': instance.maxPoint,
      'waitingTime': instance.waitingTime,
      'completionButtonYn': instance.completionButtonYn,
    };
