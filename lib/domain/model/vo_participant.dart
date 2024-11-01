import 'package:freezed_annotation/freezed_annotation.dart';

import 'vo_player.dart';

part 'vo_participant.freezed.dart';
part 'vo_participant.g.dart';

@freezed
class Participant with _$Participant {
  factory Participant({
    required String participantId,
    required List<Player> playerList,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}
