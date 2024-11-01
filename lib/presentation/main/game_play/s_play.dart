import 'package:collection/collection.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/common/widget/w_tap.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_play/popup/w_challenge_request_popup.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_play/popup/w_setting_popup.dart';
import 'dart:async';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/s_court_entrance.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../common/widget/timer.dart';
import '../../../data/models/vo_game_setting_param.dart';
import '../../../data/models/vo_liveop_response.dart';
import '../../../data/models/vo_score_list_param.dart';
import '../../../data/models/vo_score_param.dart';
import '../../../data/models/vo_scoresheet_info.dart';
import '../../../data/models/vo_scoresheet_param.dart';
import '../../../data/models/vo_set_info.dart';
import '../../../data/network/result/api_error.dart';
import '../../../data/simple_result.dart';
import '../../../domain/model/enum_service_type.dart';
import '../../../domain/model/vo_player.dart';
import '../../controller/auth_controller.dart';
import '../../controller/game_controller.dart';
import '../game_ready/popup/w_time_popup.dart';
import '../game_ready/s_game_ready.dart';
import '../game_ready/s_position_setting.dart';
import '../login/s_login.dart';
import 'popup/w_play_end_popup.dart';
import 'vo/enum_service_direction.dart';
import 'vo/vo_team_score.dart';
import 'w_scoreboard_appbar.dart';
import 'widget/w_court.dart';
import 'widget/w_player_card.dart';
import 'widget/w_score_button.dart';
import 'widget/w_score_summary.dart';
import 'widget/w_scoresheet.dart';
import 'widget/w_undo_setting.dart';

Timer? _debounceTimer;

final announcementProvider = StateProvider((ref) => '');
final serviceDirectionProvider =
    StateProvider<ServiceDirection>((ref) => ServiceDirection.LRRR);
// 이전 점수 저장을 위한 Stack
final aTeamPlayer1ScoreGridProvider =
    StateProvider<List<String>>((ref) => List.filled(100, ''));
final aTeamPlayer2ScoreGridProvider =
    StateProvider<List<String>>((ref) => List.filled(100, ''));
final bTeamPlayer1ScoreGridProvider =
    StateProvider<List<String>>((ref) => List.filled(100, ''));
final bTeamPlayer2ScoreGridProvider =
    StateProvider<List<String>>((ref) => List.filled(100, ''));
final scoreSheetIndexProvider = Provider<int>((ref) {
  final aScore = ref.watch(aScoreProvider);
  final bScore = ref.watch(bScoreProvider);
  final misconductCnt = ref.watch(misconductCntProvider);
  return aScore + bScore + misconductCnt;
});
final serviceOrderProvider = StateProvider<List<String>>((ref) => []);
final scoreSumProvider = Provider<int>((ref) {
  final aScore = ref.watch(aScoreProvider);
  final bScore = ref.watch(bScoreProvider);
  return aScore + bScore;
});
final isEndPointProvider = StateProvider((ref) => false);
final aTeamAnnouncementProvider = StateProvider((ref) => '');
final bTeamAnnouncementProvider = StateProvider((ref) => '');
final serviceOverCntProvider = StateProvider((ref) => 0);
final serverIndex = StateProvider((ref) => 0);
final isIntervalProvider = StateProvider((ref) => false);
final isMatchEndedProvider = StateProvider((ref) => false);
final isGameEndedProvider = StateProvider((ref) => false);
final isPositionChangedProvider = StateProvider<bool>((ref) => false);
final isAteamPositionChangedProvider = StateProvider<bool>((ref) => false);
final isBteamPositionChangedProvider = StateProvider<bool>((ref) => false);
final setInfoProvider = StateProvider<List<SetInfo>?>((ref) => []);
final scoreListProvider = StateProvider<List<ScoresheetParam>?>((ref) => []);
void updateScoreSummary(ref, currentTeamScore, newScore, team) {
  final currentSet = ref.read(currentSetProvider);
  TeamScore updatedScore;
  switch (currentSet) {
    case 1:
      updatedScore = currentTeamScore.copyWith(set1Score: newScore);
      break;
    case 2:
      updatedScore = currentTeamScore.copyWith(set2Score: newScore);
      break;
    case 3:
      updatedScore = currentTeamScore.copyWith(set3Score: newScore);
      break;
    default:
      updatedScore = currentTeamScore;
  }
  if (team == "A") {
    ref.read(aTeamScoreProvider.notifier).state = updatedScore;
  } else {
    ref.read(bTeamScoreProvider.notifier).state = updatedScore;
  }
}

int? _lastUpdatedScore;
String? _lastUpdatedTeam;

