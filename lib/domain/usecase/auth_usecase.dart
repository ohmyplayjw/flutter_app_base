import '../../data/models/vo_gym_list.dart';
import '../../data/models/vo_liveop_response.dart';
import '../../data/models/vo_login_response.dart';
import '../../data/models/vo_scoreboard_setting.dart';
import '../../data/network/result/api_error.dart';
import '../../data/simple_result.dart';
import '../model/login_param.dart';
import '../repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;
  AuthUseCase(this.authRepository);

  Future<SimpleResult<LoginResponse, ApiError>> signIn(
      LoginParam loginParam) async {
    final result = await authRepository.signIn(loginParam);
    return result;
  }

  Future<SimpleResult<ScoreboardSetting, ApiError>> scoreboardSetting(
      LoginParam loginParam) async {
    final result = await authRepository.scoreboardSetting(loginParam);
    return result;
  }

  Future<SimpleResult<LiveopResponse, ApiError>> tabletUseRequest(
      LoginParam loginParam) async {
    return await authRepository.tabletUseRequest(loginParam);
  }

  Future<SimpleResult<GymList, ApiError>> recentGymList() async {
    return await authRepository.recentGymList();
  }
}
