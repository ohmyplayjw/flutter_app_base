import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_score_delete_param.freezed.dart';
part 'vo_score_delete_param.g.dart';

@freezed
class ScoreDeleteParam with _$ScoreDeleteParam {
  const factory ScoreDeleteParam(
      {required String gymId,
      required String loginKey,
      required String macAddress,
      required int reservationNum,
      required int rallyNum,
      required int setNum}) = _ScoreDeleteParam;

  factory ScoreDeleteParam.fromJson(Map<String, dynamic> json) =>
      _$ScoreDeleteParamFromJson(json);
}
