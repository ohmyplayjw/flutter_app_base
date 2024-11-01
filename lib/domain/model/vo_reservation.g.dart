// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationImpl _$$ReservationImplFromJson(Map<String, dynamic> json) =>
    _$ReservationImpl(
      reservationNum: (json['reservationNum'] as num).toInt(),
      courtId: json['courtId'] as String,
      standBy: (json['standBy'] as num).toInt(),
      gameName: json['gameName'] as String,
      gameType: json['gameType'] as String,
      reservationTime: (json['reservationTime'] as num).toInt(),
      startUse: (json['startUse'] as num).toInt(),
      externalTeamKey: json['externalTeamKey'] as String?,
      externalKey: json['externalKey'] as String?,
      externalTnmtId: json['externalTnmtId'] as String?,
      btopiaUserCourtReservationList:
          (json['btopiaUserCourtReservationList'] as List<dynamic>?)
              ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$ReservationImplToJson(_$ReservationImpl instance) =>
    <String, dynamic>{
      'reservationNum': instance.reservationNum,
      'courtId': instance.courtId,
      'standBy': instance.standBy,
      'gameName': instance.gameName,
      'gameType': instance.gameType,
      'reservationTime': instance.reservationTime,
      'startUse': instance.startUse,
      'externalTeamKey': instance.externalTeamKey,
      'externalKey': instance.externalKey,
      'externalTnmtId': instance.externalTnmtId,
      'btopiaUserCourtReservationList': instance.btopiaUserCourtReservationList,
    };
