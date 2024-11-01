import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_play/popup/w_play_end_popup.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_play/widget/w_shuttle_count.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/model/enum_service_type.dart';
import '../../../../domain/model/vo_player.dart';
import '../../game_ready/s_game_ready.dart';
import '../../game_ready/s_position_setting.dart';
import '../../login/s_login.dart';
import '../s_play.dart';
import '../vo/enum_service_direction.dart';
import 'w_player_card.dart';

class UnDoSetting extends ConsumerWidget {
  const UnDoSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      alignment: Alignment.topRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ShuttleCount()],
      ),
    );
  }
}

void undoScores(BuildContext context, WidgetRef ref) {
  ref.read(aTeamAnnouncementProvider.notifier).state = "";
  ref.read(bTeamAnnouncementProvider.notifier).state = "";
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // scoreSheetIndex의 값을 가져오기, 어떤 선수의 그리드에 있는지 가져오기
    final scoreSheetIndex = ref.watch(scoreSheetIndexProvider);
    final setPoint = ref.read(scoreboardSettingProvider)!.setPoint;
    final currentSet = ref.watch(currentSetProvider);
    final totalSet = ref.read(scoreboardSettingProvider)!.totalSet;
    final intervalScore = (setPoint / 2).floor() + 1;
    deleteLastScore(ref);
    if (scoreSheetIndex > 0) {
      // 마지막에 어떤 선수의 Grid에 값이 들어갔는지
      String lastScoredPlayer = findLastScoredPlayer(ref);
      int? lastScore = findLastScore(ref, lastScoredPlayer);
      if (lastScore != null) {
        int oppositeLastScore =
            findOpposingTeamLastScore(ref, lastScoredPlayer) ?? 0;
        if (oppositeLastScore == 0) {
          //상대팀의 마지막 점수가 misconduct 이면서 바로 직전였을 때,
          final aTeamPlayer1Grid = ref.watch(aTeamPlayer1ScoreGridProvider);
          final aTeamPlayer2Grid = ref.watch(aTeamPlayer2ScoreGridProvider);
          final bTeamPlayer1Grid = ref.watch(bTeamPlayer1ScoreGridProvider);
          final bTeamPlayer2Grid = ref.watch(bTeamPlayer2ScoreGridProvider);
          String lastBeforeScoredPlayer = findLastBeforeScoredPlayer(
              scoreSheetIndex == 1 ? scoreSheetIndex - 1 : scoreSheetIndex - 2,
              aTeamPlayer1Grid,
              aTeamPlayer2Grid,
              bTeamPlayer1Grid,
              bTeamPlayer2Grid);
          String? lastBeforeMisconduct = findLastBeforeMisconduct(
              scoreSheetIndex == 1 ? scoreSheetIndex - 1 : scoreSheetIndex - 2,
              aTeamPlayer1Grid,
              aTeamPlayer2Grid,
              bTeamPlayer1Grid,
              bTeamPlayer2Grid,
              lastBeforeScoredPlayer);
          debugPrint(lastBeforeMisconduct);
          if (lastBeforeMisconduct == 'F') {
            decreaseScore(ref, lastScoredPlayer);
            determineServiceDirection(ref, lastScoredPlayer, lastScore);
            undoScores(context, ref);
            return;
          }
        }
        //조건이 더 필요함.
        // 1. 마지막 세트어야하고
        // 2. 마지막 점수가 intervalScore인데, 상대 점수가 intervalScore점수보다 적을 때만 코트체인지 해야됨.
        determineServiceDirection(ref, lastScoredPlayer, lastScore);
        if (lastScore == intervalScore && oppositeLastScore < intervalScore) {
          ref.read(intervalGivenProvider.notifier).state = false;
          ref.read(isIntervalProvider.notifier).state = false;
        }
        if ((currentSet == totalSet && lastScore == intervalScore) &&
            lastScore > oppositeLastScore) {
          ref.read(isIntervalProvider.notifier).state = false;
          ref.read(intervalGivenProvider.notifier).state = false;
        }
        decreaseScore(ref, lastScoredPlayer);
      } else {
        findLastMisconduct(ref, lastScoredPlayer);
        ref.read(misconductCntProvider.notifier).state =
            ref.watch(misconductCntProvider) - 1;
      }
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PositionSettingScreen()),
      );
    }
  });
}

