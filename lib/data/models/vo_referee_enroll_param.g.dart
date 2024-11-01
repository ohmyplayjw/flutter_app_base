// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_referee_enroll_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefereeEnrollParamImpl _$$RefereeEnrollParamImplFromJson(
        Map<String, dynamic> json) =>
    _$RefereeEnrollParamImpl(
      gymId: json['gymId'] as String,
      loginKey: json['loginKey'] as String,
      macAddress: json['macAddress'] as String,
      reservationNum: (json['reservationNum'] as num).toInt(),
      refereeId: (json['refereeId'] as num).toInt(),
      refereeSupportId: (json['refereeSupportId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RefereeEnrollParamImplToJson(
        _$RefereeEnrollParamImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'loginKey': instance.loginKey,
      'macAddress': instance.macAddress,
      'reservationNum': instance.reservationNum,
      'refereeId': instance.refereeId,
      'refereeSupportId': instance.refereeSupportId,
    };
