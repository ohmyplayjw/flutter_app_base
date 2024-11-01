import 'package:com.ohmyplay.badminton_scoreboard_elite/domain/model/vo_court.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_court_list.freezed.dart';
part 'vo_court_list.g.dart';

@freezed
class CourtList with _$CourtList {
  factory CourtList({
    required List<Court> courts,
  }) = _CourtList;
  factory CourtList.fromJson(List<dynamic> json) => CourtList(
        courts:
            json.map((e) => Court.fromJson(e as Map<String, dynamic>)).toList(),
      );
}