void updateServiceDirection(ref, newScore, team) {
  //if (newScore == _lastUpdatedScore && team == _lastUpdatedTeam) return;
  _lastUpdatedScore = newScore;
  _lastUpdatedTeam = team;

  int serviceOverCnt = ref.watch(serviceOverCntProvider);
  final isPositionChanged = ref.watch(isPositionChangedProvider);
  final currentDirection = ref.watch(serviceDirectionProvider); //
  final gameType = ref.watch(gameTypeProvider);

  final setPoint = ref.read(scoreboardSettingProvider)!.setPoint;
  final intervalGiven = ref.watch(intervalGivenProvider);
  final intervalScore = (setPoint / 2).floor() + 1;
  final currentSet = ref.watch(currentSetProvider);
  final totalSet = ref.read(scoreboardSettingProvider)!.totalSet;
  if (team == "A") {
    if (isPositionChanged) {
      if (ServiceDirection.RLLL == currentDirection ||
          ServiceDirection.RRLR == currentDirection) {
        if (gameType == "D") {
          switchAteamPosition(ref);
        } else {
          //단식 연속득점일 경우 계속해서 자리 바꿔줌.
          switchAteamPosition(ref);
          switchBteamPosition(ref);
        }
        ref.read(aTeamAnnouncementProvider.notifier).state = "";
        ref.read(bTeamAnnouncementProvider.notifier).state = "";
      } else {
        ref.read(serviceOverCntProvider.notifier).state = serviceOverCnt + 1;
        ref.read(aTeamAnnouncementProvider.notifier).state = "Service Over";
        ref.read(bTeamAnnouncementProvider.notifier).state = "";
        if (gameType == 'S') {
          if (ref.watch(aScoreProvider) % 2 != 0) {
            if (ref.watch(bScoreProvider) % 2 == 0) {
              switchAteamPosition(ref);
              switchBteamPosition(ref);
            }
          } else {
            if (ref.watch(bScoreProvider) % 2 != 0) {
              switchAteamPosition(ref);
              switchBteamPosition(ref);
            }
          }
        }
      }
      if (newScore % 2 == 0) {
        ref.read(serviceDirectionProvider.notifier).state =
            ServiceDirection.RRLR;
      } else {
        ref.read(serviceDirectionProvider.notifier).state =
            ServiceDirection.RLLL;
      }
      if (totalSet == currentSet &&
          newScore == intervalScore &&
          !intervalGiven) {
        courtChange(ref);
        if (newScore % 2 == 0) {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.LRRR;
        } else {
          switchAteamPosition(ref);
          switchBteamPosition(ref);
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.LLRL;
        }
      }
    } else {
      if (ServiceDirection.LLRL == currentDirection ||
          ServiceDirection.LRRR == currentDirection) {
        //연속 득점일 경우
        // 선수 위치 변경 로직
        if (gameType == 'D') {
          switchAteamPosition(ref);
        } else {
          //단식 연속득점일 경우 계속해서 자리 바꿔줌.
          switchAteamPosition(ref);
          switchBteamPosition(ref);
        }
        ref.read(aTeamAnnouncementProvider.notifier).state = "";
        ref.read(bTeamAnnouncementProvider.notifier).state = "";
      } else {
        ref.read(aTeamAnnouncementProvider.notifier).state = "Service Over";
        ref.read(bTeamAnnouncementProvider.notifier).state = "";
        ref.read(serviceOverCntProvider.notifier).state = serviceOverCnt + 1;
        if (gameType == 'S') {
          if (ref.watch(aScoreProvider) % 2 != 0) {
            if (ref.watch(bScoreProvider) % 2 == 0) {
              switchAteamPosition(ref);
              switchBteamPosition(ref);
            }
          } else {
            if (ref.watch(bScoreProvider) % 2 != 0) {
              switchAteamPosition(ref);
              switchBteamPosition(ref);
            }
          }
        }
      }
      if (newScore % 2 == 0) {
        ref.read(serviceDirectionProvider.notifier).state =
            ServiceDirection.LRRR;
      } else {
        ref.read(serviceDirectionProvider.notifier).state =
            ServiceDirection.LLRL;
      }
      if (totalSet == currentSet &&
          newScore == intervalScore &&
          !intervalGiven) {
        courtChange(ref);
        if (newScore % 2 == 0) {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.RRLR;
        } else {
          switchAteamPosition(ref);
          switchBteamPosition(ref);
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.RLLL;
        }
      }
    }
  } else {
    //B팀
    if (isPositionChanged) {
      if (ServiceDirection.LLRL == currentDirection ||
          ServiceDirection.LRRR == currentDirection) {
        //연속 득점일 경우
        // 선수 위치 변경
        if (gameType == 'D') {
          switchBteamPosition(ref);
        } else {
          switchAteamPosition(ref);
          switchBteamPosition(ref);
        }
        ref.read(aTeamAnnouncementProvider.notifier).state = "";
        ref.read(bTeamAnnouncementProvider.notifier).state = "";
      } else {
        ref.read(serviceOverCntProvider.notifier).state = serviceOverCnt + 1;
        ref.read(aTeamAnnouncementProvider.notifier).state = "";
        ref.read(bTeamAnnouncementProvider.notifier).state = "Service Over";
        if (gameType == 'S') {
          if (ref.watch(aScoreProvider) % 2 != 0) {
            if (ref.watch(bScoreProvider) % 2 == 0) {
              switchAteamPosition(ref);
              switchBteamPosition(ref);
            }
          } else {
            if (ref.watch(bScoreProvider) % 2 != 0) {
              switchAteamPosition(ref);
              switchBteamPosition(ref);
            }
          }
        }
      }
      if (newScore % 2 == 0) {
        ref.read(serviceDirectionProvider.notifier).state =
            ServiceDirection.LRRR;
      } else {
        ref.read(serviceDirectionProvider.notifier).state =
            ServiceDirection.LLRL;
      }
      if (totalSet == currentSet &&
          newScore == intervalScore &&
          !intervalGiven) {
        courtChange(ref);
        if (newScore % 2 == 0) {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.RRLR;
        } else {
          switchAteamPosition(ref);
          switchBteamPosition(ref);
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.RLLL;
        }
      }
    } else {
      if (ServiceDirection.RLLL == currentDirection ||
          ServiceDirection.RRLR == currentDirection) {
        if (gameType == 'D') {
          switchBteamPosition(ref);
        } else {
          switchAteamPosition(ref);
          switchBteamPosition(ref);
        }
        ref.read(aTeamAnnouncementProvider.notifier).state = "";
        ref.read(bTeamAnnouncementProvider.notifier).state = "";
      } else {
        ref.read(serviceOverCntProvider.notifier).state =
            ref.watch(serviceOverCntProvider) + 1;
        ref.read(aTeamAnnouncementProvider.notifier).state = "";
        ref.read(bTeamAnnouncementProvider.notifier).state = "Service Over";
        if (gameType == 'S') {
          if (ref.watch(aScoreProvider) % 2 != 0) {
            if (ref.watch(bScoreProvider) % 2 == 0) {
              switchAteamPosition(ref);
              switchBteamPosition(ref);
            }
          } else {
            if (ref.watch(bScoreProvider) % 2 != 0) {
              switchAteamPosition(ref);
              switchBteamPosition(ref);
            }
          }
        }
      }
      if (newScore % 2 == 0) {
        ref.read(serviceDirectionProvider.notifier).state =
            ServiceDirection.RRLR;
      } else {
        ref.read(serviceDirectionProvider.notifier).state =
            ServiceDirection.RLLL;
      }
      if (totalSet == currentSet &&
          newScore == intervalScore &&
          !intervalGiven) {
        courtChange(ref);
        if (newScore % 2 == 0) {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.LRRR;
        } else {
          switchAteamPosition(ref);
          switchBteamPosition(ref);
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.LLRL;
        }
      }
    }
  }
}

void updateScoreGridForServiceOrder(WidgetRef ref, int serviceOverCnt,
    List<String> serviceOrder, int scoreSheetIndex, int newScore) {
  var scoreGrid = [''];
  late String serviceOrderPlayer;
  if (serviceOverCnt % 4 == 0) {
    serviceOrderPlayer = serviceOrder[0];
  } else if (serviceOverCnt % 4 == 1) {
    serviceOrderPlayer = serviceOrder[1];
  } else if (serviceOverCnt % 4 == 2) {
    serviceOrderPlayer = serviceOrder[2];
  } else {
    serviceOrderPlayer = serviceOrder[3];
  }
  scoreGrid = _getScoreGridByServiceOrder(ref, serviceOrderPlayer);

  scoreGrid[scoreSheetIndex] = newScore.toString();
  _updateScoreGridProvider(ref, serviceOrderPlayer, scoreGrid);
}

