import 'package:com.ohmyplay.badminton_scoreboard_elite/data/models/vo_gym.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_gym_list.freezed.dart';
part 'vo_gym_list.g.dart';

@freezed
class GymList with _$GymList {
  factory GymList({
    required List<Gym> gyms,
  }) = _GymList;
  factory GymList.fromJson(List<dynamic> json) => GymList(
        gyms: json.map((e) => Gym.fromJson(e as Map<String, dynamic>)).toList(),
      );
}
