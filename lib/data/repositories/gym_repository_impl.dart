import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../domain/repositories/gym_repository.dart';
import '../models/vo_court_list.dart';
import '../models/vo_court_param.dart';
import '../models/vo_default_param.dart';
import '../models/vo_liveop_response.dart';
import '../models/vo_refereeId.dart';
import '../models/vo_referee_enroll_param.dart';
import '../models/vo_referee_list.dart';
import '../models/vo_referee_param.dart';
import '../models/vo_reservation_list.dart';
import '../network/result/api_error.dart';
import '../remote/clients/liveop_client.dart';
import '../simple_result.dart';

class GymRepositoryImpl implements GymRepository {
  final Dio _dio;
  late final LiveopClient client;

  GymRepositoryImpl._()
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
  static GymRepositoryImpl instance = GymRepositoryImpl._();

  @override
  Future<SimpleResult<CourtList, ApiError>> getCourts(
      DefaultParam defaultParam) async {
    return tryRequest(() async {
      final result = await client.getCourts(defaultParam.toJson());
      if (result.header.returnCode == 0) {
        if (result.body['courtList'] == null) {
          throw ApiError.createErrorResult("courtList is null");
        }
        final courtList = result.body['courtList'];
        final courts = CourtList.fromJson(courtList);
        return courts;
      } else {
        throw ApiError.createErrorResult("Invalid return code");
      }
    });
  }

  @override
  Future<SimpleResult<ReservationList, ApiError>> getReservations(
      CourtParam courtParam) async {
    return tryRequest(() async {
      final result = await client.getReservations(courtParam.toJson());
      debugPrint("Request successful: $result");
      if (result.header.returnCode == 0) {
        if (result.body['reservationList'] == null) {
          throw ApiError.createErrorResult("reservationList is null");
        }
        final reservationList = result.body['reservationList'];
        final reservations = ReservationList.fromJson(reservationList);
        return reservations;
      } else {
        throw ApiError.createErrorResult("Invalid return code");
      }
    });
  }

  @override
  Future<SimpleResult<RefereeList, ApiError>> getReferees(
      DefaultParam defaultParam) async {
    return tryRequest(() async {
      final result = await client.getReferees(defaultParam.toJson());
      debugPrint("Request successful: $result");
      if (result.header.returnCode == 0) {
        if (result.body['refereeList'] == null) {
          throw ApiError.createErrorResult("refereeList is null");
        }
        final refereeList = result.body['refereeList'];
        final referees = RefereeList.fromJson(refereeList);
        return referees;
      } else {
        throw ApiError.createErrorResult("Invalid return code");
      }
    });
  }

  @override
  Future<SimpleResult<RefereeId, ApiError>> addReferee(
      RefereeParam refereeParam) async {
    return tryRequest(() async {
      final result = await client.addReferee(refereeParam.toJson());
      debugPrint("Request successful: $result");
      if (result.header.returnCode == 0) {
        final refereeId = result.body;
        final referee = RefereeId.fromJson(refereeId);
        return referee;
      } else {
        throw ApiError.createErrorResult("Invalid return code");
      }
    });
  }

  @override
  Future<SimpleResult<LiveopResponse, ApiError>> enrollReferees(
      RefereeEnrollParam refereeEnrollParam) async {
    return tryRequest(() async {
      final result = await client.enrollReferees(refereeEnrollParam.toJson());
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
}
