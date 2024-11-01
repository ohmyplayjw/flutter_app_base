import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_referee_param.freezed.dart';
part 'vo_referee_param.g.dart';

@freezed
class RefereeParam with _$RefereeParam {
  factory RefereeParam(
      {required String gymId,
      required String loginKey,
      required String macAddress,
      required String refereeName,
      required String refereeType // 기본값 설정
      }) = _RefereeParam;

  factory RefereeParam.fromJson(Map<String, dynamic> json) =>
      _$RefereeParamFromJson(json);
}
