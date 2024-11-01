import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_referee_enroll_param.freezed.dart';
part 'vo_referee_enroll_param.g.dart';

@freezed
class RefereeEnrollParam with _$RefereeEnrollParam {
  factory RefereeEnrollParam({
    required String gymId,
    required String loginKey,
    required String macAddress,
    required int reservationNum,
    required int refereeId, // 기본값 설정
    int? refereeSupportId,
  }) = _RefereeEnrollParam;

  factory RefereeEnrollParam.fromJson(Map<String, dynamic> json) =>
      _$RefereeEnrollParamFromJson(json);
}
