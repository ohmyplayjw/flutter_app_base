import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_challenge_result_enroll_param.freezed.dart';
part 'vo_challenge_result_enroll_param.g.dart';

@freezed
class ChallengeResultEnrollParam with _$ChallengeResultEnrollParam {
  const factory ChallengeResultEnrollParam(
      {required String gymId,
      required String macAddress,
      required String loginKey,
      required int challengeId,
      required String challengeType}) = _ChallengeResultEnrollParam;

  factory ChallengeResultEnrollParam.fromJson(Map<String, dynamic> json) =>
      _$ChallengeResultEnrollParamFromJson(json);
}
