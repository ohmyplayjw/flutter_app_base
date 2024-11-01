import 'package:com.ohmyplay.badminton_scoreboard_elite/data/models/vo_challenge_param.dart';

import '../../data/models/vo_challengeId.dart';
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
import '../repositories/game_repository.dart';

class GameUseCase {
  final GameRepository gameRepository;
  GameUseCase(this.gameRepository);

  Future<SimpleResult<LiveopResponse, ApiError>> updateGameScore(
      ScoreParam scoreParam) async {
    return await gameRepository.updateGameScore(scoreParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> createGameScore(
      ScoresheetParam scoresheetParam) async {
    return await gameRepository.createGameScore(scoresheetParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> deleteGameScore(
      ScoreDeleteParam scoreDeleteParam) async {
    return await gameRepository.deleteGameScore(scoreDeleteParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> createGameSetting(
      GameSettingParam gameSettingParam) async {
    return await gameRepository.createGameSetting(gameSettingParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> shuttleCountPlus(
      ShuttleCountParam shuttleCountParam) async {
    return await gameRepository.shuttleCountPlus(shuttleCountParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> shuttleCountMinus(
      ShuttleCountParam shuttleCountParam) async {
    return await gameRepository.shuttleCountMinus(shuttleCountParam);
  }

  Future<SimpleResult<void, ApiError>> shuttleRequest(
      ShuttleCountParam shuttleCountParam) async {
    return await gameRepository.shuttleRequest(shuttleCountParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> shuttleDelete(
      ShuttleCountParam shuttleCountParam) async {
    return await gameRepository.shuttleCountMinus(shuttleCountParam);
  }

  Future<SimpleResult<ChallengeId, ApiError>> challengeRequest(
      ChallengeParam challengeParam) async {
    return await gameRepository.challengeRequest(challengeParam);
  }

  Future<SimpleResult<ChallengeResultResponse, ApiError>>
      challengeResultRequest(ChallengeResultParam challengeResultParam) async {
    return await gameRepository.challengeResultRequest(challengeResultParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> deleteGameChallenge(
      ChallengeResultParam challengeResultParam) async {
    return await gameRepository.deleteGameChallenge(challengeResultParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> challengeResultEnroll(
      ChallengeResultEnrollParam challengeResultEnrollParam) async {
    return await gameRepository
        .challengeResultEnroll(challengeResultEnrollParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> monitoringRequest(
      MonitoringCallParam monitoringCallParam) async {
    return await gameRepository.monitoringRequest(monitoringCallParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> gameStart(
      GameStartParam gameStartParam) async {
    return await gameRepository.gameStart(gameStartParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> gameEnd(
      GameEndParam gameEndParam) async {
    return await gameRepository.gameEnd(gameEndParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> gameEndOpponentRetired(
      GameEndParam gameEndParam) async {
    return await gameRepository.gameEndOpponentRetired(gameEndParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> listGameSettingScore(
      ScoreListParam scoreListParam) async {
    return await gameRepository.listGameSettingScore(scoreListParam);
  }
}