void switchAteamPosition(WidgetRef ref) {
  // final aTeamPlayer1 = ref.read(aTeamPlayer1Provider);
  // final aTeamPlayer2 = ref.read(aTeamPlayer2Provider);
  // ref.read(aTeamPlayer1Provider.notifier).state = aTeamPlayer2;
  // ref.read(aTeamPlayer2Provider.notifier).state = aTeamPlayer1;
  final isAteamPositionChanged = ref.watch(isAteamPositionChangedProvider);
  ref.read(isAteamPositionChangedProvider.notifier).state =
      (!isAteamPositionChanged);
}

void switchBteamPosition(WidgetRef ref) {
  // final bTeamPlayer1 = ref.read(bTeamPlayer1Provider);
  // final bTeamPlayer2 = ref.read(bTeamPlayer2Provider);
  // ref.read(bTeamPlayer1Provider.notifier).state = bTeamPlayer2;
  // ref.read(bTeamPlayer2Provider.notifier).state = bTeamPlayer1;
  final isBteamPositionChanged = ref.watch(isBteamPositionChangedProvider);
  ref.read(isBteamPositionChangedProvider.notifier).state =
      (!isBteamPositionChanged);
}

void decreaseScore(WidgetRef ref, lastScoredPlayer) {
  final aScore = ref.watch(aScoreProvider);
  final bScore = ref.watch(bScoreProvider);
  final currentATeamScore = ref.watch(aTeamScoreProvider);
  final currentBTeamScore = ref.watch(bTeamScoreProvider);
  if (lastScoredPlayer.startsWith('A')) {
    ref.read(aScoreProvider.notifier).state = aScore - 1;
    updateScoreSummary(ref, currentATeamScore, aScore - 1, 'A');
  } else {
    ref.read(bScoreProvider.notifier).state = bScore - 1;
    updateScoreSummary(ref, currentBTeamScore, bScore - 1, 'B');
  }
}

String findLastScoredPlayer(WidgetRef ref) {
  final scoreSheetIndex = ref.read(scoreSheetIndexProvider);
  final aTeamPlayer1Grid = ref.read(aTeamPlayer1ScoreGridProvider);
  final aTeamPlayer2Grid = ref.read(aTeamPlayer2ScoreGridProvider);
  final bTeamPlayer1Grid = ref.read(bTeamPlayer1ScoreGridProvider);
  final bTeamPlayer2Grid = ref.read(bTeamPlayer2ScoreGridProvider);

  String lastScoredPlayer = '';

  if (aTeamPlayer1Grid[scoreSheetIndex - 1] == 'F') {
    lastScoredPlayer = 'A1';
  } else if (aTeamPlayer2Grid[scoreSheetIndex - 1] == 'F') {
    lastScoredPlayer = 'A2';
  } else if (bTeamPlayer1Grid[scoreSheetIndex - 1] == 'F') {
    lastScoredPlayer = 'B1';
  } else if (bTeamPlayer2Grid[scoreSheetIndex - 1] == 'F') {
    lastScoredPlayer = 'B2';
  } else {
    // 마지막 인덱스의 값이 'F'인 선수가 없는 경우, 이전 코드와 동일한 로직으로 처리
    if (aTeamPlayer1Grid[scoreSheetIndex - 1].isNotEmpty) {
      lastScoredPlayer = 'A1';
    } else if (aTeamPlayer2Grid[scoreSheetIndex - 1].isNotEmpty) {
      lastScoredPlayer = 'A2';
    } else if (bTeamPlayer1Grid[scoreSheetIndex - 1].isNotEmpty) {
      lastScoredPlayer = 'B1';
    } else if (bTeamPlayer2Grid[scoreSheetIndex - 1].isNotEmpty) {
      lastScoredPlayer = 'B2';
    }
  }
  return lastScoredPlayer;
}

