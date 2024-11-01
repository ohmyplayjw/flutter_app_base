
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_login_response.freezed.dart';
part 'vo_login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String gymId,
    required String gymName,
    required int practiceTime, 
    required int courtCol,
    required int courtRow,
    required String loginKey,
    required int challengeCount,
  }) =_LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}