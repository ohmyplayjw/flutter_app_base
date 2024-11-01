import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_score_list_param.freezed.dart';
part 'vo_score_list_param.g.dart';

@freezed
class ScoreListParam with _$ScoreListParam {
  const factory ScoreListParam({
    required String gymId,
    required String macAddress,
    required String loginKey,
    required int reservationNum,
    required int setNum,
  }) = _ScoreListParam;

  factory ScoreListParam.fromJson(Map<String, dynamic> json) =>
      _$ScoreListParamFromJson(json);
}