void findLastMisconduct(ref, String lastScoredPlayer) {
  final scoreSheetIndex = ref.read(scoreSheetIndexProvider);
  final aTeamPlayer1Grid = ref.read(aTeamPlayer1ScoreGridProvider);
  final aTeamPlayer2Grid = ref.read(aTeamPlayer2ScoreGridProvider);
  final bTeamPlayer1Grid = ref.read(bTeamPlayer1ScoreGridProvider);
  final bTeamPlayer2Grid = ref.read(bTeamPlayer2ScoreGridProvider);
  final aTeamPlayer1ForScoreSheet = ref.read(aTeamPlayer1ForScoreSheetProvider);
  final aTeamPlayer2ForScoreSheet = ref.read(aTeamPlayer2ForScoreSheetProvider);
  final bTeamPlayer1ForScoreSheet = ref.read(bTeamPlayer1ForScoreSheetProvider);
  final bTeamPlayer2ForScoreSheet = ref.read(bTeamPlayer2ForScoreSheetProvider);
  final aTeamPlayer1 = ref.watch(aTeamPlayer1Provider);
  final aTeamPlayer2 = ref.watch(aTeamPlayer2Provider);
  final bTeamPlayer1 = ref.watch(bTeamPlayer1Provider);
  final bTeamPlayer2 = ref.watch(bTeamPlayer2Provider);
  var players = [
    aTeamPlayer1,
    aTeamPlayer2,
    bTeamPlayer1,
    bTeamPlayer2,
  ];
  late Player player;
  var lastMisconduct = '';

  if (scoreSheetIndex > 0) {
    switch (lastScoredPlayer) {
      case 'A1':
        lastMisconduct = aTeamPlayer1Grid[scoreSheetIndex - 1];
        ref.read(aTeamPlayer1ScoreGridProvider.notifier).state =
            List<String>.from(aTeamPlayer1Grid)..[scoreSheetIndex - 1] = '';
        ref.read(aTeamPlayer2ScoreGridProvider.notifier).state =
            List<String>.from(aTeamPlayer2Grid)..[scoreSheetIndex - 1] = '';
        ref.read(bTeamPlayer1ScoreGridProvider.notifier).state =
            List<String>.from(bTeamPlayer1Grid)..[scoreSheetIndex - 1] = '';
        ref.read(bTeamPlayer2ScoreGridProvider.notifier).state =
            List<String>.from(bTeamPlayer2Grid)..[scoreSheetIndex - 1] = '';
        player = aTeamPlayer1ForScoreSheet;
        break;
      case 'A2':
        lastMisconduct = aTeamPlayer2Grid[scoreSheetIndex - 1];
        ref.read(aTeamPlayer1ScoreGridProvider.notifier).state =
            List<String>.from(aTeamPlayer1Grid)..[scoreSheetIndex - 1] = '';
        ref.read(aTeamPlayer2ScoreGridProvider.notifier).state =
            List<String>.from(aTeamPlayer2Grid)..[scoreSheetIndex - 1] = '';
        ref.read(bTeamPlayer1ScoreGridProvider.notifier).state =
            List<String>.from(bTeamPlayer1Grid)..[scoreSheetIndex - 1] = '';
        ref.read(bTeamPlayer2ScoreGridProvider.notifier).state =
            List<String>.from(bTeamPlayer2Grid)..[scoreSheetIndex - 1] = '';
        player = aTeamPlayer2ForScoreSheet;
        break;
      case 'B1':
        lastMisconduct = bTeamPlayer1Grid[scoreSheetIndex - 1];
        ref.read(aTeamPlayer1ScoreGridProvider.notifier).state =
            List<String>.from(aTeamPlayer1Grid)..[scoreSheetIndex - 1] = '';
        ref.read(aTeamPlayer2ScoreGridProvider.notifier).state =
            List<String>.from(aTeamPlayer2Grid)..[scoreSheetIndex - 1] = '';
        ref.read(bTeamPlayer1ScoreGridProvider.notifier).state =
            List<String>.from(bTeamPlayer1Grid)..[scoreSheetIndex - 1] = '';
        ref.read(bTeamPlayer2ScoreGridProvider.notifier).state =
            List<String>.from(bTeamPlayer2Grid)..[scoreSheetIndex - 1] = '';
        player = bTeamPlayer1ForScoreSheet;
        break;
      case 'B2':
        lastMisconduct = bTeamPlayer2Grid[scoreSheetIndex - 1];
        ref.read(aTeamPlayer1ScoreGridProvider.notifier).state =
            List<String>.from(aTeamPlayer1Grid)..[scoreSheetIndex - 1] = '';
        ref.read(aTeamPlayer2ScoreGridProvider.notifier).state =
            List<String>.from(aTeamPlayer2Grid)..[scoreSheetIndex - 1] = '';
        ref.read(bTeamPlayer1ScoreGridProvider.notifier).state =
            List<String>.from(bTeamPlayer1Grid)..[scoreSheetIndex - 1] = '';
        ref.read(bTeamPlayer2ScoreGridProvider.notifier).state =
            List<String>.from(bTeamPlayer2Grid)..[scoreSheetIndex - 1] = '';
        player = bTeamPlayer2ForScoreSheet;
        break;
      default:
        throw ArgumentError('Invalid lastScoredPlayer: $lastScoredPlayer');
    }

    // 플레이어를 찾기 위해 반복문 사용
    for (int i = 0; i < players.length; i++) {
      if (players[i].userId == player.userId) {
        PlayerCard updatedPlayer;
        switch (lastMisconduct) {
          case 'W':
            updatedPlayer = players[i].copyWith(yellowCard: false);
            break;
          case 'F':
            updatedPlayer = players[i].copyWith(redCard: false);
            break;
          case 'D':
            updatedPlayer = players[i].copyWith(blackCard: false);
            break;
          case 'CL':
            if (i < 2) {
              ref.read(aTeamChallengeCntProvider.notifier).state =
                  ref.read(aTeamChallengeCntProvider) + 1;
            } else {
              ref.read(bTeamChallengeCntProvider.notifier).state =
                  ref.read(bTeamChallengeCntProvider) + 1;
            }
            updatedPlayer = players[i];
          default:
            updatedPlayer = players[i];
        }
        switch (i) {
          case 0:
            ref.read(aTeamPlayer1Provider.notifier).state = updatedPlayer;
            break;
          case 1:
            ref.read(aTeamPlayer2Provider.notifier).state = updatedPlayer;
            break;
          case 2:
            ref.read(bTeamPlayer1Provider.notifier).state = updatedPlayer;
            break;
          case 3:
            ref.read(bTeamPlayer2Provider.notifier).state = updatedPlayer;
            break;
        }
        break;
      }
    }
  } else {
    throw ArgumentError('scoreSheetIndex must be greater than 0');
  }
}

