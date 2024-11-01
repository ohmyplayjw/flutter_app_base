import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nav/nav.dart';

import '../../../../data/models/vo_game_end_param.dart';
import '../../../../data/models/vo_liveop_response.dart';
import '../../../../data/models/vo_score_delete_param.dart';
import '../../../../data/network/result/api_error.dart';
import '../../../../data/simple_result.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/game_controller.dart';
import '../../game_ready/s_game_ready.dart';
import '../../game_ready/s_position_setting.dart';
import '../../s_court_entrance.dart';
import '../s_play.dart';
import '../widget/w_undo_setting.dart';

void showPlayEndPopup(
    BuildContext context, VoidCallback onFinish, String type, int? loseUserId) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Consumer(
          builder: (BuildContext context, WidgetRef widgetRef, Widget? child) {
        return Dialog(
          child: SizedBox(
            width: 600,
            height: 250,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(child: endPopupTitle(type)),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: EndPopup(
                        type: type,
                        loseUserId: loseUserId,
                      ),
                    ),
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.pop(context);
                            undoScores(context, widgetRef);
                            deleteLastScore(widgetRef);
                          },
                          child: Text('undo'.tr()),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CupertinoButton(
                        onPressed: () async {
                          // Save 버튼 로직 추가
                          if (type == 'GAME') {
                            // Next Set Logic
                            Navigator.pop(context);
                            WidgetsBinding.instance
                                .addPostFrameCallback((_) async {
                              final ref = ProviderScope.containerOf(context,
                                  listen: false);
                              // Next Set Logic
                              final aScore = ref.read(aScoreProvider);
                              final bScore = ref.read(bScoreProvider);
                              final aTeamScore = ref.read(aTeamScoreProvider);
                              final bTeamScore = ref.read(bTeamScoreProvider);
                              final currentSet =
                                  widgetRef.watch(currentSetProvider);
                              if (aScore > bScore) {
                                ref.read(aTeamScoreProvider.notifier).update(
                                    (state) => state.copyWith(
                                        setScore: aTeamScore.setScore + 1));
                              } else {
                                ref.read(bTeamScoreProvider.notifier).update(
                                    (state) => state.copyWith(
                                        setScore: bTeamScore.setScore + 1));
                              }
                              await updateGameScore(widgetRef, aScore, bScore,
                                  true, currentSet + 1);
                              Nav.pushFromRight(PositionSettingScreen());
                              ref.read(currentSetProvider.notifier).state++;
                              ref.read(serviceOverCntProvider.notifier).state =
                                  0;
                              ref.read(isEndPointProvider.notifier).state =
                                  false;
                            });
                          } else if (type == 'MATCH') {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            //경기 종료 서버 호출
                            final container = ProviderScope.containerOf(context,
                                listen: false);
                            Navigator.pop(context);
                            final court = container.read(selectedCourtProvider);
                            final aScore = container.read(aScoreProvider);
                            final bScore = container.read(bScoreProvider);
                            final aTeamScore =
                                container.read(aTeamScoreProvider);
                            final bTeamScore =
                                container.read(bTeamScoreProvider);

                            late String winTeamNum;
                            late String winScoreStr;
                            late String lostScoreStr;
                            if (aScore > bScore) {
                              winTeamNum = container
                                  .read(aTeamParticipantProvider)!
                                  .participantId;
                              winScoreStr =
                                  "${aTeamScore.set1Score},${aTeamScore.set2Score},${aTeamScore.set3Score}";
                              lostScoreStr =
                                  "${bTeamScore.set1Score},${bTeamScore.set2Score},${bTeamScore.set3Score}";
                            } else {
                              winTeamNum = container
                                  .read(bTeamParticipantProvider)!
                                  .participantId;
                              lostScoreStr =
                                  "${aTeamScore.set1Score},${aTeamScore.set2Score},${aTeamScore.set3Score}";
                              winScoreStr =
                                  "${bTeamScore.set1Score},${bTeamScore.set2Score},${bTeamScore.set3Score}";
                            }
                            await gameEnd(widgetRef, winTeamNum, winScoreStr,
                                lostScoreStr);
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            container.read(currentSetProvider.notifier).state =
                                1;
                            container.refresh(reservationListProvider);
                            container.read(isEndPointProvider.notifier).state =
                                false;
                            Nav.push(GameReadyScreen(court: court!));
                          } else if (type == 'RETIRED') {
                            //경기 종료 서버 호출
                            final container = ProviderScope.containerOf(context,
                                listen: false);
                            final court = container.read(selectedCourtProvider);
                            Navigator.pop(context);
                            final aScore = container.read(aScoreProvider);
                            final bScore = container.read(bScoreProvider);
                            final aTeamScore =
                                container.read(aTeamScoreProvider);
                            final bTeamScore =
                                container.read(bTeamScoreProvider);

                            late String winTeamNum;
                            late String winScoreStr;
                            late String lostScoreStr;
                            if (aScore > bScore) {
                              winTeamNum = container
                                  .read(aTeamParticipantProvider)!
                                  .participantId;
                              winScoreStr =
                                  "${aTeamScore.set1Score},${aTeamScore.set2Score},${aTeamScore.set3Score}";
                              lostScoreStr =
                                  "${bTeamScore.set1Score},${bTeamScore.set2Score},${bTeamScore.set3Score}";
                            } else {
                              winTeamNum = container
                                  .read(bTeamParticipantProvider)!
                                  .participantId;
                              lostScoreStr =
                                  "${aTeamScore.set1Score},${aTeamScore.set2Score},${aTeamScore.set3Score}";
                              winScoreStr =
                                  "${bTeamScore.set1Score},${bTeamScore.set2Score},${bTeamScore.set3Score}";
                            }
                            await gameEndOpponentRetired(widgetRef, winTeamNum,
                                winScoreStr, lostScoreStr);
                            await gameEnd(widgetRef, winTeamNum, winScoreStr,
                                lostScoreStr);
                            await Future.delayed(
                                const Duration(milliseconds: 300));
                            container.read(currentSetProvider.notifier).state =
                                1;
                            container.refresh(reservationListProvider);
                            container.read(isEndPointProvider.notifier).state =
                                false;

                            Nav.push(GameReadyScreen(court: court!));
                          } else if (type == 'DISQUALIFIED') {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            //경기 종료 서버 호출
                            final container = ProviderScope.containerOf(context,
                                listen: false);
                            final court = container.read(selectedCourtProvider);
                            WidgetsBinding.instance
                                .addPostFrameCallback((_) async {
                              Navigator.pop(context);
                              final aScore = container.read(aScoreProvider);
                              final bScore = container.read(bScoreProvider);
                              final aTeamScore =
                                  container.read(aTeamScoreProvider);
                              final bTeamScore =
                                  container.read(bTeamScoreProvider);

                              late String winTeamNum;
                              late String winScoreStr;
                              late String lostScoreStr;
                              if (aScore > bScore) {
                                winTeamNum = container
                                    .read(aTeamParticipantProvider)!
                                    .participantId;
                                winScoreStr =
                                    "${aTeamScore.set1Score},${aTeamScore.set2Score},${aTeamScore.set3Score}";
                                lostScoreStr =
                                    "${bTeamScore.set1Score},${bTeamScore.set2Score},${bTeamScore.set3Score}";
                              } else {
                                winTeamNum = container
                                    .read(bTeamParticipantProvider)!
                                    .participantId;
                                lostScoreStr =
                                    "${aTeamScore.set1Score},${aTeamScore.set2Score},${aTeamScore.set3Score}";
                                winScoreStr =
                                    "${bTeamScore.set1Score},${bTeamScore.set2Score},${bTeamScore.set3Score}";
                              }
                              await gameEndOpponentRetired(widgetRef,
                                  winTeamNum, winScoreStr, lostScoreStr);
                              await gameEnd(widgetRef, winTeamNum, winScoreStr,
                                  lostScoreStr);
                              await Future.delayed(
                                  const Duration(milliseconds: 300));
                              container
                                  .read(currentSetProvider.notifier)
                                  .state = 1;
                              container.refresh(reservationListProvider);
                              container
                                  .read(isEndPointProvider.notifier)
                                  .state = false;
                              Nav.push(GameReadyScreen(court: court!));
                            });
                          }
                        },
                        child: const Text('save').tr(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
    },
  );
}

endPopupTitle(String type) {
  var title;
  type == "RETIRED"
      ? title = 'Retired.'
      : type == "DISQUALIFIED"
          ? title = 'Disqualified'
          : title = 'Game.';
  return Text(
    title,
    style: TextStyle(fontSize: 24),
  );
}

Future<SimpleResult<LiveopResponse, ApiError>?> gameEnd(WidgetRef ref,
    String winTeamNum, String scoreWinStr, String scoreLostStr) async {
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    final gameEndParam = GameEndParam(
      gymId: defaultParam!.gymId,
      macAddress: defaultParam.macAddress,
      loginKey: defaultParam.loginKey,
      reservationNum: reservation!.reservationNum,
      courtId: reservation.courtId,
      winnerParticipantId: int.parse(winTeamNum),
      startUse: 0,
      scoreWin: scoreWinStr,
      scoreLost: scoreLostStr,
      isOpponentRetired: "Y",
      externalTnmtId: reservation.externalTnmtId,
      externalKey: reservation.externalKey,
    );
    final result = await gameUseCase.gameEnd(gameEndParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}

Future<SimpleResult<LiveopResponse, ApiError>?> gameEndOpponentRetired(
    WidgetRef ref,
    String winTeamNum,
    String scoreWinStr,
    String scoreLostStr) async {
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    final gameEndParam = GameEndParam(
      gymId: defaultParam!.gymId,
      macAddress: defaultParam.macAddress,
      loginKey: defaultParam.loginKey,
      reservationNum: reservation!.reservationNum,
      courtId: reservation.courtId,
      winnerParticipantId: int.parse(winTeamNum),
      startUse: 0,
      scoreWin: scoreWinStr,
      scoreLost: scoreLostStr,
      isOpponentRetired: "W",
      externalTnmtId: reservation.externalTnmtId,
      externalKey: reservation.externalKey,
    );
    final result = await gameUseCase.gameEndOpponentRetired(gameEndParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}

Future<SimpleResult<LiveopResponse, ApiError>?> deleteLastScore(
    WidgetRef ref) async {
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    final scoreSheetIndex = ref.watch(scoreSheetIndexProvider);
    final setNum = ref.watch(currentSetProvider);
    //if (defaultParam != null && reservation != null) {
    final scoreDeleteParam = ScoreDeleteParam(
      gymId: defaultParam!.gymId,
      macAddress: defaultParam.macAddress,
      loginKey: defaultParam.loginKey,
      reservationNum: reservation!.reservationNum,
      rallyNum: scoreSheetIndex + 2,
      setNum: setNum,
    );
    final result = await gameUseCase.deleteGameScore(scoreDeleteParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}

class EndPopup extends ConsumerStatefulWidget {
  final String type;
  final int? loseUserId;

  const EndPopup({super.key, required this.type, this.loseUserId});

  @override
  _EndPopupState createState() => _EndPopupState();
}

class _EndPopupState extends ConsumerState<EndPopup> {
  @override
  Widget build(BuildContext context) {
    final setNum = ref.watch(currentSetProvider);
    final aScore = ref.watch(aScoreProvider);
    final bScore = ref.watch(bScoreProvider);
    final aTeamScore = ref.watch(aTeamScoreProvider);
    final bTeamScore = ref.watch(bTeamScoreProvider);
    String scoreAnnounced() {
      var announcement = '';
      final type = widget.type;
      late int loseUserId;
      //TYPE에 따라 SET에 따라 다른 announcement
      if (type == 'GAME') {
        if (setNum == 1) {
          announcement += '1st Game Won by ';
        } else {
          //동점일 때
          announcement += '2nd Game Won by ';
        }
        if (aScore > bScore) {
          //player call
          announcement += '${aTeamScore.teamName} ${aTeamScore.playerName} \n';
          //score call
          announcement += '$aScore-$bScore';
        } else {
          //player call
          announcement += '${bTeamScore.teamName} ${bTeamScore.playerName} \n';
          //score call
          announcement += '$bScore-$aScore';
        }
      } else if (type == "MATCH") {
        //Match 일때
        announcement += 'Match Won by ';
        //점수 Call
        if (aScore > bScore) {
          //player call
          announcement += '${aTeamScore.teamName} ${aTeamScore.playerName} \n';
          //score call
          announcement += '${aTeamScore.set1Score} - ${bTeamScore.set1Score},';
          announcement += '${aTeamScore.set2Score} - ${bTeamScore.set2Score}';
          announcement += aTeamScore.set3Score != 0
              ? ', ${aTeamScore.set3Score} - ${bTeamScore.set3Score}'
              : '';
        } else {
          announcement += '${bTeamScore.teamName} ${bTeamScore.playerName} \n';
          //score call
          announcement += '${bTeamScore.set1Score} - ${aTeamScore.set1Score},';
          announcement += '${bTeamScore.set2Score} - ${aTeamScore.set2Score}';
          announcement += bTeamScore.set3Score != 0
              ? ', ${bTeamScore.set3Score} - ${aTeamScore.set3Score}'
              : '';
        }
      } else if (type == "RETIRED") {
        loseUserId = widget.loseUserId!;
        final aTeamPlayer1 = ref.read(aTeamPlayer1Provider);
        final bTeamPlayer1 = ref.read(bTeamPlayer1Provider);
        final aTeamPlayer2 = ref.read(aTeamPlayer2Provider);
        final bTeamPlayer2 = ref.read(bTeamPlayer2Provider);
        final gameType = ref.watch(gameTypeProvider);
        if (loseUserId != aTeamPlayer1!.userId) {
          if (gameType == "S") {
            announcement = "${bTeamPlayer1!.playerName} retired. ";
          } else {
            announcement =
                "${bTeamPlayer1!.playerName} ${bTeamPlayer2!.playerName} retired";
          }
        } else {
          if (gameType == "S") {
            announcement = "${aTeamPlayer1.playerName} retired. ";
          } else {
            announcement =
                "${aTeamPlayer1.playerName} ${aTeamPlayer2!.playerName} retired";
          }
        }
        announcement += 'Match Won by ';
        if (loseUserId == aTeamPlayer1.userId) {
          announcement += '${bTeamScore.teamName} ${bTeamScore.playerName} ';
          //score call
          announcement += '${bTeamScore.set1Score} - ${aTeamScore.set1Score},';
          announcement += '${bTeamScore.set2Score} - ${aTeamScore.set2Score}';
          announcement += bTeamScore.set3Score != 0
              ? ', ${bTeamScore.set3Score} - ${aTeamScore.set3Score}'
              : '';
        } else {
          announcement += '${aTeamScore.teamName} ${aTeamScore.playerName} ';
          //score call
          announcement += '${aTeamScore.set1Score} - ${bTeamScore.set1Score},';
          announcement += '${aTeamScore.set2Score} - ${bTeamScore.set2Score}';
          announcement += aTeamScore.set3Score != 0
              ? ', ${aTeamScore.set3Score} - ${bTeamScore.set3Score}'
              : '';
        }
      } else if (type == "DISQUALIFIED") {
        loseUserId = widget.loseUserId!;
        final aTeamPlayer1 = ref.read(aTeamPlayer1Provider);
        announcement += 'Match Won by ';
        if (loseUserId == aTeamPlayer1!.userId) {
          announcement += '${aTeamScore.teamName} ${aTeamScore.playerName} ';
          //score call
          announcement += '${aTeamScore.set1Score} - ${bTeamScore.set1Score},';
          announcement += '${aTeamScore.set2Score} - ${bTeamScore.set2Score}';
          announcement += aTeamScore.set3Score != 0
              ? ', ${aTeamScore.set3Score} - ${bTeamScore.set3Score}'
              : '';
        } else {
          announcement += '${bTeamScore.teamName} ${bTeamScore.playerName} ';
          //score call
          announcement += '${bTeamScore.set1Score} - ${aTeamScore.set1Score},';
          announcement += '${bTeamScore.set2Score} - ${aTeamScore.set2Score}';
          announcement += bTeamScore.set3Score != 0
              ? ', ${bTeamScore.set3Score} - ${aTeamScore.set3Score}'
              : '';
        }
      }
      return announcement;
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              scoreAnnounced(),
              style: const TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