Future<SimpleResult<LiveopResponse, ApiError>?> createGameSetting(
    WidgetRef ref, String sPlayer, String rPlayer, int i) async {
  late int serverUserId;
  late int receiverUserId;
  if (sPlayer == "A1") {
    serverUserId = ref.read(aTeamPlayer1ForScoreSheetProvider)!.userId;
  } else if (sPlayer == "A2") {
    serverUserId = ref.read(aTeamPlayer2ForScoreSheetProvider)!.userId;
  } else if (sPlayer == "B1") {
    serverUserId = ref.read(bTeamPlayer1ForScoreSheetProvider)!.userId;
  } else if (sPlayer == "B2") {
    serverUserId = ref.read(bTeamPlayer2ForScoreSheetProvider)!.userId;
  }
  if (rPlayer == "A1") {
    receiverUserId = ref.read(aTeamPlayer1ForScoreSheetProvider)!.userId;
  } else if (rPlayer == "A2") {
    receiverUserId = ref.read(aTeamPlayer2ForScoreSheetProvider)!.userId;
  } else if (rPlayer == "B1") {
    receiverUserId = ref.read(bTeamPlayer1ForScoreSheetProvider)!.userId;
  } else if (rPlayer == "B2") {
    receiverUserId = ref.read(bTeamPlayer2ForScoreSheetProvider)!.userId;
  }
  try {
    late String rightParticipantId;
    late String leftParticipantId;
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    final setNum = ref.read(currentSetProvider);
    final positionChanged = ref.read(isPositionChangedProvider);
    if (positionChanged) {
      rightParticipantId =
          ref.read(aTeamPlayer1ForScoreSheetProvider)!.participantId;
      leftParticipantId =
          ref.read(bTeamPlayer1ForScoreSheetProvider)!.participantId;
    } else {
      rightParticipantId =
          ref.read(bTeamPlayer1ForScoreSheetProvider)!.participantId;
      leftParticipantId =
          ref.read(aTeamPlayer1ForScoreSheetProvider)!.participantId;
    }
    //if (defaultParam != null && reservation != null) {
    final gameSettingParam = GameSettingParam(
      gymId: defaultParam!.gymId,
      macAddress: defaultParam.macAddress,
      loginKey: defaultParam.loginKey,
      reservationNum: reservation!.reservationNum,
      setNum: setNum,
      rightParticipantId: rightParticipantId,
      leftParticipantId: leftParticipantId,
      serverUserId: serverUserId.toString(),
      receiveUserId: receiverUserId.toString(),
    );
    final result = await gameUseCase.createGameSetting(gameSettingParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}

Future<SimpleResult<LiveopResponse, ApiError>?> createGameScore(
    WidgetRef ref, int newScore) async {
  final scoreSheetIndex = ref.watch(scoreSheetIndexProvider);
  int serviceOverCnt = ref.watch(serviceOverCntProvider);
  final gameType = ref.watch(gameTypeProvider);
  Map<String, Service?> players = {
    "A1": ref.watch(aTeamPlayer1InitServiceProvider),
    "A2": ref.watch(aTeamPlayer2InitServiceProvider),
    "B1": ref.watch(bTeamPlayer1InitServiceProvider),
    "B2": ref.watch(bTeamPlayer2InitServiceProvider)
  };
  final String sPlayer =
      players.entries.firstWhere((entry) => entry.value == Service.S).key;
  final String rPlayer =
      players.entries.firstWhere((entry) => entry.value == Service.R).key;
  var serviceOrder = [
    sPlayer,
    rPlayer == "B1"
        ? "B2"
        : rPlayer == "B2"
            ? "B1"
            : rPlayer == "A1"
                ? "A2"
                : "A1",
    sPlayer == "B1"
        ? "B2"
        : sPlayer == "B2"
            ? "B1"
            : sPlayer == "A1"
                ? "A2"
                : "A1",
    rPlayer
  ];
  final isEmptyList =
      ListEquality().equals(ref.watch(serviceOrderProvider), []);
  if (isEmptyList) {
    ref.read(serviceOrderProvider.notifier).state = serviceOrder;
  } else {
    if (serviceOrder != ref.watch(serviceOrderProvider)) {
      serviceOrder = ref.watch(serviceOrderProvider);
    }
  }
  late int userId;
  late String participantId;
  late String serviceOrderPlayer;
  if (gameType == "D") {
    if (serviceOverCnt % 4 == 0) {
      serviceOrderPlayer = serviceOrder[0];
    } else if (serviceOverCnt % 4 == 1) {
      serviceOrderPlayer = serviceOrder[1];
    } else if (serviceOverCnt % 4 == 2) {
      serviceOrderPlayer = serviceOrder[2];
    } else {
      serviceOrderPlayer = serviceOrder[3];
    }
  } else {
    if (serviceOverCnt % 2 == 0) {
      serviceOrderPlayer = sPlayer;
    } else if (serviceOverCnt % 2 == 1) {
      serviceOrderPlayer = rPlayer;
    }
  }
  if (serviceOrderPlayer == "A1") {
    userId = ref.watch(aTeamPlayer1ForScoreSheetProvider)!.userId;
    participantId = ref.watch(aTeamPlayer1ForScoreSheetProvider)!.participantId;
  } else if (serviceOrderPlayer == "A2") {
    userId = ref.watch(aTeamPlayer2ForScoreSheetProvider)!.userId;
    participantId = ref.watch(aTeamPlayer2ForScoreSheetProvider)!.participantId;
  } else if (serviceOrderPlayer == "B1") {
    userId = ref.watch(bTeamPlayer1ForScoreSheetProvider)!.userId;
    participantId = ref.watch(bTeamPlayer1ForScoreSheetProvider)!.participantId;
  } else if (serviceOrderPlayer == "B2") {
    userId = ref.watch(bTeamPlayer2ForScoreSheetProvider)!.userId;
    participantId = ref.watch(bTeamPlayer2ForScoreSheetProvider)!.participantId;
  }
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.watch(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    final setNum = ref.watch(currentSetProvider);
    int serviceOverCnt = ref.watch(serviceOverCntProvider);
    final positionChanged = ref.watch(isPositionChangedProvider);
    final aTeamPositionChanged = ref.watch(isAteamPositionChangedProvider);
    final bTeamPositionChanged = ref.watch(isBteamPositionChangedProvider);

    //if (defaultParam != null && reservation != null) {
    final scoresheetParam = ScoresheetParam(
        gymId: defaultParam!.gymId,
        macAddress: defaultParam.macAddress,
        loginKey: defaultParam.loginKey,
        reservationNum: reservation!.reservationNum,
        setNum: setNum,
        rallyNum: scoreSheetIndex + 2,
        service: serviceOverCnt,
        teamPosition: positionChanged ? 1 : 0,
        teamAPosition: aTeamPositionChanged ? 1 : 0,
        teamBPosition: bTeamPositionChanged ? 1 : 0,
        participantId: int.parse(participantId),
        userId: userId,
        winnerUserId: userId,
        scoreType: 0,
        scoreValue: newScore);
    final result = await gameUseCase.createGameScore(scoresheetParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}

Future<SimpleResult<LiveopResponse, ApiError>?> createGameScoreforMisconduct(
    WidgetRef ref,
    int playerIndex,
    int scoreSheetIndex,
    String misconductType) async {
  late int userId;
  late String participantId;
  late int scoreType;
  if (playerIndex == 0) {
    userId = ref.read(aTeamPlayer1ForScoreSheetProvider)!.userId;
    participantId = ref.read(aTeamPlayer1ForScoreSheetProvider)!.participantId;
  } else if (playerIndex == 1) {
    userId = ref.read(aTeamPlayer2ForScoreSheetProvider)!.userId;
    participantId = ref.read(aTeamPlayer2ForScoreSheetProvider)!.participantId;
  } else if (playerIndex == 2) {
    userId = ref.read(bTeamPlayer1ForScoreSheetProvider)!.userId;
    participantId = ref.read(bTeamPlayer1ForScoreSheetProvider)!.participantId;
  } else if (playerIndex == 3) {
    userId = ref.read(bTeamPlayer2ForScoreSheetProvider)!.userId;
    participantId = ref.read(bTeamPlayer2ForScoreSheetProvider)!.participantId;
  }
  if (misconductType == "warning") {
    scoreType = 1;
  } else if (misconductType == "courtError") {
    scoreType = 5;
  } else if (misconductType == "retired") {
    scoreType = 8;
  } else if (misconductType == "referee") {
    scoreType = 3;
  } else if (misconductType == "suspension") {
    scoreType = 4;
  } else if (misconductType == "CW") {
    scoreType = 9;
  } else if (misconductType == "CL") {
    scoreType = 10;
  } else if (misconductType == "ND") {
    scoreType = 11;
  } else if (misconductType == "fault") {
    scoreType = 2;
  } else if (misconductType == "injury") {
    scoreType = 6;
  } else if (misconductType == "disqualified") {
    scoreType = 7;
  }
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    final setNum = ref.read(currentSetProvider);
    int serviceOverCnt = ref.watch(serviceOverCntProvider);
    final positionChanged = ref.read(isPositionChangedProvider);
    final aTeamPositionChanged = ref.read(isAteamPositionChangedProvider);
    final bTeamPositionChanged = ref.read(isBteamPositionChangedProvider);
    final scoresheetParam = ScoresheetParam(
        gymId: defaultParam!.gymId,
        macAddress: defaultParam.macAddress,
        loginKey: defaultParam.loginKey,
        reservationNum: reservation!.reservationNum,
        setNum: setNum,
        rallyNum: scoreSheetIndex + 3,
        service: serviceOverCnt,
        teamPosition: positionChanged ? 1 : 0,
        teamAPosition: aTeamPositionChanged ? 1 : 0,
        teamBPosition: bTeamPositionChanged ? 1 : 0,
        participantId: int.parse(participantId),
        userId: userId,
        winnerUserId: userId,
        scoreType: scoreType,
        scoreValue: 0);
    final result = await gameUseCase.createGameScore(scoresheetParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}

List<String> _getScoreGridByServiceOrder(WidgetRef ref, String player) {
  if (player == 'A1') {
    return ref.read(aTeamPlayer1ScoreGridProvider).toList();
  } else if (player == 'A2') {
    return ref.read(aTeamPlayer2ScoreGridProvider).toList();
  } else if (player == 'B1') {
    return ref.read(bTeamPlayer1ScoreGridProvider).toList();
  } else if (player == 'B2') {
    return ref.read(bTeamPlayer2ScoreGridProvider).toList();
  }
  return List<String>.filled(100, '');
}

void _updateScoreGridProvider(
    WidgetRef ref, String player, List<String> scoreGrid) {
  if (player == 'A1') {
    ref.read(aTeamPlayer1ScoreGridProvider.notifier).state = scoreGrid;
  } else if (player == 'A2') {
    ref.read(aTeamPlayer2ScoreGridProvider.notifier).state = scoreGrid;
  } else if (player == 'B1') {
    ref.read(bTeamPlayer1ScoreGridProvider.notifier).state = scoreGrid;
  } else if (player == 'B2') {
    ref.read(bTeamPlayer2ScoreGridProvider.notifier).state = scoreGrid;
  }
}

void updateMisconductGrid(WidgetRef ref, String type, int userId) {
  final scoreSheetIndex = ref.watch(scoreSheetIndexProvider);
  final playersForScoresheet = [
    ref.read(aTeamPlayer1ForScoreSheetProvider),
    ref.read(aTeamPlayer2ForScoreSheetProvider),
    ref.read(bTeamPlayer1ForScoreSheetProvider),
    ref.read(bTeamPlayer2ForScoreSheetProvider),
  ];
  String misconductSymbol = _getMisconductSymbol(type);

  // 해당 선수의 ScoreGrid 찾기
  var (scoreGrid, playerIndex) =
      _findPlayerScoreGrid(ref, userId, playersForScoresheet);

  // Misconduct 기록
  scoreGrid[scoreSheetIndex] = misconductSymbol;
  _updatePlayerScoreGrid(ref, playerIndex, scoreGrid);

  if (misconductSymbol == 'F' || misconductSymbol == 'I') {
    var (partnerScoreGrid, partnerPlayerIndex) =
        _findPartnerPlayerScoreGrid(ref, userId, playersForScoresheet);
    partnerScoreGrid[scoreSheetIndex] = 'R';
    _updatePlayerScoreGrid(ref, partnerPlayerIndex, partnerScoreGrid);
  }
  // Misconduct 카운트 증가 및 카드 상태 업데이트
  ref.read(misconductCntProvider.notifier).state =
      ref.watch(misconductCntProvider) + 1;
  updatePlayerCardStatus(ref, type, userId);
  createGameScoreforMisconduct(ref, playerIndex, scoreSheetIndex, type);
  // fault 타입일 경우 점수 증가 처리
  if (type == 'fault') {
    // 상대팀 점수 증가
    // misconductCnt를 임시로 감소시켜 scoreSheetIndex가 변경되지 않게 함
    ref.read(misconductCntProvider.notifier).state =
        ref.watch(misconductCntProvider) - 1;
    if (playerIndex < 2) {
      getScore(ref, "B");
    } else {
      getScore(ref, "A");
    }
    // misconductCnt를 다시 원래대로 복구
    ref.read(misconductCntProvider.notifier).state =
        ref.watch(misconductCntProvider) + 1;
  }
}

String _getMisconductSymbol(String type) {
  switch (type) {
    case "warning":
      return "W";
    case "fault":
      return "F";
    case "disqualified":
      return "Dis";
    case "injury":
      return "I";
    case "injury-only":
      return "Ⅰ";
    case "referee":
      return "R";
    case "CW":
      return "CW";
    case "CL":
      return "CL";
    case "CN":
      return "CN";
    case "retired":
      return "Ret";
    case "suspension":
      return "S";
    case "courtError":
      return "C";
    default:
      return "";
  }
}

(List<String>, int) _findPlayerScoreGrid(
    WidgetRef ref, int userId, List<Player?> players) {
  if (userId == 0) {
    var scoreGrid = _getPlayerScoreGrid(ref, 1);
    return (scoreGrid, 1);
  }
  for (int i = 0; i < players.length; i++) {
    if (players[i]?.userId == userId) {
      var scoreGrid = _getPlayerScoreGrid(ref, i);
      return (scoreGrid, i);
    }
  }
  throw Exception("Player not found");
}

(List<String>, int) _findPartnerPlayerScoreGrid(
    WidgetRef ref, int userId, List<Player?> players) {
  for (int i = 0; i < players.length; i++) {
    if (players[i]?.userId == userId) {
      var scoreGrid;
      if (i == 0) {
        i = 1;
        scoreGrid = _getPlayerScoreGrid(ref, i);
      } else if (i == 1) {
        i = 0;
        scoreGrid = _getPlayerScoreGrid(ref, i);
      } else if (i == 2) {
        i = 3;
        scoreGrid = _getPlayerScoreGrid(ref, i);
      } else {
        i = 2;
        scoreGrid = _getPlayerScoreGrid(ref, i);
      }
      return (scoreGrid, i);
    }
  }
  throw Exception("Partner Player not found");
}

List<String> _getPlayerScoreGrid(WidgetRef ref, int playerIndex) {
  switch (playerIndex) {
    case 0:
      return ref.read(aTeamPlayer1ScoreGridProvider).toList();
    case 1:
      return ref.read(aTeamPlayer2ScoreGridProvider).toList();
    case 2:
      return ref.read(bTeamPlayer1ScoreGridProvider).toList();
    case 3:
      return ref.read(bTeamPlayer2ScoreGridProvider).toList();
    default:
      throw Exception("Invalid player index");
  }
}

void _updatePlayerScoreGrid(
    WidgetRef ref, int playerIndex, List<String> scoreGrid) {
  switch (playerIndex) {
    case 0:
      ref.read(aTeamPlayer1ScoreGridProvider.notifier).state = scoreGrid;
    case 1:
      ref.read(aTeamPlayer2ScoreGridProvider.notifier).state = scoreGrid;
    case 2:
      ref.read(bTeamPlayer1ScoreGridProvider.notifier).state = scoreGrid;
    case 3:
      ref.read(bTeamPlayer2ScoreGridProvider.notifier).state = scoreGrid;
  }
}

void updatePlayerCardStatus(WidgetRef ref, String type, int userId) {
  final aTeamPlayer1 = ref.watch(aTeamPlayer1Provider);
  final aTeamPlayer2 = ref.watch(aTeamPlayer2Provider);
  final bTeamPlayer1 = ref.watch(bTeamPlayer1Provider);
  final bTeamPlayer2 = ref.watch(bTeamPlayer2Provider);

  void updateCardStatus(
      StateProvider<PlayerCard?> provider, PlayerCard? player) {
    if (player == null) return;

    if (type == 'fault') {
      ref.read(provider.notifier).state = player.copyWith(redCard: true);
    } else if (type == 'warning') {
      ref.read(provider.notifier).state = player.copyWith(yellowCard: true);
    } else if (type == 'disqualified') {
      ref.read(provider.notifier).state = player.copyWith(blackCard: true);
    } else if (type == 'fault-cancel') {
      ref.read(provider.notifier).state = player.copyWith(redCard: false);
    } else if (type == 'warning-cancel') {
      ref.read(provider.notifier).state = player.copyWith(yellowCard: false);
    } else if (type == 'disqualified-cancel') {
      ref.read(provider.notifier).state = player.copyWith(blackCard: false);
    }
  }

  if (aTeamPlayer1?.userId == userId) {
    updateCardStatus(aTeamPlayer1Provider, aTeamPlayer1);
  } else if (aTeamPlayer2?.userId == userId) {
    updateCardStatus(aTeamPlayer2Provider, aTeamPlayer2);
  } else if (bTeamPlayer1?.userId == userId) {
    updateCardStatus(bTeamPlayer1Provider, bTeamPlayer1);
  } else if (bTeamPlayer2?.userId == userId) {
    updateCardStatus(bTeamPlayer2Provider, bTeamPlayer2);
  }
}

void updateScoreGird(WidgetRef ref, int newScore, String team) {
  var scoreGrid = [''];
  final gameType = ref.watch(gameTypeProvider);
  final scoreSheetIndex = ref.watch(scoreSheetIndexProvider) - 1;
  int serviceOverCnt = ref.watch(serviceOverCntProvider);
  Map<String, Service?> players = {
    "A1": ref.watch(aTeamPlayer1InitServiceProvider),
    "A2": ref.watch(aTeamPlayer2InitServiceProvider),
    "B1": ref.watch(bTeamPlayer1InitServiceProvider),
    "B2": ref.watch(bTeamPlayer2InitServiceProvider)
  };
  final String sPlayer =
      players.entries.firstWhere((entry) => entry.value == Service.S).key;
  final String rPlayer =
      players.entries.firstWhere((entry) => entry.value == Service.R).key;
  var serviceOrder = [
    sPlayer,
    rPlayer == "B1"
        ? "B2"
        : rPlayer == "B2"
            ? "B1"
            : rPlayer == "A1"
                ? "A2"
                : "A1",
    sPlayer == "B1"
        ? "B2"
        : sPlayer == "B2"
            ? "B1"
            : sPlayer == "A1"
                ? "A2"
                : "A1",
    rPlayer
  ];
  final isEmptyList =
      ListEquality().equals(ref.watch(serviceOrderProvider), []);
  if (isEmptyList) {
    ref.read(serviceOrderProvider.notifier).state = serviceOrder;
  } else {
    if (serviceOrder != ref.watch(serviceOrderProvider)) {
      serviceOrder = ref.watch(serviceOrderProvider);
    }
  }
  if (scoreSheetIndex == 0) {
    createGameSetting(ref, sPlayer, rPlayer, 0); // 서비스, 리시버 표시
  }
  if (gameType == 'S') {
    if (team == 'A') {
      scoreGrid = ref.read(aTeamPlayer1ScoreGridProvider).toList();
      scoreGrid[scoreSheetIndex] = newScore.toString();
      ref.read(aTeamPlayer1ScoreGridProvider.notifier).state = scoreGrid;
    } else {
      scoreGrid = ref.read(bTeamPlayer1ScoreGridProvider).toList();
      scoreGrid[scoreSheetIndex] = newScore.toString();
      ref.read(bTeamPlayer1ScoreGridProvider.notifier).state = scoreGrid;
    }
  } else {
    updateScoreGridForServiceOrder(
        ref, serviceOverCnt, serviceOrder, scoreSheetIndex, newScore);
  }
}

int? _lastAteamScore;
int? _lastBteamScore;
int? _lastSetNum;

void updateScore(WidgetRef ref, BuildContext context) {
  //점수에 따른 처리 설정
  final aScore = ref.read(aScoreProvider);
  final bScore = ref.read(bScoreProvider);
  final currentSet = ref.watch(currentSetProvider);
  // 이전 상태와 비교하여 이미 처리된 상태인 경우 함수 종료
  if (_lastAteamScore == aScore &&
      _lastBteamScore == bScore &&
      _lastSetNum == currentSet) {
    return;
  }
  final maxPoint = ref.read(scoreboardSettingProvider)!.maxPoint;
  final setPoint = ref.read(scoreboardSettingProvider)!.setPoint;
  final totalSet = ref.read(scoreboardSettingProvider)!.totalSet;
  final courtNum = ref.read(reservationProvider)!.courtId;
  // 상태 업데이트
  _lastAteamScore = aScore;
  _lastBteamScore = bScore;
  _lastSetNum = currentSet;
  // 점수 처리, 특정 점수에 도달했을 때
  final lastSetScore = (totalSet / 2).floor();
  final intervalScore = (setPoint / 2).floor() + 1;
  final aSetScore = ref.watch(aTeamScoreProvider).setScore;
  final bSetScore = ref.watch(bTeamScoreProvider).setScore;
  final givenInterval = ref.watch(intervalGivenProvider);
  final isEndPoint = ref.watch(isEndPointProvider);
  updateGameScore(ref, aScore, bScore, false, currentSet);
  if (aScore == maxPoint || bScore == maxPoint) {
    if (aScore > bScore && aSetScore == lastSetScore ||
        bScore > aScore && bSetScore == lastSetScore) {
      ref.read(isMatchEndedProvider.notifier).state = true;
      showEndPopup(context, ref, 'MATCH', null);
    } else {
      ref.read(isGameEndedProvider.notifier).state = true;
      showEndPopup(context, ref, 'GAME', null);
    }
  } else {
    if (aScore == setPoint - 1) {
      if (!isEndPoint) {
        if (aSetScore == lastSetScore) {
          ref.read(bTeamAnnouncementProvider.notifier).state = "";
          ref.read(aTeamAnnouncementProvider.notifier).state = "Match Point";
        } else {
          ref.read(bTeamAnnouncementProvider.notifier).state = "";
          ref.read(aTeamAnnouncementProvider.notifier).state = "Game Point";
        }
        ref.read(isEndPointProvider.notifier).state = true;
      }
    } else if (bScore == setPoint - 1) {
      if (!isEndPoint) {
        if (bSetScore == lastSetScore) {
          ref.read(aTeamAnnouncementProvider.notifier).state = "";
          ref.read(bTeamAnnouncementProvider.notifier).state = "Match Point";
        } else {
          ref.read(aTeamAnnouncementProvider.notifier).state = "";
          ref.read(bTeamAnnouncementProvider.notifier).state = "Game Point";
        }
        ref.read(isEndPointProvider.notifier).state = true;
      }
    } else if (aScore == maxPoint - 1) {
      if (aSetScore == lastSetScore) {
        ref.read(aTeamAnnouncementProvider.notifier).state = "Match Point";
        ref.read(bTeamAnnouncementProvider.notifier).state = "";
      } else {
        ref.read(aTeamAnnouncementProvider.notifier).state = "Game Point";
        ref.read(bTeamAnnouncementProvider.notifier).state = "";
      }
    } else if (bScore == maxPoint - 1) {
      if (bSetScore == lastSetScore) {
        ref.read(bTeamAnnouncementProvider.notifier).state = "Match Point";
        ref.read(aTeamAnnouncementProvider.notifier).state = "";
      } else {
        ref.read(bTeamAnnouncementProvider.notifier).state = "Game Point";
        ref.read(aTeamAnnouncementProvider.notifier).state = "";
      }
    }
    if (aScore >= setPoint || bScore >= setPoint) {
      // 2점 차 이상인 경우 경기 종료
      if ((aScore - bScore).abs() >= 2) {
        // 경기 종료
        if (aScore > bScore && aSetScore == lastSetScore ||
            bScore > aScore && bSetScore == lastSetScore) {
          showEndPopup(context, ref, 'MATCH', null);
          ref.read(isMatchEndedProvider.notifier).state = true;
        } else {
          showEndPopup(context, ref, 'GAME', null);
          ref.read(isGameEndedProvider.notifier).state = true;
        }
      }
    } else if (aScore == intervalScore || bScore == intervalScore) {
      // 가운데 포인트 넘겼을 때 (11점 넘겼을 때), INTERVAL 팝업 화면
      ref.read(intervalGivenProvider.notifier).state = true;
      if (!givenInterval) {
        // 인터벌 팝업 표시
        showIntervalPopup(context, ref, courtNum, 60);
      }
    }
  }
}

void showIntervalPopup(
    BuildContext context, WidgetRef ref, courtNum, int time) {
  if (context.mounted) {
    showWTimePopup(context, time, () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(isIntervalProvider.notifier).state = false;
      });
    }, 'INTERVAL', courtNum);
  }
}

void showEndPopup(
    BuildContext context, WidgetRef ref, String type, int? lostUseId) {
  if (context.mounted) {
    final currentPage = ref.watch(currentPageProvider);
    if (currentPage == 'play') {
      showPlayEndPopup(context, () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(isIntervalProvider.notifier).state = false;
        });
      }, type, lostUseId);
    }
  }
}

