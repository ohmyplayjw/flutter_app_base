import 'package:com.ohmyplay.badminton_scoreboard_elite/domain/model/vo_reservation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_reservation_list.freezed.dart';
part 'vo_reservation_list.g.dart';

@freezed
class ReservationList with _$ReservationList {
  factory ReservationList({
    required List<Reservation> reservations,
  }) = _ReservationList;
  factory ReservationList.fromJson(List<dynamic> json) => ReservationList(
        reservations: json
            .map((e) => Reservation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
