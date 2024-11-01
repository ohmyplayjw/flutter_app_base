import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_challenge_result_param.freezed.dart';
part 'vo_challenge_result_param.g.dart';

@freezed
class ChallengeResultParam with _$ChallengeResultParam {
  const factory ChallengeResultParam({
    required String gymId,
    required String macAddress,
    required String loginKey,
    required int challengeId,
  }) = _ChallengeResultParam;

  factory ChallengeResultParam.fromJson(Map<String, dynamic> json) =>
      _$ChallengeResultParamFromJson(json);
}
