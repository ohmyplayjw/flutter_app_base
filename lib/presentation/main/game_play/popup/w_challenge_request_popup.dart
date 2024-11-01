import 'dart:math' as math;
import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/vo_challengeId.dart';
import '../../../../data/models/vo_challenge_param.dart';
import '../../../../data/network/result/api_error.dart';
import '../../../../data/simple_result.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/game_controller.dart';
import '../../game_ready/s_game_ready.dart';
import 'w_challenge_result_popup.dart';

void showChallengeRequestPopup(BuildContext context, String team) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return ChallengeRequestPopup(team: team);
    },
  );
}

class ChallengeRequestPopup extends ConsumerStatefulWidget {
  final String team;

  const ChallengeRequestPopup({Key? key, required this.team}) : super(key: key);

  @override
  _ChallengeRequestPopupState createState() => _ChallengeRequestPopupState();
}

class _ChallengeRequestPopupState extends ConsumerState<ChallengeRequestPopup> {
  int? selectedCamera;
  @override
  Widget build(BuildContext context) {
    final isCameraChanged = ref.watch(isCameraChangedProvider);
    final team = widget.team;
    final aTeamChallengeCnt = ref.watch(aTeamChallengeCntProvider);
    final bTeamChallengeCnt = ref.watch(bTeamChallengeCntProvider);
    var width = MediaQuery.of(context).size.width * 0.9;
    var height = MediaQuery.of(context).size.height * 0.9;
    return Dialog(
        //backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'select_camera'.tr(),
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 66, 71, 83),
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
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  widget.team == 'unsighted'
                                      ? const Text(
                                          'Unsighted',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      : Text(
                                          widget.team == 'A'
                                              ? aTeamChallengeCnt.toString()
                                              : bTeamChallengeCnt.toString(),
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                          .text
                                          .color(context.appColors.brightText)
                                          .size(24)
                                          .bold
                                          .make(),
                                  if (widget.team != 'unsighted')
                                    'challenges'
                                        .text
                                        .color(context.appColors.brightText)
                                        .size(16)
                                        .bold
                                        .make()
                                ],
                              )),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      Column(
                        children: [
                          CupertinoSwitch(
                            value: isCameraChanged,
                            activeColor: CupertinoColors.activeBlue,
                            onChanged: (bool value) {
                              ref.read(isCameraChangedProvider.notifier).state =
                                  value;
                            },
                          ),
                          Text(
                            'switch_camera'.tr(),
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Camera(
                            cameraNum: 2,
                            textTop: 25,
                            textLeft: 20,
                            rotationDegrees: 0,
                            onTap: () async {
                              setState(() {
                                selectedCamera = 2;
                              });
                              final challengeRequestResult =
                                  await challengeRequest(
                                      ref, widget.team, selectedCamera!);
                              if (challengeRequestResult != null) {
                                final challengeId = challengeRequestResult
                                    .successData.challengeId;
                                showChallengeResultPopup(
                                    context, team, challengeId);
                              }
                            },
                            isSelected: selectedCamera == 2,
                          ),
                          Camera(
                            cameraNum: 1,
                            textTop: 25,
                            textLeft: 20,
                            rotationDegrees: 0,
                            onTap: () async {
                              setState(() {
                                selectedCamera = 1;
                              });
                              final challengeRequestResult =
                                  await challengeRequest(
                                      ref, widget.team, selectedCamera!);
                              if (challengeRequestResult != null) {
                                final challengeId = challengeRequestResult
                                    .successData.challengeId;
                                showChallengeResultPopup(
                                    context, team, challengeId);
                              }
                            },
                            isSelected: selectedCamera == 1,
                          )
                        ],
                      ),
                      SizedBox(
                        width: width * 0.4,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              !isCameraChanged
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Camera(
                                              cameraNum: 3,
                                              textTop: 15,
                                              textLeft: 33,
                                              rotationDegrees: 90,
                                              onTap: () async {
                                                setState(() {
                                                  selectedCamera = 3;
                                                });
                                                final challengeRequestResult =
                                                    await challengeRequest(
                                                        ref,
                                                        widget.team,
                                                        selectedCamera!);
                                                if (challengeRequestResult !=
                                                    null) {
                                                  final challengeId =
                                                      challengeRequestResult
                                                          .successData
                                                          .challengeId;
                                                  showChallengeResultPopup(
                                                      context,
                                                      team,
                                                      challengeId);
                                                }
                                              },
                                              isSelected: selectedCamera == 3,
                                            ),
                                            Camera(
                                              cameraNum: 4,
                                              textTop: 15,
                                              textLeft: 33,
                                              rotationDegrees: 90,
                                              onTap: () async {
                                                setState(() {
                                                  selectedCamera = 4;
                                                });
                                                final challengeRequestResult =
                                                    await challengeRequest(
                                                        ref,
                                                        widget.team,
                                                        selectedCamera!);
                                                if (challengeRequestResult !=
                                                    null) {
                                                  final challengeId =
                                                      challengeRequestResult
                                                          .successData
                                                          .challengeId;
                                                  showChallengeResultPopup(
                                                      context,
                                                      team,
                                                      challengeId);
                                                }
                                              },
                                              isSelected: selectedCamera == 4,
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  : const SizedBox(
                                      height: 60,
                                    ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/image/bg_court.png',
                                    fit: BoxFit.cover,
                                    width: width * 0.4,
                                  ),
                                  const SizedBox(
                                    height: 60,
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.arrow_drop_up,
                                          size: 30,
                                        ),
                                        Text(
                                          'Umpire',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              if (isCameraChanged)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Camera(
                                      cameraNum: 3,
                                      textTop: 35,
                                      textLeft: 33,
                                      rotationDegrees: 270,
                                      onTap: () async {
                                        setState(() {
                                          selectedCamera = 3;
                                        });
                                        final challengeRequestResult =
                                            await challengeRequest(ref,
                                                widget.team, selectedCamera!);
                                        if (challengeRequestResult != null) {
                                          final challengeId =
                                              challengeRequestResult
                                                  .successData.challengeId;
                                          showChallengeResultPopup(
                                              context, team, challengeId);
                                        }
                                      },
                                      isSelected: selectedCamera == 3,
                                    ),
                                    Camera(
                                      cameraNum: 4,
                                      textTop: 35,
                                      textLeft: 33,
                                      rotationDegrees: 270,
                                      onTap: () {
                                        setState(() {
                                          selectedCamera = 4;
                                        });
                                      },
                                      isSelected: selectedCamera == 4,
                                    )
                                  ],
                                )
                            ]),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Camera(
                            cameraNum: 5,
                            textTop: 25,
                            textLeft: 44,
                            rotationDegrees: 180,
                            onTap: () async {
                              setState(() {
                                selectedCamera = 5;
                              });
                              final challengeRequestResult =
                                  await challengeRequest(
                                      ref, widget.team, selectedCamera!);
                              if (challengeRequestResult != null) {
                                final challengeId = challengeRequestResult
                                    .successData.challengeId;
                                showChallengeResultPopup(
                                    context, team, challengeId);
                              }
                            },
                            isSelected: selectedCamera == 5,
                          ),
                          Camera(
                            cameraNum: 6,
                            textTop: 25,
                            textLeft: 44,
                            rotationDegrees: 180,
                            onTap: () async {
                              setState(() {
                                selectedCamera = 6;
                              });
                              final challengeRequestResult =
                                  await challengeRequest(
                                      ref, widget.team, selectedCamera!);
                              if (challengeRequestResult != null) {
                                final challengeId = challengeRequestResult
                                    .successData.challengeId;
                                showChallengeResultPopup(
                                    context, team, challengeId);
                              }
                            },
                            isSelected: selectedCamera == 6,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    fixedSize:
                        WidgetStatePropertyAll(Size.fromWidth((width - 1) / 2)),
                  ),
                  onPressed: () async {
                    //Navigator.of(context, rootNavigator: true).pop(); // 기존 팝업 Close
                    if (selectedCamera != null) {
                      // 챌린지 요청을 처리하는 로직 추가
                      final challengeRequestResult = await challengeRequest(
                          ref, widget.team, selectedCamera!);
                      if (challengeRequestResult != null) {
                        final challengeId =
                            challengeRequestResult.successData.challengeId;
                        showChallengeResultPopup(context, team, challengeId);
                      }
                    } else {
                      showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text(
                                'error'.tr(),
                                style: const TextStyle(fontSize: 24),
                              ),
                              content: Text(
                                'select_camera'.tr(),
                                style: const TextStyle(fontSize: 20),
                              ),
                              actions: [
                                CupertinoDialogAction(
                                    isDefaultAction: true,
                                    child: Text(
                                      "ok".tr(),
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    })
                              ],
                            );
                          });
                    }
                  },
                  child: selectedCamera != null
                      ? Text(
                          'challenge_request'.tr(),
                          style: const TextStyle(fontSize: 24),
                        )
                      : Text(
                          'challenge_request'.tr(),
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.grey, // 비활성화된 텍스트 색상
                            fontWeight: FontWeight.normal, // 굵기를 일반적으로 유지
                          ),
                        ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(
                        Size.fromWidth((width - 1) / 2))),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // 기존 팝업 Close
                },
                child: Text(
                  'cancel'.tr(),
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          ])
        ],
      ),
    ));
  }
}