int? findLastScore(WidgetRef ref, String lastScoredPlayer) {
  final scoreSheetIndex = ref.read(scoreSheetIndexProvider);
  final aTeamPlayer1Grid = ref.read(aTeamPlayer1ScoreGridProvider);
  final aTeamPlayer2Grid = ref.read(aTeamPlayer2ScoreGridProvider);
  final bTeamPlayer1Grid = ref.read(bTeamPlayer1ScoreGridProvider);
  final bTeamPlayer2Grid = ref.read(bTeamPlayer2ScoreGridProvider);
  int? lastScore = 0;
  // 해당 Grid의 값 초기화
  switch (lastScoredPlayer) {
    case 'A1':
      lastScore = int.tryParse(aTeamPlayer1Grid[scoreSheetIndex - 1]);
      if (lastScore == null) break;
      ref.read(aTeamPlayer1ScoreGridProvider.notifier).state =
          List.from(aTeamPlayer1Grid)..[scoreSheetIndex - 1] = '';
      break;
    case 'A2':
      lastScore = int.tryParse(aTeamPlayer2Grid[scoreSheetIndex - 1]);
      if (lastScore == null) break;
      ref.read(aTeamPlayer2ScoreGridProvider.notifier).state =
          List.from(aTeamPlayer2Grid)..[scoreSheetIndex - 1] = '';
      break;
    case 'B1':
      lastScore = int.tryParse(bTeamPlayer1Grid[scoreSheetIndex - 1]);
      if (lastScore == null) break;
      ref.read(bTeamPlayer1ScoreGridProvider.notifier).state =
          List.from(bTeamPlayer1Grid)..[scoreSheetIndex - 1] = '';
      break;
    case 'B2':
      lastScore = int.tryParse(bTeamPlayer2Grid[scoreSheetIndex - 1]);
      if (lastScore == null) break;
      ref.read(bTeamPlayer2ScoreGridProvider.notifier).state =
          List.from(bTeamPlayer2Grid)..[scoreSheetIndex - 1] = '';
      break;
  }
  return lastScore;
}

