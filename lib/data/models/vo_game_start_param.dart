import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_game_start_param.freezed.dart';
part 'vo_game_start_param.g.dart';

@freezed
class GameStartParam with _$GameStartParam {
  const factory GameStartParam({
    required String gymId,
    required String macAddress,
    required String loginKey,
    required int reservationNum,
    required String courtId,
    required int startUse,
  }) = _GameStartParam;

  factory GameStartParam.fromJson(Map<String, dynamic> json) =>
      _$GameStartParamFromJson(json);
}
