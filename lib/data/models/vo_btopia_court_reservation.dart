import 'package:freezed_annotation/freezed_annotation.dart';
part 'vo_btopia_court_reservation.freezed.dart';
part 'vo_btopia_court_reservation.g.dart';

@freezed
class BtopiaCourtReservation with _$BtopiaCourtReservation {
  factory BtopiaCourtReservation({
    required int reservationNum,
    required String gymId,
    required String gymName,
    required String courtId,
    required int standBy,
    required int reservationCancel,
    required int reservationTime,
    required String name,
    required List<String>? userList,
    required String? qrId,
    required int userId,
    required String? moveCourtId,
    required int moveReservationNum,
    required int gameWaitTime,
    required String gameType,
    required int practiceTime,
    required String? checkRecordVideo,
    required int rentalReservationGroupNum,
    required String? attr1,
    required String? attr2,
    required String? attr3,
    required String? attr4,
    required String? attr5,
    required String? gameNum,
    required String? type,
    required String? age,
    required String? level,
    required String? division,
    required String? groupType,
    required String gameName,
    required List<dynamic> btopiaUserCourtReservationList,
    required String? courtSeq,
    required String? externalKey,
    required String? externalTeamKey,
    required String? externalTnmtId,
    required String? firstParticipantId,
    required String? secondParticipantId,
    required int participantId,
    required String? order,
    required String? broadcastTitle,
    required String? broadcastDesc,
    required String? broadcastPublic,
    required int reservationType,
  }) = _BtopiaCourtReservation;

  factory BtopiaCourtReservation.fromJson(Map<String, dynamic> json) =>
      _$BtopiaCourtReservationFromJson(json);
}