int? findOpposingTeamLastScore(WidgetRef ref, String lastScoredPlayer) {
  final scoreSheetIndex = ref.read(scoreSheetIndexProvider);
  final bTeamPlayer1Grid = ref.read(bTeamPlayer1ScoreGridProvider);
  final bTeamPlayer2Grid = ref.read(bTeamPlayer2ScoreGridProvider);
  final aTeamPlayer1Grid = ref.read(aTeamPlayer1ScoreGridProvider);
  final aTeamPlayer2Grid = ref.read(aTeamPlayer2ScoreGridProvider);

  List<String> opposingTeamGrid1, opposingTeamGrid2;

  if (lastScoredPlayer.startsWith('A')) {
    opposingTeamGrid1 = bTeamPlayer1Grid;
    opposingTeamGrid2 = bTeamPlayer2Grid;
  } else {
    opposingTeamGrid1 = aTeamPlayer1Grid;
    opposingTeamGrid2 = aTeamPlayer2Grid;
  }

  // Find the most recent non-empty score in the opposing team's grids
  for (int i = scoreSheetIndex - 1; i >= 0; i--) {
    if (opposingTeamGrid1[i].isNotEmpty) {
      return int.tryParse(opposingTeamGrid1[i]);
    }
    if (opposingTeamGrid2[i].isNotEmpty) {
      return int.tryParse(opposingTeamGrid2[i]);
    }
  }
  return 0;
}

