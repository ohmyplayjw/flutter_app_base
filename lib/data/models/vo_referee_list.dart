import 'package:com.ohmyplay.badminton_scoreboard_elite/domain/model/vo_referee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_referee_list.freezed.dart';
part 'vo_referee_list.g.dart';

@freezed
class RefereeList with _$RefereeList {
  factory RefereeList({
    required List<Referee> referees,
  }) = _RefereeList;
  factory RefereeList.fromJson(List<dynamic> json) => RefereeList(
        referees: json
            .map((e) => Referee.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
