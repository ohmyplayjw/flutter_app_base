import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_challengeId.freezed.dart';
part 'vo_challengeId.g.dart';

@freezed
class ChallengeId with _$ChallengeId {
  factory ChallengeId({
    required int challengeId,
  }) = _ChallengeId;

  factory ChallengeId.fromJson(Map<String, dynamic> json) =>
      _$ChallengeIdFromJson(json);
}