void determineServiceDirection(
    WidgetRef ref, String lastScoredPlayer, int lastScore) {
  final scoreSheetIndex = ref.watch(scoreSheetIndexProvider);
  final isPositionChanged = ref.watch(isPositionChangedProvider);
  final aTeamPlayer1Grid = ref.watch(aTeamPlayer1ScoreGridProvider);
  final aTeamPlayer2Grid = ref.watch(aTeamPlayer2ScoreGridProvider);
  final bTeamPlayer1Grid = ref.watch(bTeamPlayer1ScoreGridProvider);
  final bTeamPlayer2Grid = ref.watch(bTeamPlayer2ScoreGridProvider);
  final currentDirection = ref.watch(serviceDirectionProvider); //
  final gameType = ref.watch(gameTypeProvider);
  final totalSet = ref.read(scoreboardSettingProvider)!.totalSet;
  final currentSet = ref.watch(currentSetProvider);
  ref.watch(intervalGivenProvider);
  int oppositeLastScore = findOpposingTeamLastScore(ref, lastScoredPlayer) ?? 0;
  final setPoint = ref.read(scoreboardSettingProvider)!.setPoint;
  final intervalScore = (setPoint / 2).floor() + 1;
  // 마지막 직전의 선수의 점수에 따라 서비스 방향 정하기
  if (scoreSheetIndex > 1) {
    String lastBeforeScoredPlayer = findLastBeforeScoredPlayer(
        scoreSheetIndex - 2,
        aTeamPlayer1Grid,
        aTeamPlayer2Grid,
        bTeamPlayer1Grid,
        bTeamPlayer2Grid);
    int? lastBeforeScore = findLastBeforeScore(scoreSheetIndex,
        aTeamPlayer1Grid, aTeamPlayer2Grid, bTeamPlayer1Grid, bTeamPlayer2Grid);
    //점수에 따라 서비스 방향 세팅
    // 서비스 방향 되돌리기
    if (gameType == 'D') {
      if (lastBeforeScoredPlayer.startsWith('A')) {
        if (lastScoredPlayer.startsWith('A')) {
          //A의 연속득점일 때 취소 로직
          if (isPositionChanged) {
            if (lastBeforeScore! % 2 == 0) {
              //직전 점수가 짝수 일 때
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                switchBteamPosition(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LRRR;
              } else {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RRLR;
                switchAteamPosition(ref);
              }
            } else {
              // 직전 점수가 홀수 일 때
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LLRL;
                switchBteamPosition(ref);
              } else {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RLLL;
                switchAteamPosition(ref);
              }
            }
          } else {
            //자리 안바꾼 경우
            if (lastBeforeScore! % 2 == 0) {
              //직전 점수가 짝수일 때
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                switchBteamPosition(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RRLR;
              } else {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LRRR;
                switchAteamPosition(ref);
              }
            } else {
              //직전 점수가 홀 수 일 때
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RLLL;
                switchAteamPosition(ref);
              } else {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LLRL;
                switchAteamPosition(ref);
              }
            }
          }
        } else {
          ref.read(serviceOverCntProvider.notifier).state =
              ref.watch(serviceOverCntProvider) - 1;
          // 마지막 점수는 A 직전 점수는 B
          if (isPositionChanged) {
            if (lastBeforeScore! % 2 == 0) {
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LRRR;
              } else {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RRLR;
              }
            } else {
              //직전점수가 홀수일 때
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LLRL;
              } else {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RLLL;
              }
            }
          } else {
            if (lastBeforeScore! % 2 == 0) {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.LRRR;
            } else {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.LLRL;
            }
          }
        }
      } else {
        //마지막 점수가 B일 때
        if (lastScoredPlayer.startsWith('A')) {
          ref.read(serviceOverCntProvider.notifier).state =
              ref.watch(serviceOverCntProvider) - 1;
          if (isPositionChanged) {
            if (lastBeforeScore! % 2 == 0) {
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RRLR;
              } else {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LRRR;
              }
            } else {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.LLRL;
            }
          } else {
            if (lastBeforeScore! % 2 == 0) {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.RRLR;
            } else {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.RLLL;
            }
          }
        } else {
          //B연속 득점일 때
          if (isPositionChanged) {
            if (lastBeforeScore! % 2 == 0) {
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RRLR;
                switchAteamPosition(ref);
              } else {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LRRR;
                switchBteamPosition(ref);
              }
            } else {
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RLLL;
                switchAteamPosition(ref);
              } else {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LLRL;
                switchBteamPosition(ref);
              }
            }
          } else {
            //자리 안바뀐 상황
            if (lastBeforeScore! % 2 == 0) {
              //직전 점수가 짝수일 때
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                switchAteamPosition(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LRRR;
              } else {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RRLR;
                switchBteamPosition(ref);
              }
            } else {
              //직전 점수가 홀 수 일 때
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LLRL;
                switchAteamPosition(ref);
              } else {
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RLLL;
                switchBteamPosition(ref);
              }
            }
          }
        }
      }
    } else {
      //단식인 경우
      if (lastBeforeScoredPlayer.startsWith('A')) {
        if (lastScoredPlayer.startsWith('A')) {
          //A가 연속 득점 했었음.
          if (isPositionChanged) {
            if (lastBeforeScore! % 2 == 0) {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.RRLR;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                switchAteamPosition(ref);
                switchBteamPosition(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LRRR;
              }
            } else {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.RLLL;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LLRL;
              }
            }
          } else {
            if (lastBeforeScore! % 2 == 0) {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.LRRR;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);

                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RRLR;

                switchAteamPosition(ref);
                switchBteamPosition(ref);
              }
            } else {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.LLRL;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RLLL;
              }
            }
          }
          //A팀 연속득점
          switchAteamPosition(ref);
          switchBteamPosition(ref);
        } else {
          //이전 바로 직전은 A , 직전은 B
          if (isPositionChanged) {
            if (lastBeforeScore! % 2 == 0) {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.RRLR;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                switchAteamPosition(ref);
                switchBteamPosition(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LRRR;
              } else {
                if (lastScore % 2 != 0) {
                  switchAteamPosition(ref);
                  switchBteamPosition(ref);
                }
              }
            } else {
              if (lastScore % 2 == 0) {
                switchAteamPosition(ref);
                switchBteamPosition(ref);
              }
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.RLLL;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LLRL;
              }
            }
          } else {
            if (lastBeforeScore! % 2 == 0) {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.LRRR;
              if (lastScore % 2 != 0) {
                switchAteamPosition(ref);
                switchBteamPosition(ref);
              }
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                switchAteamPosition(ref);
                switchBteamPosition(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RRLR;
              }
            } else {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.LLRL;
              if (lastScore % 2 == 0) {
                switchAteamPosition(ref);
                switchBteamPosition(ref);
              }
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RLLL;
              }
            }
          }
        }
      } else {
        //취소 직전 점수를 B팀이 냈을 때
        if (lastScoredPlayer.startsWith('A')) {
          //취소 점수를 A팀이 냈을 때
          if (isPositionChanged) {
            if (lastBeforeScore! % 2 == 0) {
              //취소 직전 점수가 짝수
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.LRRR;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RRLR;
              } else {
                if (lastScore % 2 != 0) {
                  switchAteamPosition(ref);
                  switchBteamPosition(ref);
                }
              }
            } else {
              //취소 직전 점수가 홀수
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.LLRL;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                switchAteamPosition(ref);
                switchBteamPosition(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RLLL;
              } else {
                if (lastScore % 2 == 0) {
                  switchAteamPosition(ref);
                  switchBteamPosition(ref);
                }
              }
            }
          } else {
            //취소 직전 점수가 짝수
            if (lastBeforeScore! % 2 == 0) {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.RRLR;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LRRR;
              } else {
                if (lastScore % 2 != 0) {
                  switchAteamPosition(ref);
                  switchBteamPosition(ref);
                }
              }
            } else {
              //취소직전 점수가 홀수
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.RLLL;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                switchAteamPosition(ref);
                switchBteamPosition(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LLRL;
              } else {
                if (lastScore % 2 == 0) {
                  switchAteamPosition(ref);
                  switchBteamPosition(ref);
                }
              }
            }
          }
        } else {
          //B가 연속득점시 실행취소
          if (isPositionChanged) {
            if (lastBeforeScore! % 2 == 0) {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.LRRR;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                switchAteamPosition(ref);
                switchBteamPosition(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RRLR;
              }
            } else {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.LLRL;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                switchAteamPosition(ref);
                switchBteamPosition(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.RLLL;
              }
            }
          } else {
            if (lastBeforeScore! % 2 == 0) {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.RRLR;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                switchAteamPosition(ref);
                switchBteamPosition(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LRRR;
              }
            } else {
              ref.read(serviceDirectionProvider.notifier).state =
                  ServiceDirection.RLLL;
              if (totalSet == currentSet &&
                  intervalScore == lastScore &&
                  oppositeLastScore < intervalScore) {
                courtChange(ref);
                ref.read(serviceDirectionProvider.notifier).state =
                    ServiceDirection.LLRL;
              }
            }
          }
          switchAteamPosition(ref);
          switchBteamPosition(ref);
        }
      }
    }
  } else if (scoreSheetIndex == 1) {
    // 최초 서비스 방향으로 세팅
    Map<String, Service?> players = {
      "A1": ref.read(aTeamPlayer1InitServiceProvider),
      "A2": ref.read(aTeamPlayer2InitServiceProvider),
      "B1": ref.read(bTeamPlayer1InitServiceProvider),
      "B2": ref.read(bTeamPlayer2InitServiceProvider)
    };
    final String sPlayer =
        players.entries.firstWhere((entry) => entry.value == Service.S).key;
    final gameType = ref.watch(gameTypeProvider);
    if (gameType == 'D') {
      if (!isPositionChanged) {
        //안바뀌면서 서버가 A로 시작하면?
        if (sPlayer.startsWith('A')) {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.LRRR;
          if (currentDirection == ServiceDirection.LLRL) {
            switchAteamPosition(ref);
          } else if (currentDirection == ServiceDirection.RLLL) {
            ref.read(serviceOverCntProvider.notifier).state =
                ref.watch(serviceOverCntProvider) - 1;
          }
        } else {
          //자리 안안 바뀌었으면서 서버가 B로 시작하면?
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.RRLR;
          if (currentDirection == ServiceDirection.RLLL) {
            switchBteamPosition(ref);
          } else if (currentDirection == ServiceDirection.LLRL) {
            ref.read(serviceOverCntProvider.notifier).state =
                ref.watch(serviceOverCntProvider) - 1;
          }
        }
      } else {
        //자리가 바뀌었으면서 서버가 A로 시작하면?
        if (sPlayer.startsWith('A')) {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.RRLR;
          if (currentDirection == ServiceDirection.RLLL) {
            switchAteamPosition(ref);
          } else if (currentDirection == ServiceDirection.LLRL) {
            ref.read(serviceOverCntProvider.notifier).state =
                ref.watch(serviceOverCntProvider) - 1;
          }
        } else {
          //바뀌면서 서버가 B로 시작하면?
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.LRRR;
          if (currentDirection == ServiceDirection.LLRL) {
            switchBteamPosition(ref);
          } else if (currentDirection == ServiceDirection.RLLL) {
            ref.read(serviceOverCntProvider.notifier).state =
                ref.watch(serviceOverCntProvider) - 1;
          }
        }
      }
    } else {
      //단식인 경우
      if (!isPositionChanged) {
        //안바뀌면서 서버가 A로 시작하면?
        if (sPlayer.startsWith('A')) {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.LRRR;
        } else {
          //바뀌면서 서버가 B로 시작하면?
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.RRLR;
        }
        switchAteamPosition(ref);
        switchBteamPosition(ref);
      } else {
        //바뀌면서 서버가 A로 시작하면?
        if (sPlayer.startsWith('A')) {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.RRLR;
        } else {
          //바뀌면서 서버가 B로 시작하면?
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.LRRR;
        }
        switchAteamPosition(ref);
        switchBteamPosition(ref);
      }
    }
  }
}

