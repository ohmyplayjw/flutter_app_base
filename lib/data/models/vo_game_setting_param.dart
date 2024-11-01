import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_game_setting_param.freezed.dart';
part 'vo_game_setting_param.g.dart';

@freezed
class GameSettingParam with _$GameSettingParam {
  const factory GameSettingParam({
    required String gymId,
    required String macAddress,
    required String loginKey,
    required int reservationNum,
    required String rightParticipantId,
    required String leftParticipantId,
    required String serverUserId,
    required String receiveUserId,
    required int setNum,
  }) = _GameSettingParam;

  factory GameSettingParam.fromJson(Map<String, dynamic> json) =>
      _$GameSettingParamFromJson(json);
}