class Camera extends StatelessWidget {
  const Camera({
    super.key,
    required this.cameraNum,
    required this.textTop,
    required this.textLeft,
    required this.rotationDegrees,
    required this.onTap,
    required this.isSelected,
  });

  final int cameraNum;
  final double textTop;
  final double textLeft;
  final double rotationDegrees;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center, // Stack 내에서도 중심에 위치하도록 설정
        children: [
          Transform.rotate(
            angle: rotationDegrees * math.pi / 180,
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? Colors.red : Colors.transparent,
                  width: 3,
                ),
              ),
              child: SvgPicture.asset(
                '$basePath/icon/ic_cam.svg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: textTop,
            left: textLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Cam',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cameraNum.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<SimpleResult<ChallengeId, ApiError>?> challengeRequest(
    WidgetRef ref, String team, int cameraNum) async {
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final currentSet = ref.read(currentSetProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    var participantId;
    if (team == 'A') {
      participantId = ref.read(aTeamParticipantProvider)!.participantId;
    } else if (team == 'B') {
      participantId = ref.read(bTeamParticipantProvider)!.participantId;
    } else {
      participantId = '0';
    }
    //if (defaultParam != null && reservation != null) {
    final challengeParam = ChallengeParam(
      gymId: defaultParam!.gymId,
      macAddress: defaultParam.macAddress,
      loginKey: defaultParam.loginKey,
      reservationNum: reservation!.reservationNum,
      courtId: reservation.courtId,
      setNum: currentSet,
      participantId: participantId,
      cameraNum: cameraNum,
    );
    final result = await gameUseCase.challengeRequest(challengeParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}