String findLastBeforeScoredPlayer(
    int scoreSheetIndex,
    List<String> aTeamPlayer1Grid,
    List<String> aTeamPlayer2Grid,
    List<String> bTeamPlayer1Grid,
    List<String> bTeamPlayer2Grid) {
  // 점수를 찾기 위한 내부 재귀 함수
  var lastBeforeScoredPlayer = '';

  if (aTeamPlayer1Grid[scoreSheetIndex].isNotEmpty) {
    lastBeforeScoredPlayer = 'A1';
  }
  if (aTeamPlayer2Grid[scoreSheetIndex].isNotEmpty) {
    lastBeforeScoredPlayer += 'A2';
  }
  if (bTeamPlayer1Grid[scoreSheetIndex].isNotEmpty) {
    lastBeforeScoredPlayer += 'B1';
  }
  if (bTeamPlayer2Grid[scoreSheetIndex].isNotEmpty) {
    lastBeforeScoredPlayer += 'B2';
  }

  return lastBeforeScoredPlayer;
}

int? findLastBeforeScore(
    int scoreSheetIndex,
    List<String> aTeamPlayer1Grid,
    List<String> aTeamPlayer2Grid,
    List<String> bTeamPlayer1Grid,
    List<String> bTeamPlayer2Grid) {
  // 점수를 찾기 위한 내부 재귀 함수
  int? getlastScore(int index) {
    if (index < 0) return null; // 더 이상 유효한 점수가 없으면 null 반환

    String lastBeforeScoredPlayer = '';
    if (aTeamPlayer1Grid[index].isNotEmpty) {
      lastBeforeScoredPlayer = 'A1';
    } else if (aTeamPlayer2Grid[index].isNotEmpty) {
      lastBeforeScoredPlayer = 'A2';
    } else if (bTeamPlayer1Grid[index].isNotEmpty) {
      lastBeforeScoredPlayer = 'B1';
    } else if (bTeamPlayer2Grid[index].isNotEmpty) {
      lastBeforeScoredPlayer = 'B2';
    }

    int? lastBeforeScore;
    switch (lastBeforeScoredPlayer) {
      case 'A1':
        lastBeforeScore = int.tryParse(aTeamPlayer1Grid[index]);
        break;
      case 'A2':
        lastBeforeScore = int.tryParse(aTeamPlayer2Grid[index]);
        break;
      case 'B1':
        lastBeforeScore = int.tryParse(bTeamPlayer1Grid[index]);
        break;
      case 'B2':
        lastBeforeScore = int.tryParse(bTeamPlayer2Grid[index]);
        break;
      default:
        return null; // 플레이어가 없으면 null 반환
    }

    // 점수가 유효하면 반환, 유효하지 않으면 직전 점수를 찾기 위해 재귀 호출
    return lastBeforeScore ?? getlastScore(index - 1);
  }

  // 재귀 함수 호출 시작점은 scoreSheetIndex - 2
  return getlastScore(scoreSheetIndex - 2);
}

