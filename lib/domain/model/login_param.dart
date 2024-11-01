import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_param.freezed.dart';
part 'login_param.g.dart';

@freezed
class LoginParam with _$LoginParam {
  const factory LoginParam({
    required String gymId,
    required String macAddress,
  }) = _LoginParam;

  factory LoginParam.fromJson(Map<String, dynamic> json) =>
      _$LoginParamFromJson(json);
}
