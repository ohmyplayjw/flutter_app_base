import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_player.freezed.dart';
part 'vo_player.g.dart';

@freezed
class Player with _$Player {
  factory Player({
    required String participantId,
    required int userId,
    required String attr1,
    required String name,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
