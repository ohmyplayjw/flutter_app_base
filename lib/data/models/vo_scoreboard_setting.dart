
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_scoreboard_setting.freezed.dart';
part 'vo_scoreboard_setting.g.dart';

@freezed
class ScoreboardSetting with _$ScoreboardSetting {
  const factory ScoreboardSetting({
    required String gymId,
    required int challengeCnt, 
    required int totalSet,
    required int setPoint,
    required int maxPoint,
    required int waitingTime,
    required String completionButtonYn
  }) =_GymScoreboardSettingInfo;

  factory ScoreboardSetting.fromJson(Map<String, dynamic> json) => _$ScoreboardSettingFromJson(json);
}