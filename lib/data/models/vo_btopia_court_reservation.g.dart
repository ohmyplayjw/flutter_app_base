// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_btopia_court_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BtopiaCourtReservationImpl _$$BtopiaCourtReservationImplFromJson(
        Map<String, dynamic> json) =>
    _$BtopiaCourtReservationImpl(
      reservationNum: (json['reservationNum'] as num).toInt(),
      gymId: json['gymId'] as String,
      gymName: json['gymName'] as String,
      courtId: json['courtId'] as String,
      standBy: (json['standBy'] as num).toInt(),
      reservationCancel: (json['reservationCancel'] as num).toInt(),
      reservationTime: (json['reservationTime'] as num).toInt(),
      name: json['name'] as String,
      userList: (json['userList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      qrId: json['qrId'] as String?,
      userId: (json['userId'] as num).toInt(),
      moveCourtId: json['moveCourtId'] as String?,
      moveReservationNum: (json['moveReservationNum'] as num).toInt(),
      gameWaitTime: (json['gameWaitTime'] as num).toInt(),
      gameType: json['gameType'] as String,
      practiceTime: (json['practiceTime'] as num).toInt(),
      checkRecordVideo: json['checkRecordVideo'] as String?,
      rentalReservationGroupNum:
          (json['rentalReservationGroupNum'] as num).toInt(),
      attr1: json['attr1'] as String?,
      attr2: json['attr2'] as String?,
      attr3: json['attr3'] as String?,
      attr4: json['attr4'] as String?,
      attr5: json['attr5'] as String?,
      gameNum: json['gameNum'] as String?,
      type: json['type'] as String?,
      age: json['age'] as String?,
      level: json['level'] as String?,
      division: json['division'] as String?,
      groupType: json['groupType'] as String?,
      gameName: json['gameName'] as String,
      btopiaUserCourtReservationList:
          json['btopiaUserCourtReservationList'] as List<dynamic>,
      courtSeq: json['courtSeq'] as String?,
      externalKey: json['externalKey'] as String?,
      externalTeamKey: json['externalTeamKey'] as String?,
      externalTnmtId: json['externalTnmtId'] as String?,
      firstParticipantId: json['firstParticipantId'] as String?,
      secondParticipantId: json['secondParticipantId'] as String?,
      participantId: (json['participantId'] as num).toInt(),
      order: json['order'] as String?,
      broadcastTitle: json['broadcastTitle'] as String?,
      broadcastDesc: json['broadcastDesc'] as String?,
      broadcastPublic: json['broadcastPublic'] as String?,
      reservationType: (json['reservationType'] as num).toInt(),
    );

Map<String, dynamic> _$$BtopiaCourtReservationImplToJson(
        _$BtopiaCourtReservationImpl instance) =>
    <String, dynamic>{
      'reservationNum': instance.reservationNum,
      'gymId': instance.gymId,
      'gymName': instance.gymName,
      'courtId': instance.courtId,
      'standBy': instance.standBy,
      'reservationCancel': instance.reservationCancel,
      'reservationTime': instance.reservationTime,
      'name': instance.name,
      'userList': instance.userList,
      'qrId': instance.qrId,
      'userId': instance.userId,
      'moveCourtId': instance.moveCourtId,
      'moveReservationNum': instance.moveReservationNum,
      'gameWaitTime': instance.gameWaitTime,
      'gameType': instance.gameType,
      'practiceTime': instance.practiceTime,
      'checkRecordVideo': instance.checkRecordVideo,
      'rentalReservationGroupNum': instance.rentalReservationGroupNum,
      'attr1': instance.attr1,
      'attr2': instance.attr2,
      'attr3': instance.attr3,
      'attr4': instance.attr4,
      'attr5': instance.attr5,
      'gameNum': instance.gameNum,
      'type': instance.type,
      'age': instance.age,
      'level': instance.level,
      'division': instance.division,
      'groupType': instance.groupType,
      'gameName': instance.gameName,
      'btopiaUserCourtReservationList': instance.btopiaUserCourtReservationList,
      'courtSeq': instance.courtSeq,
      'externalKey': instance.externalKey,
      'externalTeamKey': instance.externalTeamKey,
      'externalTnmtId': instance.externalTnmtId,
      'firstParticipantId': instance.firstParticipantId,
      'secondParticipantId': instance.secondParticipantId,
      'participantId': instance.participantId,
      'order': instance.order,
      'broadcastTitle': instance.broadcastTitle,
      'broadcastDesc': instance.broadcastDesc,
      'broadcastPublic': instance.broadcastPublic,
      'reservationType': instance.reservationType,
    };
