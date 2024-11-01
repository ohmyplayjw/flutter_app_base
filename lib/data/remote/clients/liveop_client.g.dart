// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liveop_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _LiveopClient implements LiveopClient {
  _LiveopClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://liveop.ohmyplay.com/rest/competition';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LiveopResponse> tabletUseRequest(loginInfo) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginInfo);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/tabletUseRequest',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> signIn(loginInfo) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginInfo);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/loginTab',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> scoreboardSetting(loginInfo) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginInfo);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/getBaseGymScoreboardSetting',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> getCourts(loginInfo) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginInfo);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/gameCompetitionAllView',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> getReservations(courtParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(courtParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/courtReservationInfo',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> getReferees(defaultParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(defaultParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/listGameReferee',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> addReferee(defaultParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(defaultParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/createGameReferee',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> enrollReferees(refereeEnrollParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(refereeEnrollParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/createGameRefereeReservation',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> updateGameScores(scoreParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(scoreParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/gameScoreBoard',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> createGameScore(scoresheetParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(scoresheetParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/createGameScore',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> deleteGameScore(scoreDeleteParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(scoreDeleteParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/deleteGameScore',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> createGameSetting(gameSettingParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(gameSettingParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/createGameSetting',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> shuttleRequest(shuttleCountParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(shuttleCountParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/shuttlecockRequest',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> shuttleDelete(shuttleCountParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(shuttleCountParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/shuttlecockDelete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> shuttleCountPlus(shuttleCountParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(shuttleCountParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/shuttlecockCountPlus',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> shuttleCountMinus(shuttleCountParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(shuttleCountParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/shuttlecockCountMinus',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> challengeRequest(challengeParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(challengeParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/createGameChallenge',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> deleteGameChallenge(challengeParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(challengeParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/deleteGameChallenge',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> challengeResultRequest(challengeResultParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(challengeResultParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/getGameChallengeResult',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> challengeResultEnroll(
      challengeResultEnrollParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(challengeResultEnrollParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/updateGameChallenge',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> monitoringRequest(monitoringRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(monitoringRequest);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/createGameManagerRequest',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> recentGymList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/gymListRecent',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> gameStart(gameStartParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(gameStartParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/gameStart',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> gameEnd(gameEndParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(gameEndParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/gameEnd',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> gameEndOpponentRetired(gameEndParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(gameEndParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/gameEndOpponentRetired',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LiveopResponse> listGameSettingScore(scoreListParam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(scoreListParam);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LiveopResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/listGameSettingScore',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LiveopResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