class PlayScreen extends ConsumerStatefulWidget {
  const PlayScreen({super.key});
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends ConsumerState<PlayScreen> {
  late ElapsedTimeNotifier _elapsedTimeNotifier;
  @override
  void initState() {
    super.initState();
    _elapsedTimeNotifier = ref.read(elapsedTimeProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initValues();
    });
  }

  @override
  void dispose() {
    _elapsedTimeNotifier.stopTimer();
    super.dispose();
  }

  void initValues() async {
    ref.read(currentPageProvider.notifier).state = 'play';
    final isPlayedBefore = ref.watch(isPlayedBeforeProvider);
    final currentSet = ref.watch(currentSetProvider);
    if (isPlayedBefore) {
      ref.read(isPlayedBeforeProvider.notifier).state = false;
      ref.read(aScoreProvider.notifier).state = 0;
      ref.read(bScoreProvider.notifier).state = 0;
      ref.read(serviceOverCntProvider.notifier).state = 0;
      ref.read(misconductCntProvider.notifier).state = 0;
      ref.read(aTeamPlayer1ScoreGridProvider.notifier).state =
          List.filled(100, '');
      ref.read(aTeamPlayer2ScoreGridProvider.notifier).state =
          List.filled(100, '');
      ref.read(bTeamPlayer1ScoreGridProvider.notifier).state =
          List.filled(100, '');
      ref.read(bTeamPlayer2ScoreGridProvider.notifier).state =
          List.filled(100, '');
      final scoreSettingInfo = await listGameSettingScore(ref);
      if (scoreSettingInfo != null) {
        try {
          if (scoreSettingInfo.isSuccess) {
            if (scoreSettingInfo.successData.body.isNotEmpty) {
              final currentSet = scoreSettingInfo
                  .successData.body["settingInfo"]["setInfo"].length;
              ref.read(currentSetProvider.notifier).state = currentSet;
              final setInfoJson =
                  scoreSettingInfo.successData.body["settingInfo"]["setInfo"]
                      [currentSet - 1] as Map<String, dynamic>;
              final SetInfo setInfoData = SetInfo.fromJson(setInfoJson);
              final aTeamPlayer1 = ref.read(aTeamPlayer1ForScoreSheetProvider);
              final bTeamPlayer1 = ref.read(bTeamPlayer1ForScoreSheetProvider);
              final aTeamPlayer2 = ref.read(aTeamPlayer2ForScoreSheetProvider);
              final bTeamPlayer2 = ref.read(bTeamPlayer2ForScoreSheetProvider);
              final isPositionChanged = ref.watch(isPositionChangedProvider);
              final aTeamScore = ref.read(aTeamScoreProvider);
              final bTeamScore = ref.read(bTeamScoreProvider);
              final setPoint = ref.read(scoreboardSettingProvider)!.setPoint;
              final intervalScore = (setPoint / 2).floor() + 1;
              var server = "";
              ref.read(gameTypeProvider.notifier).state = setInfoData.gameType;
              if (aTeamPlayer1!.participantId ==
                      setInfoData.rightParticipantId &&
                  bTeamPlayer1!.participantId ==
                      setInfoData.leftParticipantId) {
                courtChange(ref);
                ref.read(isPositionChangedProvider.notifier).state = true;
              } else {
                ref.read(isPositionChangedProvider.notifier).state = false;
              }

              if (setInfoData.serverUserId == aTeamPlayer1.userId.toString()) {
                ref.read(aTeamPlayer1InitServiceProvider.notifier).state =
                    Service.S;
                server = "A";
                if (setInfoData.gameType == "D") {
                  if (!isPositionChanged) {
                    switchAteamPosition(ref);
                  }
                }
              } else if (setInfoData.serverUserId ==
                  aTeamPlayer2!.userId.toString()) {
                ref.read(aTeamPlayer2InitServiceProvider.notifier).state =
                    Service.S;
                server = "A";
                if (setInfoData.gameType == "D") {
                  if (isPositionChanged) {
                    switchBteamPosition(ref);
                  }
                }
              } else if (setInfoData.serverUserId ==
                  bTeamPlayer1!.userId.toString()) {
                ref.read(bTeamPlayer1InitServiceProvider.notifier).state =
                    Service.S;
                server = "B";
                if (setInfoData.gameType == "D") {
                  if (isPositionChanged) {
                    switchAteamPosition(ref);
                  }
                }
              } else if (setInfoData.serverUserId ==
                  bTeamPlayer2!.userId.toString()) {
                ref.read(bTeamPlayer2InitServiceProvider.notifier).state =
                    Service.S;
                server = "B";
                if (setInfoData.gameType == "D") {
                  if (!isPositionChanged) {
                    switchBteamPosition(ref);
                  }
                }
              }

              if (setInfoData.receiveUserId == aTeamPlayer1.userId.toString()) {
                ref.read(aTeamPlayer1InitServiceProvider.notifier).state =
                    Service.R;
                if (setInfoData.gameType == "D") {
                  if (!isPositionChanged) {
                    switchAteamPosition(ref);
                  }
                }
              } else if (setInfoData.receiveUserId ==
                  aTeamPlayer2!.userId.toString()) {
                ref.read(aTeamPlayer2InitServiceProvider.notifier).state =
                    Service.R;
                if (setInfoData.gameType == "D") {
                  if (isPositionChanged) {
                    switchBteamPosition(ref);
                  }
                }
              } else if (setInfoData.receiveUserId ==
                  bTeamPlayer1!.userId.toString()) {
                ref.read(bTeamPlayer1InitServiceProvider.notifier).state =
                    Service.R;
                if (setInfoData.gameType == "D") {
                  if (isPositionChanged) {
                    switchBteamPosition(ref);
                  }
                }
              } else if (setInfoData.receiveUserId ==
                  bTeamPlayer2!.userId.toString()) {
                ref.read(bTeamPlayer2InitServiceProvider.notifier).state =
                    Service.R;
                if (setInfoData.gameType == "D") {
                  if (!isPositionChanged) {
                    switchAteamPosition(ref);
                  }
                }
              }

              // 서비스 방향 확인하기
              if ((isPositionChanged && server == "B") ||
                  (!isPositionChanged && server == "A")) {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LRRR;
              } else {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RRLR;
              }

              //위에 점수 세팅
              for (int j = 0; j <= currentSet - 1; j++) {
                final scoreInfoJson =
                    scoreSettingInfo.successData.body["settingInfo"]["setInfo"]
                        [j]["scoreInfo"] as List<dynamic>;
                final List<ScoresheetInfo> scoreListData = scoreInfoJson
                    .map((item) =>
                        ScoresheetInfo.fromJson(item as Map<String, dynamic>))
                    .toList();
                for (int i = 0; i < scoreListData.length; i++) {
                  if (scoreListData[i].scoreType == 0) {
                    if (scoreListData[i].scoreValue != 0) {
                      //점수일 때
                      //득점한 팀이 어떤 팀인지 구분
                      late String team;
                      if (scoreListData[i].winnerUserId ==
                              aTeamPlayer1.userId ||
                          scoreListData[i].winnerUserId ==
                              aTeamPlayer2!.userId) {
                        team = 'A';
                      } else {
                        team = 'B';
                      }
                      if (team == 'A') {
                        if (j == 0) {
                          ref.read(aTeamScoreProvider.notifier).update(
                              (state) => state.copyWith(
                                  set1Score: scoreListData[i].scoreValue));
                        } else if (j == 1) {
                          ref.read(aTeamScoreProvider.notifier).update(
                              (state) => state.copyWith(
                                  set2Score: scoreListData[i].scoreValue));
                        } else if (j == 2) {
                          ref.read(aTeamScoreProvider.notifier).update(
                              (state) => state.copyWith(
                                  set3Score: scoreListData[i].scoreValue));
                        }
                        if (i == scoreListData.length - 1) {
                          ref.read(aTeamScoreProvider.notifier).update(
                              (state) => state.copyWith(
                                  setScore: aTeamScore.setScore + 1));
                        }
                      } else {
                        if (j == 0) {
                          ref.read(bTeamScoreProvider.notifier).update(
                              (state) => state.copyWith(
                                  set1Score: scoreListData[i].scoreValue));
                        } else if (j == 1) {
                          ref.read(bTeamScoreProvider.notifier).update(
                              (state) => state.copyWith(
                                  set2Score: scoreListData[i].scoreValue));
                        } else if (j == 2) {
                          ref.read(bTeamScoreProvider.notifier).update(
                              (state) => state.copyWith(
                                  set3Score: scoreListData[i].scoreValue));
                        }
                        if (i == scoreListData.length - 1) {
                          ref.read(bTeamScoreProvider.notifier).update(
                              (state) => state.copyWith(
                                  setScore: bTeamScore.setScore + 1));
                        }
                      }
                    }
                  }
                }
              }

              final scoreInfoJson =
                  scoreSettingInfo.successData.body["settingInfo"]["setInfo"]
                      [currentSet - 1]["scoreInfo"] as List<dynamic>;
              final List<ScoresheetInfo> scoreListData = scoreInfoJson
                  .map((item) =>
                      ScoresheetInfo.fromJson(item as Map<String, dynamic>))
                  .toList();
              //updateScoreGridForServiceOrder(WidgetRef ref, int serviceOverCnt,List<String> serviceOrder, int scoreSheetIndex, int newScore)
              for (int i = 0; i < scoreListData.length; i++) {
                if (scoreListData[i].scoreType == 0) {
                  if (scoreListData[i].scoreValue != 0) {
                    //점수일 때
                    //득점한 팀이 어떤 팀인지 구분
                    late String team;
                    if (scoreListData[i].winnerUserId == aTeamPlayer1.userId ||
                        scoreListData[i].winnerUserId == aTeamPlayer2!.userId) {
                      team = 'A';
                    } else {
                      team = 'B';
                    }
                    if (team == 'A') {
                      ref.read(aScoreProvider.notifier).state =
                          scoreListData[i].scoreValue;
                    } else {
                      ref.read(bScoreProvider.notifier).state =
                          scoreListData[i].scoreValue;
                    }
                    ref.read(serviceOverCntProvider.notifier).state =
                        scoreListData[i].service;
                    //마지막 점수이면 해야하는 Action
                    if (i == scoreListData.length - 1) {
                      if (scoreListData[i].scoreValue > intervalScore) {
                        ref.read(intervalGivenProvider.notifier).state = true;
                      }
                      if (team == "A") {
                        updateServiceDirection(
                            ref, scoreListData[i].scoreValue, 'A');
                      } else {
                        updateServiceDirection(
                            ref, scoreListData[i].scoreValue, 'B');
                      }
                      if (setInfoData.gameType == "S") {
                        if (scoreListData[i].scoreValue % 2 == 0) {
                          if (isPositionChanged) {
                            ref
                                .read(isAteamPositionChangedProvider.notifier)
                                .state = false;
                            ref
                                .read(isBteamPositionChangedProvider.notifier)
                                .state = false;
                          } else {
                            ref
                                .read(isAteamPositionChangedProvider.notifier)
                                .state = true;
                            ref
                                .read(isBteamPositionChangedProvider.notifier)
                                .state = true;
                          }
                        } else {
                          if (isPositionChanged) {
                            ref
                                .read(isAteamPositionChangedProvider.notifier)
                                .state = true;
                            ref
                                .read(isBteamPositionChangedProvider.notifier)
                                .state = true;
                          } else {
                            ref
                                .read(isAteamPositionChangedProvider.notifier)
                                .state = false;
                            ref
                                .read(isBteamPositionChangedProvider.notifier)
                                .state = false;
                          }
                        }
                      }
                    }
                    updateScoreGird(ref, scoreListData[i].scoreValue, team);
                    createGameScore(ref, scoreListData[i].scoreValue);
                  }
                } else {
                  if (scoreListData[i].scoreType == 1) {
                    updateMisconductGrid(
                        ref, "warning", scoreListData[i].winnerUserId);
                  } else if (scoreListData[i].scoreType == 2) {
                    updateMisconductGrid(
                        ref, "fault", scoreListData[i].winnerUserId);
                  } else if (scoreListData[i].scoreType == 3) {
                    updateMisconductGrid(
                        ref, "referee", scoreListData[i].winnerUserId);
                  } else if (scoreListData[i].scoreType == 4) {
                    updateMisconductGrid(
                        ref, "suspension", scoreListData[i].winnerUserId);
                  } else if (scoreListData[i].scoreType == 5) {
                    updateMisconductGrid(
                        ref, "courtError", scoreListData[i].winnerUserId);
                  } else if (scoreListData[i].scoreType == 6) {
                    updateMisconductGrid(
                        ref, "injury", scoreListData[i].winnerUserId);
                  } else if (scoreListData[i].scoreType == 7) {
                    updateMisconductGrid(
                        ref, "disqualified", scoreListData[i].winnerUserId);
                  } else if (scoreListData[i].scoreType == 8) {
                    updateMisconductGrid(
                        ref, "retired", scoreListData[i].winnerUserId);
                  } else if (scoreListData[i].scoreType == 9) {
                    updateMisconductGrid(
                        ref, "CW", scoreListData[i].winnerUserId);
                  } else if (scoreListData[i].scoreType == 10) {
                    updateMisconductGrid(
                        ref, "CL", scoreListData[i].winnerUserId);
                  } else if (scoreListData[i].scoreType == 11) {
                    updateMisconductGrid(
                        ref, "ND", scoreListData[i].winnerUserId);
                  }
                }
              }
            }
          }
        } catch (e) {
          print('Error: $e');
        }
      }
    } else {
      ref.read(aScoreProvider.notifier).state = 0;
      ref.read(bScoreProvider.notifier).state = 0;
      ref.read(serviceOverCntProvider.notifier).state = 0;
      ref.read(misconductCntProvider.notifier).state = 0;
    }
    if (currentSet == 1) {
      _elapsedTimeNotifier.stopTimer();
      _elapsedTimeNotifier.resetTimer();
      _elapsedTimeNotifier.startTimer();
    }
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final aTeamChallengeCnt = ref.watch(aTeamChallengeCntProvider);
    final bTeamChallengeCnt = ref.watch(bTeamChallengeCntProvider);
    final isPositionChanged = ref.watch(isPositionChangedProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateScore(ref, context);
    });
    setupScoreListener(ref);
    ref.listen<int>(scoreSheetIndexProvider, (previous, next) {
      if (next > 20 && next > previous!) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.pixels + 40,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          }
        });
      } else if (next > 20 && next < previous!) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.pixels - 40,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        }
      }
    });
    final teamAScoreSection = TeamScoreSection(
      team: 'A',
      challengeCnt: aTeamChallengeCnt,
    );
    final teamBScoreSection = TeamScoreSection(
      team: 'B',
      challengeCnt: bTeamChallengeCnt,
    );
    return Scaffold(
      appBar: ScoreboardAppBar(),
      body: PopScope(
        canPop: false,
        child: Container(
          //color: const Color.fromARGB(255, 245, 249, 254),
          decoration: const BoxDecoration(
              // gradient: LinearGradient(
              //   end: Alignment.bottomCenter,
              //   begin: Alignment.topCenter,
              //   colors: [
              //     Color.fromARGB(255, 0, 23, 17),
              //     Color.fromARGB(255, 0, 54, 37),
              //   ],
              // ),
              color: Color.fromARGB(255, 230, 243, 255)),
          child: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 144, 151, 182),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(500)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Tap(
                                  onTap: () {
                                    showChallengeRequestPopup(
                                        context, 'unsighted');
                                  },
                                  child: Center(
                                    child: 'unsighted'
                                        .text
                                        .color(context.appColors.textBadgeText)
                                        .size(12)
                                        .bold
                                        .make(),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => {showSettingPopup(context, ref)},
                              icon: const Icon(
                                EvaIcons.alertTriangleOutline,
                              ),
                              color: context.appColors.textBadgeText,
                              iconSize: 40,
                              style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll<
                                          Color>(
                                      (Color.fromARGB(255, 255, 106, 106)))),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: ScoreSummary(),
                      ),
                      const Flexible(flex: 1, child: UnDoSetting()),
                    ],
                  )),
              Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: isPositionChanged
                              ? teamBScoreSection
                              : teamAScoreSection),
                      const Flexible(flex: 3, child: Court()),
                      Flexible(
                          flex: 1,
                          child: isPositionChanged
                              ? teamAScoreSection
                              : teamBScoreSection),
                    ],
                  )),
              Expanded(child: Scoresheet(scrollController: _scrollController))
            ],
          ),
        ),
      ),
    );
  }

  void setupScoreListener(WidgetRef ref) {
    ref.listen<int>(aScoreProvider, (previousScore, newScore) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(Duration(milliseconds: 100), () {
        if (newScore != previousScore && newScore != 0) {
          final currentTeamScore = ref.read(aTeamScoreProvider);
          updateScoreSummary(ref, currentTeamScore, newScore, 'A');
          if (newScore > previousScore!) {
            updateServiceDirection(ref, newScore, 'A');
            updateScoreGird(ref, newScore, 'A');
            createGameScore(ref, newScore);
          }
        }
      });
    });
    ref.listen<int>(bScoreProvider, (previousScore, newScore) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(Duration(milliseconds: 100), () {
        if (newScore != previousScore && newScore != 0) {
          final currentTeamScore = ref.read(bTeamScoreProvider);
          updateScoreSummary(ref, currentTeamScore, newScore, 'B');
          if (newScore > previousScore!) {
            updateServiceDirection(ref, newScore, 'B');
            updateScoreGird(ref, newScore, 'B');
            createGameScore(ref, newScore);
          }
        }
      });
    });
  }
}

