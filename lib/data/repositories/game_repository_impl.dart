import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../domain/repositories/game_repository.dart';
import '../models/vo_challengeId.dart';
import '../models/vo_challenge_param.dart';
import '../models/vo_challenge_result_enroll_param.dart';
import '../models/vo_challenge_result_param.dart';
import '../models/vo_challenge_result_response.dart';
import '../models/vo_game_end_param.dart';
import '../models/vo_game_setting_param.dart';
import '../models/vo_game_start_param.dart';
import '../models/vo_liveop_response.dart';
import '../models/vo_monitoring_call_param.dart';
import '../models/vo_score_delete_param.dart';
import '../models/vo_score_list_param.dart';
import '../models/vo_score_param.dart';
import '../models/vo_scoresheet_param.dart';
import '../models/vo_shuttle_count.dart';
import '../network/result/api_error.dart';
import '../remote/clients/liveop_client.dart';
import '../simple_result.dart';

class GameRepositoryImpl implements GameRepository {
  final Dio _dio;
  late final LiveopClient client;

  GameRepositoryImpl._()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://liveop.ohmyplay.com/rest/competition',
          connectTimeout: const Duration(milliseconds: 15000),
          receiveTimeout: const Duration(milliseconds: 10000),
        )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print(
            "Request[${options.method}] => PATH: ${options.path}, PARAM:${options.data}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print(
            "Response[${response.statusCode}] => PATH: ${response.requestOptions.path}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print(
            "Error[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
        print("Error message: ${e.message}");
        return handler.next(e);
      },
    ));
    client = LiveopClient(_dio);
  }
  static GameRepositoryImpl instance = GameRepositoryImpl._();

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> updateGameScore(
      ScoreParam scoreParam) async {
    return tryRequest(() async {
      final result = await client.updateGameScores(scoreParam.toJson());
      return result;
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> createGameScore(
      ScoresheetParam scoresheetParam) async {
    return tryRequest(() async {
      final result = await client.createGameScore(scoresheetParam.toJson());
      return result;
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> deleteGameScore(
      ScoreDeleteParam scoreDeleteParam) async {
    return tryRequest(() async {
      final result = await client.deleteGameScore(scoreDeleteParam.toJson());
      return result;
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> createGameSetting(
      GameSettingParam gameSettingParam) async {
    return tryRequest(() async {
      final result = await client.createGameSetting(gameSettingParam.toJson());
      return result;
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> shuttleCountPlus(
      ShuttleCountParam shuttleCountParam) async {
    return tryRequest(() async {
      final result = await client.shuttleCountPlus(shuttleCountParam.toJson());
      print(result);
      return result;
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> shuttleCountMinus(
      ShuttleCountParam shuttleCountParam) async {
    return tryRequest(() async {
      final result = await client.shuttleCountMinus(shuttleCountParam.toJson());
      print(result);
      return result;
    });
  }

  @override
  Future<SimpleResult<void, ApiError>> shuttleRequest(
      ShuttleCountParam shuttleCountParam) async {
    return tryRequest(() async {
      await client.shuttleRequest(shuttleCountParam.toJson());
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> shuttleDelete(
      ShuttleCountParam shuttleCountParam) async {
    return tryRequest(() async {
      final result = await client.shuttleDelete(shuttleCountParam.toJson());
      print(result);
      return result;
    });
  }

  @override
  Future<SimpleResult<ChallengeId, ApiError>> challengeRequest(
      ChallengeParam challengeParam) async {
    return tryRequest<ChallengeId>(() async {
      final result = await client.challengeRequest(challengeParam.toJson());
      if (result.header.returnCode == 0) {
        debugPrint("Request successful: $result");
        final challengeResult = result.body;
        final challengeId = ChallengeId.fromJson(challengeResult);
        return challengeId;
      } else {
        throw ApiError.createErrorResult(
            "Invalid return code: ${result.header.returnCode}");
      }
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> deleteGameChallenge(
      ChallengeResultParam challengeResultParam) async {
    return tryRequest(() async {
      final result =
          await client.deleteGameChallenge(challengeResultParam.toJson());
      var challengeResult;
      if (result.header.returnCode == 0) {
        challengeResult = ChallengeResultResponse.fromJson(result.body);
      }
      return challengeResult;
    });
  }

  @override
  Future<SimpleResult<ChallengeResultResponse, ApiError>>
      challengeResultRequest(ChallengeResultParam challengeResultParam) async {
    return tryRequest(() async {
      final result =
          await client.challengeResultRequest(challengeResultParam.toJson());
      var challengeResult;
      if (result.header.returnCode == 0) {
        challengeResult = ChallengeResultResponse.fromJson(result.body);
      }
      return challengeResult;
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> challengeResultEnroll(
      ChallengeResultEnrollParam challengeResultEnrollParam) async {
    return tryRequest(() async {
      final result = await client
          .challengeResultEnroll(challengeResultEnrollParam.toJson());
      return result;
    });
  }

  Future<SimpleResult<T, ApiError>> tryRequest<T>(
      Future<T> Function() apiLogic) async {
    try {
      final result = await apiLogic();
      return SimpleResult.success(result);
    } catch (e) {
      if (e is DioException) {
        debugPrint("Request failed with DioException: ${e.message}");
        return SimpleResult.failure(ApiError.createErrorResult(e));
      } else {
        debugPrint(
            "Request failed with unknown error: ${e.runtimeType} - ${e.toString()}");
        return SimpleResult.failure(ApiError.createErrorResult(e));
      }
    }
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> monitoringRequest(
      MonitoringCallParam monitoringCallParam) async {
    return tryRequest<LiveopResponse>(() async {
      final result =
          await client.monitoringRequest(monitoringCallParam.toJson());
      if (result.header.returnCode == 0) {
        debugPrint("Request successful: $result");
        return result;
      } else {
        throw ApiError.createErrorResult(
            "Invalid return code: ${result.header.returnCode}");
      }
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> gameStart(
      GameStartParam gameStartParam) async {
    return tryRequest<LiveopResponse>(() async {
      final result = await client.gameStart(gameStartParam.toJson());
      if (result.header.returnCode == 0) {
        debugPrint("Request successful: $result");
        return result;
      } else if (result.header.returnCode == 1) {
        return result;
      } else {
        throw ApiError.createErrorResult(
            "Invalid return code: ${result.header.returnCode}");
      }
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> gameEnd(
      GameEndParam gameEndParam) async {
    return tryRequest<LiveopResponse>(() async {
      final result = await client.gameEnd(gameEndParam.toJson());
      if (result.header.returnCode == 0) {
        debugPrint("Request successful: $result");
        return result;
      } else {
        throw ApiError.createErrorResult(
            "Invalid return code: ${result.header.returnCode}");
      }
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> gameEndOpponentRetired(
      GameEndParam gameEndParam) async {
    return tryRequest<LiveopResponse>(() async {
      final result = await client.gameEndOpponentRetired(gameEndParam.toJson());
      if (result.header.returnCode == 0) {
        debugPrint("Request successful: $result");
        return result;
      } else {
        throw ApiError.createErrorResult(
            "Invalid return code: ${result.header.returnCode}");
      }
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> listGameSettingScore(
      ScoreListParam scoreListParam) async {
    return tryRequest<LiveopResponse>(() async {
      final result = await client.listGameSettingScore(scoreListParam.toJson());
      if (result.header.returnCode == 0) {
        debugPrint("Request successful: $result");
        return result;
      } else {
        throw ApiError.createErrorResult("Invalid return code");
      }
    });
  }
}
