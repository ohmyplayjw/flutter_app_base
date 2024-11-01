import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_default_param.freezed.dart';
part 'vo_default_param.g.dart';

@freezed
class DefaultParam with _$DefaultParam {
  factory DefaultParam({
    required String gymId,
    required String loginKey,
    required String macAddress, // 기본값 설정
  }) = _DefaultParam;

  factory DefaultParam.fromJson(Map<String, dynamic> json) =>
      _$DefaultParamFromJson(json);
}
