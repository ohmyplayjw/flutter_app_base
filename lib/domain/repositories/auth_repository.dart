import '../../data/models/vo_gym_list.dart';
import '../../data/models/vo_liveop_response.dart';
import '../../data/models/vo_login_response.dart';
import '../../data/models/vo_scoreboard_setting.dart';
import '../../data/network/result/api_error.dart';
import '../../data/simple_result.dart';
import '../model/login_param.dart';

abstract class AuthRepository<T> {
  Future<SimpleResult<LiveopResponse, ApiError>> tabletUseRequest(
      LoginParam loginParam);
  Future<SimpleResult<LoginResponse, ApiError>> signIn(LoginParam loginParam);
  Future<SimpleResult<ScoreboardSetting, ApiError>> scoreboardSetting(
      LoginParam loginParam);
  Future<SimpleResult<GymList, ApiError>> recentGymList();
}
