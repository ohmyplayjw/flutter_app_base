// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      gymId: json['gymId'] as String,
      gymName: json['gymName'] as String,
      practiceTime: (json['practiceTime'] as num).toInt(),
      courtCol: (json['courtCol'] as num).toInt(),
      courtRow: (json['courtRow'] as num).toInt(),
      loginKey: json['loginKey'] as String,
      challengeCount: (json['challengeCount'] as num).toInt(),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'gymName': instance.gymName,
      'practiceTime': instance.practiceTime,
      'courtCol': instance.courtCol,
      'courtRow': instance.courtRow,
      'loginKey': instance.loginKey,
      'challengeCount': instance.challengeCount,
    };
