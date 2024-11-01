// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_challenge_result_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeResultParamImpl _$$ChallengeResultParamImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeResultParamImpl(
      gymId: json['gymId'] as String,
      macAddress: json['macAddress'] as String,
      loginKey: json['loginKey'] as String,
      challengeId: (json['challengeId'] as num).toInt(),
    );

Map<String, dynamic> _$$ChallengeResultParamImplToJson(
        _$ChallengeResultParamImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'macAddress': instance.macAddress,
      'loginKey': instance.loginKey,
      'challengeId': instance.challengeId,
    };
