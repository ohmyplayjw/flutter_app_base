import 'package:freezed_annotation/freezed_annotation.dart';

import 'vo_scoresheet_info.dart';

part 'vo_score_list.freezed.dart';
part 'vo_score_list.g.dart';

@freezed
class ScoreList with _$ScoreList {
  factory ScoreList({
    required List<ScoresheetInfo> scoreInfo,
  }) = _ScoreList;
  factory ScoreList.fromJson(List<dynamic> json) => ScoreList(
        scoreInfo: json
            .map((e) => ScoresheetInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
