import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_referee.freezed.dart';
part 'vo_referee.g.dart';

@freezed
class Referee with _$Referee {
  factory Referee({
    required String gymId,
    int? refereeId,
    required String refereeName,
  }) = _Referee;

  factory Referee.fromJson(Map<String, dynamic> json) =>
      _$RefereeFromJson(json);
}
