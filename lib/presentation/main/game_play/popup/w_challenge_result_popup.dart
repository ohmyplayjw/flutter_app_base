import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import '../../../../data/models/vo_challenge_result_enroll_param.dart';
import '../../../../data/models/vo_challenge_result_param.dart';
import '../../../../data/models/vo_challenge_result_response.dart';
import '../../../../data/models/vo_liveop_response.dart';
import '../../../../data/network/result/api_error.dart';
import '../../../../data/simple_result.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/game_controller.dart';
import '../../game_ready/s_game_ready.dart';
import '../s_play.dart';

void showChallengeResultPopup(
    BuildContext context, String team, int challengeId) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return ChallengeResultPopup(
        team: team,
        challengeId: challengeId,
      );
    },
  );
}

class ChallengeResultPopup extends ConsumerStatefulWidget {
  final String team;
  final int challengeId;
  const ChallengeResultPopup(
      {Key? key, required this.team, required this.challengeId})
      : super(key: key);
  @override
  _ChallengeResultPopupState createState() => _ChallengeResultPopupState();
}

class _ChallengeResultPopupState extends ConsumerState<ChallengeResultPopup> {
  ChallengeFinalResult? selectedFinalResult;

  @override
  void initState() {
    super.initState();
    _startPolling();
  }

