// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_monitoring_call_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringCallParamImpl _$$MonitoringCallParamImplFromJson(
        Map<String, dynamic> json) =>
    _$MonitoringCallParamImpl(
      gymId: json['gymId'] as String,
      macAddress: json['macAddress'] as String,
      loginKey: json['loginKey'] as String,
      courtId: json['courtId'] as String,
      reservationNum: (json['reservationNum'] as num).toInt(),
      managerType: (json['managerType'] as num).toInt(),
    );

Map<String, dynamic> _$$MonitoringCallParamImplToJson(
        _$MonitoringCallParamImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'macAddress': instance.macAddress,
      'loginKey': instance.loginKey,
      'courtId': instance.courtId,
      'reservationNum': instance.reservationNum,
      'managerType': instance.managerType,
    };
