import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../domain/model/login_param.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/vo_gym_list.dart';
import '../models/vo_liveop_response.dart';
import '../models/vo_login_response.dart';
import '../models/vo_scoreboard_setting.dart';
import '../network/result/api_error.dart';
import '../remote/clients/liveop_client.dart';
import '../simple_result.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  late final LiveopClient client;

  AuthRepositoryImpl._()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://liveop.ohmyplay.com/rest/competition',
          connectTimeout: const Duration(milliseconds: 15000),
          receiveTimeout: const Duration(milliseconds: 10000),
        )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint(
            "Request[${options.method}] => PATH: ${options.path}, PARAM:${options.data}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint(
            "Response[${response.statusCode}] => PATH: ${response.requestOptions.path}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        debugPrint(
            "Error[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
        debugPrint("Error message: ${e.message}");
        return handler.next(e);
      },
    ));
    client = LiveopClient(_dio);
  }
  static AuthRepositoryImpl instance = AuthRepositoryImpl._();

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> tabletUseRequest(
      LoginParam loginParam) async {
    return tryRequest(() async {
      final result = await client.tabletUseRequest(loginParam.toJson());
      debugPrint("Request successful: $result");
      return result;
    });
  }

  @override
  Future<SimpleResult<LoginResponse, ApiError>> signIn(
      LoginParam loginParam) async {
    return tryRequest<LoginResponse>(() async {
      final result = await client.signIn(loginParam.toJson());
      if (result.header.returnCode == 0) {
        if (result.body['LoginInfo'] == null) {
          throw ApiError.createErrorResult("LoginInfo is null");
        }
        final loginInfo = result.body['LoginInfo'] as Map<String, dynamic>;
        final loginResponse = LoginResponse.fromJson(loginInfo);
        return loginResponse;
      } else {
        throw ApiError.createErrorResult(
            "Invalid return code: ${result.header.returnCode}");
      }
    });
  }

  @override
  Future<SimpleResult<ScoreboardSetting, ApiError>> scoreboardSetting(
      LoginParam loginParam) async {
    return tryRequest<ScoreboardSetting>(() async {
      final result = await client.scoreboardSetting(loginParam.toJson());
      if (result.header.returnCode == 0) {
        debugPrint("Request successful: $result");
        if (result.body['gymScoreboardSettingInfo'] == null) {
          throw ApiError.createErrorResult("gymScoreboardSettingInfo is null");
        }
        final scoreboardSettingInfo =
            result.body['gymScoreboardSettingInfo'] as Map<String, dynamic>;
        final scoreboardSettingResponse =
            ScoreboardSetting.fromJson(scoreboardSettingInfo);
        return scoreboardSettingResponse;
      } else {
        throw ApiError.createErrorResult(
            "Invalid return code: ${result.header.returnCode}");
      }
    });
  }

  @override
  Future<SimpleResult<GymList, ApiError>> recentGymList() async {
    return tryRequest(() async {
      final result = await client.recentGymList();
      if (result.header.returnCode == 0) {
        debugPrint("Request successful: $result");
        if (result.body['gymList'] == null) {
          throw ApiError.createErrorResult("gymList is null");
        }
        final gymList = result.body['gymList'];
        final gyms = GymList.fromJson(gymList);
        return gyms;
      } else {
        throw ApiError.createErrorResult(
            "Invalid return code: ${result.header.returnCode}");
      }
    });
  }

  Future<SimpleResult<T, ApiError>> tryRequest<T>(
      Future<T> Function() request) async {
    try {
      final result = await request();
      return SimpleResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return SimpleResult.failure(ApiError(
          message: e.error.toString(),
        ));
      } else {
        return SimpleResult.failure(ApiError(
          message: e.toString(),
        ));
      }
    }
  }
}
