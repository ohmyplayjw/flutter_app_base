import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_game_end_param.freezed.dart';
part 'vo_game_end_param.g.dart';

@freezed
class GameEndParam with _$GameEndParam {
  const factory GameEndParam({
    required String gymId,
    required String macAddress,
    required String loginKey,
    required int reservationNum,
    required String courtId,
    required int startUse,
    required int winnerParticipantId,
    required String scoreWin,
    required String scoreLost,
    required String isOpponentRetired,
    String? externalTnmtId,
    String? externalKey,
  }) = _GameEndParam;

  factory GameEndParam.fromJson(Map<String, dynamic> json) =>
      _$GameEndParamFromJson(json);
}
