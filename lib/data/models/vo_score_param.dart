import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_score_param.freezed.dart';
part 'vo_score_param.g.dart';

@freezed
class ScoreParam with _$ScoreParam {
  const factory ScoreParam({
    required String gymId,
    required String loginKey,
    required String macAddress,
    required String courtId,
    required int reservationNum,
    required int ateamScore,
    required int bteamScore,
    required bool setChanged,
    required int setNum,
  }) = _ScoreParam;

  factory ScoreParam.fromJson(Map<String, dynamic> json) =>
      _$ScoreParamFromJson(json);
}
