import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_scoresheet_info.freezed.dart';
part 'vo_scoresheet_info.g.dart';

@freezed
class ScoresheetInfo with _$ScoresheetInfo {
  const factory ScoresheetInfo({
    required String gymId,
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
    required int registDate,
  }) = _ScoresheetInfo;

  factory ScoresheetInfo.fromJson(Map<String, dynamic> json) =>
      _$ScoresheetInfoFromJson(json);
}