Future<SimpleResult<LiveopResponse, ApiError>?> listGameSettingScore(
    WidgetRef ref) async {
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    final scoreListParam = ScoreListParam(
        gymId: defaultParam!.gymId,
        macAddress: defaultParam.macAddress,
        loginKey: defaultParam.loginKey,
        reservationNum: reservation!.reservationNum,
        setNum: 1);
    final result = await gameUseCase.listGameSettingScore(scoreListParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}

Future<SimpleResult<LiveopResponse, ApiError>?> updateGameScore(WidgetRef ref,
    int aTeamScore, int bTeamScore, bool setChanged, int setNum) async {
  firebaseUpdateGameScore(ref, aTeamScore, bTeamScore);
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    //if (defaultParam != null && reservation != null) {
    final scoreParam = ScoreParam(
        gymId: defaultParam!.gymId,
        macAddress: defaultParam.macAddress,
        loginKey: defaultParam.loginKey,
        reservationNum: reservation!.reservationNum,
        courtId: reservation.courtId,
        ateamScore: aTeamScore,
        bteamScore: bTeamScore,
        setChanged: setChanged,
        setNum: setNum);
    final result = await gameUseCase.updateGameScore(scoreParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}

Future<void> firebaseUpdateGameScore(
    WidgetRef ref, int aTeamScore, int bTeamScore) async {
  final reservation = ref.watch(reservationProvider);
  final defaultParam = ref.read(defaultParamProvider);
  final currentSet = ref.watch(currentSetProvider);
  final isPositionChanged = ref.watch(isPositionChangedProvider);

  if (reservation == null || defaultParam == null) {
    print("Error: Reservation or default parameters are null.");
    return;
  }
  DatabaseReference _dbRef = FirebaseDatabase.instance
      .ref('tournaments')
      .child(defaultParam!.gymId)
      .child(reservation!.courtId)
      .child(reservation.reservationNum.toString())
      .child(currentSet.toString());
  DatabaseReference set1Ref = FirebaseDatabase.instance
      .ref('tournaments')
      .child(defaultParam!.gymId)
      .child(reservation!.courtId)
      .child(reservation.reservationNum.toString())
      .child(1.toString());
  try {
    await _dbRef.set({
      'aScore': aTeamScore,
      'bScore': bTeamScore,
      'isATeamRight': isPositionChanged
    });
    if (currentSet > 1) {
      await set1Ref.update({'isATeamRight': isPositionChanged});
    }
  } catch (err) {
    print(err);
  }
}
