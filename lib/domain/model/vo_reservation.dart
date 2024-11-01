import 'package:freezed_annotation/freezed_annotation.dart';

import 'vo_player.dart';

part 'vo_reservation.freezed.dart';
part 'vo_reservation.g.dart';

@freezed
class Reservation with _$Reservation {
  const factory Reservation({
    required int reservationNum,
    required String courtId,
    required int standBy,
    required String gameName,
    required String gameType,
    required int reservationTime,
    required int startUse,
    String? externalTeamKey,
    String? externalKey,
    String? externalTnmtId,
    required List<Player>? btopiaUserCourtReservationList,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
}
