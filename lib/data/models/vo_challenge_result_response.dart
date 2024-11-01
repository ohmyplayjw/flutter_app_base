import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_challenge_result_response.freezed.dart';
part 'vo_challenge_result_response.g.dart';

@freezed
class ChallengeResultResponse with _$ChallengeResultResponse {
  factory ChallengeResultResponse({
    required String? challengeResult,
  }) = _ChallengeResultResponse;

  factory ChallengeResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ChallengeResultResponseFromJson(json);
}
