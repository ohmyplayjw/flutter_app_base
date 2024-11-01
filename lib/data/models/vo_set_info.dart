import 'package:freezed_annotation/freezed_annotation.dart';

import 'vo_scoresheet_info.dart';

part 'vo_set_info.freezed.dart';
part 'vo_set_info.g.dart';

@freezed
class SetInfo with _$SetInfo {
  const factory SetInfo({
    required String gymId,
    required int setNum,
    required int reservationNum,
    required String rightParticipantId,
    required String leftParticipantId,
    required String serverUserId,
    required String receiveUserId,
    required int registDate,
    required List<ScoresheetInfo> scoreInfo,
    String? searchType, // nullable 필드
    String? name, // nullable 필드
    String? gameType,
    String? viewType, // nullable 필드
    String? externalTnmtId, // nullable 필드
    String? externalKey,
  }) = _SetInfo;

  factory SetInfo.fromJson(Map<String, dynamic> json) =>
      _$SetInfoFromJson(json);
}
