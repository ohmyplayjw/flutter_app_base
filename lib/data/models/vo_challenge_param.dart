import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_challenge_param.freezed.dart';
part 'vo_challenge_param.g.dart';

@freezed
class ChallengeParam with _$ChallengeParam {
  const factory ChallengeParam(
      {required String gymId,
      required String macAddress,
      required String loginKey,
      required int reservationNum,
      required String courtId,
      required int setNum,
      required String participantId,
      required int cameraNum}) = _ChallengeParam;

  factory ChallengeParam.fromJson(Map<String, dynamic> json) =>
      _$ChallengeParamFromJson(json);
}
