// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_court.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourtImpl _$$CourtImplFromJson(Map<String, dynamic> json) => _$CourtImpl(
      gymId: json['gymId'] as String,
      courtId: json['courtId'] as String,
      courtNum: json['courtNum'] as String,
      useage: json['useage'] as String,
      reservation: json['reservation'] as String,
      startUse: (json['startUse'] as num).toInt(),
      gameWaitTimeDate: (json['gameWaitTimeDate'] as num?)?.toInt(),
      reservationNum: (json['reservationNum'] as num).toInt(),
      colIndex: (json['colIndex'] as num).toInt(),
      rowIndex: (json['rowIndex'] as num).toInt(),
      direction: (json['direction'] as num).toInt(),
      streamId: json['streamId'] as String?,
      rentalReservationGroupNum:
          (json['rentalReservationGroupNum'] as num).toInt(),
      gameType: json['gameType'] as String?,
      practiceTime: (json['practiceTime'] as num).toInt(),
      clubId: json['clubId'] as String?,
      checkRecordVideo: json['checkRecordVideo'] as String?,
      cnt: (json['cnt'] as num).toInt(),
      gameNum: (json['gameNum'] as num?)?.toInt(),
      gameName: json['gameName'] as String?,
      userList: (json['userList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      courtSeq: (json['courtSeq'] as num?)?.toInt(),
      regionKeypath: json['regionKeypath'] as String?,
    );

Map<String, dynamic> _$$CourtImplToJson(_$CourtImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'courtId': instance.courtId,
      'courtNum': instance.courtNum,
      'useage': instance.useage,
      'reservation': instance.reservation,
      'startUse': instance.startUse,
      'gameWaitTimeDate': instance.gameWaitTimeDate,
      'reservationNum': instance.reservationNum,
      'colIndex': instance.colIndex,
      'rowIndex': instance.rowIndex,
      'direction': instance.direction,
      'streamId': instance.streamId,
      'rentalReservationGroupNum': instance.rentalReservationGroupNum,
      'gameType': instance.gameType,
      'practiceTime': instance.practiceTime,
      'clubId': instance.clubId,
      'checkRecordVideo': instance.checkRecordVideo,
      'cnt': instance.cnt,
      'gameNum': instance.gameNum,
      'gameName': instance.gameName,
      'userList': instance.userList,
      'courtSeq': instance.courtSeq,
      'regionKeypath': instance.regionKeypath,
    };