String? findLastBeforeMisconduct(
    int scoreSheetIndex,
    List<String> aTeamPlayer1Grid,
    List<String> aTeamPlayer2Grid,
    List<String> bTeamPlayer1Grid,
    List<String> bTeamPlayer2Grid,
    String lastBeforeScoredPlayer) {
  // 점수를 찾기 위한 내부 재귀 함수
  var lastBeforeScore = '';
  if (lastBeforeScoredPlayer.length == 2) {
    switch (lastBeforeScoredPlayer) {
      case 'A1':
        lastBeforeScore = aTeamPlayer1Grid[scoreSheetIndex];
        break;
      case 'A2':
        lastBeforeScore = aTeamPlayer2Grid[scoreSheetIndex];
        break;
      case 'B1':
        lastBeforeScore = bTeamPlayer1Grid[scoreSheetIndex];
        break;
      case 'B2':
        lastBeforeScore = bTeamPlayer2Grid[scoreSheetIndex];
        break;
      default:
        return null; // 플레이어가 없으면 null 반환
    }
  } else {
    lastBeforeScore += aTeamPlayer1Grid[scoreSheetIndex];
    lastBeforeScore += aTeamPlayer2Grid[scoreSheetIndex];
    lastBeforeScore += bTeamPlayer1Grid[scoreSheetIndex];
    lastBeforeScore += bTeamPlayer2Grid[scoreSheetIndex];
    if (lastBeforeScore.contains("F")) {
      lastBeforeScore = 'F';
    }
  }

  return lastBeforeScore;
}
