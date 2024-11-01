// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_challenge_result_enroll_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeResultEnrollParamImpl _$$ChallengeResultEnrollParamImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeResultEnrollParamImpl(
      gymId: json['gymId'] as String,
      macAddress: json['macAddress'] as String,
      loginKey: json['loginKey'] as String,
      challengeId: (json['challengeId'] as num).toInt(),
      challengeType: json['challengeType'] as String,
    );

Map<String, dynamic> _$$ChallengeResultEnrollParamImplToJson(
        _$ChallengeResultEnrollParamImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'macAddress': instance.macAddress,
      'loginKey': instance.loginKey,
      'challengeId': instance.challengeId,
      'challengeType': instance.challengeType,
    };
