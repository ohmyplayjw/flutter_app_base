import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_gym.freezed.dart';
part 'vo_gym.g.dart';

@freezed
class Gym with _$Gym {
  const factory Gym({required String gymId, required String gymName}) = _Gym;

  factory Gym.fromJson(Map<String, dynamic> json) => _$GymFromJson(json);
}
