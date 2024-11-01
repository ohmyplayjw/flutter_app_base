import '../../data/models/vo_challengeId.dart';
import '../../data/models/vo_challenge_param.dart';
import '../../data/models/vo_challenge_result_enroll_param.dart';
import '../../data/models/vo_challenge_result_param.dart';
import '../../data/models/vo_challenge_result_response.dart';
import '../../data/models/vo_game_end_param.dart';
import '../../data/models/vo_game_setting_param.dart';
import '../../data/models/vo_game_start_param.dart';
import '../../data/models/vo_liveop_response.dart';
import '../../data/models/vo_monitoring_call_param.dart';
import '../../data/models/vo_score_delete_param.dart';
import '../../data/models/vo_score_list_param.dart';
import '../../data/models/vo_score_param.dart';
import '../../data/models/vo_scoresheet_param.dart';
import '../../data/models/vo_shuttle_count.dart';
import '../../data/network/result/api_error.dart';
import '../../data/simple_result.dart';

abstract class GameRepository<T> {
  Future<SimpleResult<LiveopResponse, ApiError>> updateGameScore(
      ScoreParam scoreParam);

  Future<SimpleResult<LiveopResponse, ApiError>> createGameScore(
      ScoresheetParam scoresheetParam);

  Future<SimpleResult<LiveopResponse, ApiError>> deleteGameScore(
      ScoreDeleteParam scoreDeleteParam);

  Future<SimpleResult<LiveopResponse, ApiError>> createGameSetting(
      GameSettingParam gameSettingParam);

  Future<SimpleResult<LiveopResponse, ApiError>> shuttleCountMinus(
      ShuttleCountParam shuttleCountParam);

  Future<SimpleResult<LiveopResponse, ApiError>> shuttleCountPlus(
      ShuttleCountParam shuttleCountParam);

  Future<SimpleResult<void, ApiError>> shuttleRequest(
      ShuttleCountParam shuttleCountParam);

  Future<SimpleResult<LiveopResponse, ApiError>> shuttleDelete(
      ShuttleCountParam shuttleCountParam);

  Future<SimpleResult<ChallengeId, ApiError>> challengeRequest(
      ChallengeParam challengeParam);

  Future<SimpleResult<ChallengeResultResponse, ApiError>>
      challengeResultRequest(ChallengeResultParam challengeResultParam);

  Future<SimpleResult<LiveopResponse, ApiError>> deleteGameChallenge(
      ChallengeResultParam challengeResultParam);

  Future<SimpleResult<LiveopResponse, ApiError>> challengeResultEnroll(
      ChallengeResultEnrollParam challengeResultEnrollParam);

  Future<SimpleResult<LiveopResponse, ApiError>> monitoringRequest(
      MonitoringCallParam monitoringCallParam);

  Future<SimpleResult<LiveopResponse, ApiError>> gameStart(
      GameStartParam gameStartParam);

  Future<SimpleResult<LiveopResponse, ApiError>> gameEnd(
      GameEndParam gameEndParam);
  Future<SimpleResult<LiveopResponse, ApiError>> gameEndOpponentRetired(
      GameEndParam gameEndParam);
  Future<SimpleResult<LiveopResponse, ApiError>> listGameSettingScore(
      ScoreListParam scoreListParam);
}