  String challengeResult = "";
  void _startPolling() {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (!mounted) {
        timer.cancel();
        return;
      }
      try {
        final result = await challengeResultRequest(ref, widget.challengeId);
        if (result != null) {
          if (mounted) {
            setState(() {
              if (result.successData.challengeResult == null) {
                challengeResult = "판독 중";
              } else {
                challengeResult = result.successData.challengeResult!;
              }
            });
          }
          if (result.successData.challengeResult != null) {
            timer.cancel();
          }
        }
      } catch (e) {
        print("Error in _startPolling: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String team = widget.team;
    return Dialog(
      child: Builder(builder: (context) {
        var width = MediaQuery.of(context).size.width * 0.9;
        var height = MediaQuery.of(context).size.height * 0.8;
        return SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'challenge_result_comment'.tr(),
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('challenge_result'.tr(),
                            style: const TextStyle(
                                fontSize: 40, color: Colors.black)),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            width: width / 3,
                            height: height / 4,
                            color: challengeResult == "IN"
                                ? const Color.fromARGB(255, 14, 70, 167)
                                : challengeResult == "OUT"
                                    ? const Color.fromARGB(255, 253, 2, 2)
                                    : const Color.fromARGB(255, 46, 46, 46),
                            child: Center(
                              child: Text(
                                challengeResult == "IN"
                                    ? "IN"
                                    : challengeResult == "OUT"
                                        ? "OUT"
                                        : challengeResult == "ND"
                                            ? "ND"
                                            : "processing".tr(),
                                style: const TextStyle(
                                    fontSize: 50, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    team != "unsighted"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ChallengeFinalResultButton(
                                type: ChallengeFinalResult.SUCCESSFUL,
                                onTap: () {
                                  changeChanllengeResult(
                                      ChallengeFinalResult.SUCCESSFUL);
                                  setState(() {
                                    selectedFinalResult =
                                        ChallengeFinalResult.SUCCESSFUL;
                                  });
                                },
                                isSelected: selectedFinalResult ==
                                    ChallengeFinalResult.SUCCESSFUL,
                              ),
                              ChallengeFinalResultButton(
                                type: ChallengeFinalResult.UNSUCCESSFUL,
                                onTap: () {
                                  changeChanllengeResult(
                                      ChallengeFinalResult.UNSUCCESSFUL);
                                  setState(() {
                                    selectedFinalResult =
                                        ChallengeFinalResult.UNSUCCESSFUL;
                                  });
                                },
                                isSelected: selectedFinalResult ==
                                    ChallengeFinalResult.UNSUCCESSFUL,
                              ),
                              ChallengeFinalResultButton(
                                type: ChallengeFinalResult.NO_DECISION,
                                onTap: () {
                                  changeChanllengeResult(
                                      ChallengeFinalResult.NO_DECISION);
                                  setState(() {
                                    selectedFinalResult =
                                        ChallengeFinalResult.NO_DECISION;
                                  });
                                },
                                isSelected: selectedFinalResult ==
                                    ChallengeFinalResult.NO_DECISION,
                              )
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
              const Divider(),
              Row(
                children: [
                  if (team != "unsighted")
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
                            if (challengeResult == '' ||
                                challengeResult == '판독 중' ||
                                selectedFinalResult == null) {
                              showCupertinoDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: SizedBox(
                                        width: 400,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Center(
                                                  child: Text(
                                                    'alert_result_not_checked'
                                                        .tr(),
                                                    style: const TextStyle(
                                                        fontSize: 24),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Divider(),
                                            CupertinoDialogAction(
                                                isDefaultAction: true,
                                                child: Text("ok".tr(),
                                                    style: const TextStyle(
                                                        fontSize: 20)),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                })
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            } else {
                              Navigator.of(context, rootNavigator: true).pop();
                              Navigator.of(context, rootNavigator: true)
                                  .pop(); // 기존 팝업 Close
                              final userId = getUserIdWithTeam(team, ref);
                              if (userId == 0) {
                                updateMisconductGrid(ref, 'US', userId);
                              } else {
                                switch (selectedFinalResult) {
                                  case ChallengeFinalResult.SUCCESSFUL:
                                    updateMisconductGrid(ref, 'CW', userId);
                                    challengeResultEnroll(
                                        ref, widget.challengeId, 'S');
                                    break;
                                  case ChallengeFinalResult.UNSUCCESSFUL:
                                    team == 'A'
                                        ? ref
                                                .read(aTeamChallengeCntProvider
                                                    .notifier)
                                                .state =
                                            --ref
                                                .read(aTeamChallengeCntProvider
                                                    .notifier)
                                                .state
                                        : ref
                                                .read(bTeamChallengeCntProvider
                                                    .notifier)
                                                .state =
                                            --ref
                                                .read(bTeamChallengeCntProvider
                                                    .notifier)
                                                .state;
                                    updateMisconductGrid(ref, 'CL', userId);
                                    break;
                                  case ChallengeFinalResult.NO_DECISION:
                                    updateMisconductGrid(ref, 'CN', userId);
                                    break;
                                  default:
                                    break;
                                }
                              }
                            }
                          },
                          child: ((challengeResult == '' ||
                                          challengeResult != '판독 중') &&
                                      selectedFinalResult != null) ||
                                  team == "unsighted"
                              ? Text(
                                  'save'.tr(),
                                  style: const TextStyle(fontSize: 24),
                                )
                              : Text(
                                  'save'.tr(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey, // 비활성화된 텍스트 색상
                                    fontWeight:
                                        FontWeight.normal, // 굵기를 일반적으로 유지
                                  ),
                                ),
                        ),
                      ),
                    ),
                  Expanded(
                    flex: 1,
                    child: CupertinoButton(
                      onPressed: () {
                        deleteGameChallenge(ref, widget.challengeId);
                        Navigator.of(context, rootNavigator: true).pop();
                        Navigator.of(context, rootNavigator: true)
                            .pop(); // 기존 팝업 Close
                      },
                      child: team == "unsighted"
                          ? Text('ok'.tr())
                          : Text('cancel'.tr(),
                              style: const TextStyle(
                                fontSize: 24,
                              )),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  void changeChanllengeResult(challengeFinalResult) {
    setState(() {
      selectedFinalResult = challengeFinalResult;
    });
  }

  Future<SimpleResult<ChallengeResultResponse, ApiError>?>
      challengeResultRequest(WidgetRef ref, int challengeId) async {
    if (!mounted) return null; // 위젯이 이미 dispose 되었다면 즉시 반환

    try {
      final defaultParam = ref.read(defaultParamProvider);
      if (defaultParam == null) {
        return SimpleResult.failure(
            ApiError(message: "Default parameters are not set"));
      }

      final gameUseCase = ref.read(gameUseCaseProvider);
      final challengeResultParam = ChallengeResultParam(
          gymId: defaultParam.gymId,
          macAddress: defaultParam.macAddress,
          loginKey: defaultParam.loginKey,
          challengeId: challengeId);

      final result =
          await gameUseCase.challengeResultRequest(challengeResultParam);
      if (result.successData.challengeResult == "ND") {
        setState(() {
          selectedFinalResult = ChallengeFinalResult.NO_DECISION;
        });
      }
      return result;
    } catch (e) {
      print("Error in challengeResultRequest: $e"); // 로그 추가
      return SimpleResult.failure(ApiError(message: e.toString()));
    }
  }
}

Future<SimpleResult<LiveopResponse, ApiError>?> deleteGameChallenge(
    WidgetRef ref, int challengeId) async {
  try {
    final defaultParam = ref.read(defaultParamProvider);
    if (defaultParam == null) {
      return SimpleResult.failure(
          ApiError(message: "Default parameters are not set"));
    }

    final gameUseCase = ref.read(gameUseCaseProvider);
    final challengeResultParam = ChallengeResultParam(
        gymId: defaultParam.gymId,
        macAddress: defaultParam.macAddress,
        loginKey: defaultParam.loginKey,
        challengeId: challengeId);

    final result = await gameUseCase.deleteGameChallenge(challengeResultParam);
    return result;
  } catch (e) {
    print("Error in challengeResultRequest: $e"); // 로그 추가
    return SimpleResult.failure(ApiError(message: e.toString()));
  }
}

Future<SimpleResult<LiveopResponse, ApiError>?> challengeResultEnroll(
    WidgetRef ref, int challengeId, String finalResult) async {
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    final challengeIdParam = challengeId;
    final challengeResultEnrollParam = ChallengeResultEnrollParam(
        gymId: defaultParam!.gymId,
        macAddress: defaultParam.macAddress,
        loginKey: defaultParam.loginKey,
        challengeId: challengeIdParam,
        challengeType: finalResult);
    final result =
        await gameUseCase.challengeResultEnroll(challengeResultEnrollParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}

//팀을 입력하면 해당 팀의 두번 째 userId를 가져오는 함수
int getUserIdWithTeam(String team, WidgetRef ref) {
  int userId = 0;
  final aTeamPlayer1ForScoreSheet = ref.read(aTeamPlayer1ForScoreSheetProvider);
  final bTeamPlayer1ForScoreSheet = ref.read(bTeamPlayer1ForScoreSheetProvider);
  if (team == 'A') {
    userId = aTeamPlayer1ForScoreSheet != null
        ? aTeamPlayer1ForScoreSheet.userId
        : 0;
  } else {
    userId = bTeamPlayer1ForScoreSheet != null
        ? bTeamPlayer1ForScoreSheet.userId
        : 0;
  }
  return userId;
}

class ChallengeFinalResultButton extends StatelessWidget {
  const ChallengeFinalResultButton({
    required this.type,
    required this.isSelected,
    required this.onTap,
    super.key,
  });
  final bool isSelected;
  final ChallengeFinalResult type;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9 / 5,
        height: MediaQuery.of(context).size.height * 0.9 / 5,
        color: type == ChallengeFinalResult.SUCCESSFUL
            ? isSelected
                ? const Color.fromARGB(255, 14, 70, 167)
                : const Color.fromARGB(116, 77, 108, 162)
            : type == ChallengeFinalResult.UNSUCCESSFUL
                ? isSelected
                    ? const Color.fromARGB(255, 255, 50, 50)
                    : const Color.fromARGB(255, 249, 121, 121)
                : isSelected
                    ? const Color.fromARGB(255, 46, 46, 46)
                    : const Color.fromARGB(255, 210, 210, 210),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              type == ChallengeFinalResult.SUCCESSFUL
                  ? "Successful"
                  : type == ChallengeFinalResult.UNSUCCESSFUL
                      ? "Unsuccesful"
                      : "No Decision",
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

enum ChallengeFinalResult {
  SUCCESSFUL,
  UNSUCCESSFUL,
  NO_DECISION,
}
