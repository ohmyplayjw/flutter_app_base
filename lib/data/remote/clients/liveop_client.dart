import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/vo_liveop_response.dart';

part 'liveop_client.g.dart';

@RestApi(baseUrl: "https://liveop.ohmyplay.com/rest/competition")
abstract class LiveopClient {
  factory LiveopClient(Dio dio, {String baseUrl}) = _LiveopClient;

  @POST("/tabletUseRequest")
  Future<LiveopResponse> tabletUseRequest(
      @Body() Map<String, dynamic> loginInfo);

  @POST("/loginTab")
  Future<LiveopResponse> signIn(@Body() Map<String, dynamic> loginInfo);

  @POST("/getBaseGymScoreboardSetting")
  Future<LiveopResponse> scoreboardSetting(
      @Body() Map<String, dynamic> loginInfo);

  @POST("/gameCompetitionAllView")
  Future<LiveopResponse> getCourts(@Body() Map<String, dynamic> loginInfo);

  @POST("/courtReservationInfo")
  Future<LiveopResponse> getReservations(
      @Body() Map<String, dynamic> courtParam);

  @POST("/listGameReferee")
  Future<LiveopResponse> getReferees(@Body() Map<String, dynamic> defaultParam);

  @POST("/createGameReferee")
  Future<LiveopResponse> addReferee(@Body() Map<String, dynamic> defaultParam);

  @POST("/createGameRefereeReservation")
  Future<LiveopResponse> enrollReferees(
      @Body() Map<String, dynamic> refereeEnrollParam);

  @POST("/gameScoreBoard")
  Future<LiveopResponse> updateGameScores(
      @Body() Map<String, dynamic> scoreParam);

  @POST("/createGameScore")
  Future<LiveopResponse> createGameScore(
      @Body() Map<String, dynamic> scoresheetParam);

  @POST("/deleteGameScore")
  Future<LiveopResponse> deleteGameScore(
      @Body() Map<String, dynamic> scoreDeleteParam);

  @POST("/createGameSetting")
  Future<LiveopResponse> createGameSetting(
      @Body() Map<String, dynamic> gameSettingParam);

  @POST("/shuttlecockRequest")
  Future<LiveopResponse> shuttleRequest(
      @Body() Map<String, dynamic> shuttleCountParam);

  @POST("/shuttlecockDelete")
  Future<LiveopResponse> shuttleDelete(
      @Body() Map<String, dynamic> shuttleCountParam);
  @POST("/shuttlecockCountPlus")
  Future<LiveopResponse> shuttleCountPlus(
      @Body() Map<String, dynamic> shuttleCountParam);

  @POST("/shuttlecockCountMinus")
  Future<LiveopResponse> shuttleCountMinus(
      @Body() Map<String, dynamic> shuttleCountParam);

  @POST("/createGameChallenge")
  Future<LiveopResponse> challengeRequest(
      @Body() Map<String, dynamic> challengeParam);

  @POST("/deleteGameChallenge")
  Future<LiveopResponse> deleteGameChallenge(
      @Body() Map<String, dynamic> challengeParam);

  @POST("/getGameChallengeResult")
  Future<LiveopResponse> challengeResultRequest(
      @Body() Map<String, dynamic> challengeResultParam);

  @POST("/updateGameChallenge")
  Future<LiveopResponse> challengeResultEnroll(
      @Body() Map<String, dynamic> challengeResultEnrollParam);

  @POST("/createGameManagerRequest")
  Future<LiveopResponse> monitoringRequest(
      @Body() Map<String, dynamic> monitoringRequest);

  @POST("/gymListRecent")
  Future<LiveopResponse> recentGymList();

  @POST("/gameStart")
  Future<LiveopResponse> gameStart(@Body() Map<String, dynamic> gameStartParam);

  @POST("/gameEnd")
  Future<LiveopResponse> gameEnd(@Body() Map<String, dynamic> gameEndParam);

  @POST("/gameEndOpponentRetired")
  Future<LiveopResponse> gameEndOpponentRetired(
      @Body() Map<String, dynamic> gameEndParam);

  @POST("/listGameSettingScore")
  Future<LiveopResponse> listGameSettingScore(
      @Body() Map<String, dynamic> scoreListParam);
}
