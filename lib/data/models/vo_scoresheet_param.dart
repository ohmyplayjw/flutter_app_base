import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_scoresheet_param.freezed.dart';
part 'vo_scoresheet_param.g.dart';

@freezed
class ScoresheetParam with _$ScoresheetParam {
  const factory ScoresheetParam({
    required String gymId,
    required String loginKey,
    required String macAddress,
    required int setNum,
    required int reservationNum,
    required int rallyNum,
    required int service,
    required int teamPosition,
    required int teamAPosition,
    required int teamBPosition,
    required int participantId,
    required int userId,
    required int winnerUserId,
    required int scoreType,
    required int scoreValue,
  }) = _ScoresheetParam;

  factory ScoresheetParam.fromJson(Map<String, dynamic> json) =>
      _$ScoresheetParamFromJson(json);
}
