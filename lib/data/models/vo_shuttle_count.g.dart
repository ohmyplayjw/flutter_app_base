// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_shuttle_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShuttleCountRequestImpl _$$ShuttleCountRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ShuttleCountRequestImpl(
      gymId: json['gymId'] as String,
      macAddress: json['macAddress'] as String,
      loginKey: json['loginKey'] as String,
      courtId: json['courtId'] as String,
      reservationNum: (json['reservationNum'] as num).toInt(),
    );

Map<String, dynamic> _$$ShuttleCountRequestImplToJson(
        _$ShuttleCountRequestImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'macAddress': instance.macAddress,
      'loginKey': instance.loginKey,
      'courtId': instance.courtId,
      'reservationNum': instance.reservationNum,
    };
