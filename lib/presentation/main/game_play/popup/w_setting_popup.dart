import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_play/widget/w_undo_setting.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/s_court_entrance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/constants.dart';
import '../../../../data/models/vo_monitoring_call_param.dart';
import '../../../../data/models/vo_shuttle_count.dart';
import '../../../../data/network/result/api_error.dart';
import '../../../../data/simple_result.dart';
import '../../../../domain/model/vo_player.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/game_controller.dart';
import '../../game_ready/s_game_ready.dart';
import '../s_play.dart';
import '../widget/w_misconduct_card.dart';
import '../widget/w_selectable_player_card.dart';

void showSettingPopup(BuildContext context, WidgetRef ref) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Builder(builder: (context) {
            var width = MediaQuery.of(context).size.width * 0.8;
            return SizedBox(
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text('Misconduct',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MisconductCard(
                            cardName: 'Warning',
                            imgPath: '$basePath/icon/ic_rule_warning.png',
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              getPlayerSelectCommonPopup("warning",
                                  (Player player, BuildContext context) {
                                warning(player, context);
                              }, context, ref);
                            },
                          ),
                          MisconductCard(
                            cardName: 'Fault',
                            imgPath: '$basePath/icon/ic_rule_fault.png',
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              getPlayerSelectCommonPopup("fault",
                                  (Player player, BuildContext context) {
                                requestFaultReferee(player, context, ref);
                              }, context, ref);
                            },
                          ),
                          MisconductCard(
                              cardName: 'referee_call'.tr(),
                              imgPath:
                                  '$basePath/icon/ic_rule_referee_called.png',
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                refereeCall(context, ref);
                                monitoringRequest(context, ref, 0);
                              }),
                          MisconductCard(
                              cardName: 'Suspension',
                              imgPath: '$basePath/icon/ic_rule_suspension.png',
                              onTap: () {
                                updateMisconductGrid(ref, "suspension", 0);
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                suspension(context, ref);
                              }),
                          MisconductCard(
                            cardName: 'shuttle_request'.tr(),
                            imgPath: '$basePath/icon/ic_request_shuttle.png',
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              requestShuttle(context, ref);
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MisconductCard(
                              cardName: 'Injury',
                              imgPath: '$basePath/icon/ic_rule_injury.png',
                              onTap: () {
                                getPlayerSelectCommonPopup("injury",
                                    (Player player, BuildContext context) {
                                  requestInjury(player, context, ref);
                                }, context, ref);
                              }),
                          MisconductCard(
                              cardName: 'Disqualified',
                              imgPath:
                                  '$basePath/icon/ic_rule_disqualified.png',
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                getPlayerSelectCommonPopup("disqualified",
                                    (Player player, BuildContext context) {
                                  requestDisqualified(player, context, ref);
                                }, context, ref);
                              }),
                          MisconductCard(
                              cardName: 'Retired',
                              imgPath: '$basePath/icon/ic_rule_retired.png',
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                getParticipantSelectCommonPopup(
                                    (int userId, BuildContext context) {
                                  requestRetired(userId, context, ref);
                                }, context, ref);
                              }),
                          MisconductCard(
                            cardName: 'CourtError',
                            imgPath: '$basePath/icon/ic_rule_court_error.png',
                            onTap: () {
                              updateMisconductGrid(ref, "courtError", 0);
                              Navigator.of(context, rootNavigator: true).pop();
                              courtError(context);
                            },
                          ),
                          MisconductCard(
                            cardName: 'omp_call'.tr(),
                            imgPath: '$basePath/icon/ic_rule_omp_called.png',
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              ompCalled(context, ref);
                              monitoringRequest(context, ref, 1);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('close'.tr(),
                            style: const TextStyle(fontSize: 24)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        );
      });
}

void getPlayerSelectCommonPopup(
    String type,
    void Function(Player, BuildContext) callBack,
    BuildContext context,
    WidgetRef ref) {
  final reservation = ref.watch(reservationProvider);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Player? selectedPlayer;
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: Builder(builder: (context) {
              var width = MediaQuery.of(context).size.width * 0.6;
              var height = MediaQuery.of(context).size.height * 0.7;
              return SizedBox(
                width: width,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        type == "warning"
                            ? 'select_warning_player'.tr()
                            : type == "fault"
                                ? 'select_fault_player'.tr()
                                : type == "injury"
                                    ? 'select_injured_player'.tr()
                                    : type == "disqualified"
                                        ? 'select_disqualified_player'.tr()
                                        : '',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: reservation == null
                            ? const CircularProgressIndicator()
                            : reservation.gameType == 'S'
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SelectablePlayerCard(
                                        teamColor: const Color(0x006c9472),
                                        playerName: reservation
                                            .btopiaUserCourtReservationList![0]
                                            .name,
                                        teamName: reservation
                                            .btopiaUserCourtReservationList![0]
                                            .attr1,
                                        onTap: () {
                                          setState(() {
                                            selectedPlayer = Player(
                                              participantId: reservation
                                                  .btopiaUserCourtReservationList![
                                                      0]
                                                  .participantId,
                                              userId: reservation
                                                  .btopiaUserCourtReservationList![
                                                      0]
                                                  .userId,
                                              attr1: reservation
                                                  .btopiaUserCourtReservationList![
                                                      0]
                                                  .attr1,
                                              name: reservation
                                                  .btopiaUserCourtReservationList![
                                                      0]
                                                  .name,
                                            );
                                          });
                                        },
                                        isSelected: selectedPlayer != null &&
                                            selectedPlayer!.userId ==
                                                reservation
                                                    .btopiaUserCourtReservationList![
                                                        0]
                                                    .userId,
                                      ),
                                      SelectablePlayerCard(
                                        teamColor: const Color(0x006c9472),
                                        playerName: reservation
                                            .btopiaUserCourtReservationList![1]
                                            .name,
                                        teamName: reservation
                                            .btopiaUserCourtReservationList![1]
                                            .attr1,
                                        onTap: () {
                                          setState(() {
                                            selectedPlayer = Player(
                                              participantId: reservation
                                                  .btopiaUserCourtReservationList![
                                                      1]
                                                  .participantId,
                                              userId: reservation
                                                  .btopiaUserCourtReservationList![
                                                      1]
                                                  .userId,
                                              attr1: reservation
                                                  .btopiaUserCourtReservationList![
                                                      1]
                                                  .attr1,
                                              name: reservation
                                                  .btopiaUserCourtReservationList![
                                                      1]
                                                  .name,
                                            );
                                          });
                                        },
                                        isSelected: selectedPlayer != null &&
                                            selectedPlayer!.userId ==
                                                reservation
                                                    .btopiaUserCourtReservationList![
                                                        1]
                                                    .userId,
                                      )
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SelectablePlayerCard(
                                            teamColor: const Color(0x006c9472),
                                            playerName: reservation
                                                .btopiaUserCourtReservationList![
                                                    0]
                                                .name,
                                            teamName: reservation
                                                .btopiaUserCourtReservationList![
                                                    0]
                                                .attr1,
                                            onTap: () {
                                              setState(() {
                                                selectedPlayer = Player(
                                                  participantId: reservation
                                                      .btopiaUserCourtReservationList![
                                                          0]
                                                      .participantId,
                                                  userId: reservation
                                                      .btopiaUserCourtReservationList![
                                                          0]
                                                      .userId,
                                                  attr1: reservation
                                                      .btopiaUserCourtReservationList![
                                                          0]
                                                      .attr1,
                                                  name: reservation
                                                      .btopiaUserCourtReservationList![
                                                          0]
                                                      .name,
                                                );
                                              });
                                            },
                                            isSelected: selectedPlayer !=
                                                    null &&
                                                selectedPlayer!.userId ==
                                                    reservation
                                                        .btopiaUserCourtReservationList![
                                                            0]
                                                        .userId,
                                          ),
                                          SelectablePlayerCard(
                                            teamColor: const Color(0x006c9472),
                                            playerName: reservation
                                                .btopiaUserCourtReservationList![
                                                    1]
                                                .name,
                                            teamName: reservation
                                                .btopiaUserCourtReservationList![
                                                    1]
                                                .attr1,
                                            onTap: () {
                                              setState(() {
                                                selectedPlayer = Player(
                                                  participantId: reservation
                                                      .btopiaUserCourtReservationList![
                                                          1]
                                                      .participantId,
                                                  userId: reservation
                                                      .btopiaUserCourtReservationList![
                                                          1]
                                                      .userId,
                                                  attr1: reservation
                                                      .btopiaUserCourtReservationList![
                                                          1]
                                                      .attr1,
                                                  name: reservation
                                                      .btopiaUserCourtReservationList![
                                                          1]
                                                      .name,
                                                );
                                              });
                                            },
                                            isSelected: selectedPlayer !=
                                                    null &&
                                                selectedPlayer!.userId ==
                                                    reservation
                                                        .btopiaUserCourtReservationList![
                                                            1]
                                                        .userId,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 30),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SelectablePlayerCard(
                                            playerName: reservation
                                                .btopiaUserCourtReservationList![
                                                    2]
                                                .name,
                                            teamName: reservation
                                                .btopiaUserCourtReservationList![
                                                    2]
                                                .attr1,
                                            onTap: () {
                                              setState(() {
                                                selectedPlayer = Player(
                                                  participantId: reservation
                                                      .btopiaUserCourtReservationList![
                                                          2]
                                                      .participantId,
                                                  userId: reservation
                                                      .btopiaUserCourtReservationList![
                                                          2]
                                                      .userId,
                                                  attr1: reservation
                                                      .btopiaUserCourtReservationList![
                                                          2]
                                                      .attr1,
                                                  name: reservation
                                                      .btopiaUserCourtReservationList![
                                                          2]
                                                      .name,
                                                );
                                              });
                                            },
                                            isSelected: selectedPlayer !=
                                                    null &&
                                                selectedPlayer!.userId ==
                                                    reservation
                                                        .btopiaUserCourtReservationList![
                                                            2]
                                                        .userId,
                                          ),
                                          SelectablePlayerCard(
                                            playerName: reservation
                                                .btopiaUserCourtReservationList![
                                                    3]
                                                .name,
                                            teamName: reservation
                                                .btopiaUserCourtReservationList![
                                                    3]
                                                .attr1,
                                            onTap: () {
                                              setState(() {
                                                selectedPlayer = Player(
                                                  participantId: reservation
                                                      .btopiaUserCourtReservationList![
                                                          3]
                                                      .participantId,
                                                  userId: reservation
                                                      .btopiaUserCourtReservationList![
                                                          3]
                                                      .userId,
                                                  attr1: reservation
                                                      .btopiaUserCourtReservationList![
                                                          3]
                                                      .attr1,
                                                  name: reservation
                                                      .btopiaUserCourtReservationList![
                                                          3]
                                                      .name,
                                                );
                                              });
                                            },
                                            isSelected: selectedPlayer !=
                                                    null &&
                                                selectedPlayer!.userId ==
                                                    reservation
                                                        .btopiaUserCourtReservationList![
                                                            3]
                                                        .userId,
                                          ),
                                        ],
                                      ),
                                    ],
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
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop(); // 기존 팝업 Close
                              },
                              child: Text('close'.tr(),
                                  style: const TextStyle(fontSize: 24)),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextButton(
                            onPressed: () {
                              if (selectedPlayer != null) {
                                if (type != "injury") {
                                  updateMisconductGrid(
                                      ref, type, selectedPlayer!.userId);
                                }
                                callBack(selectedPlayer!, context);
                              } // 기존 팝업 Close
                            },
                            child: Text(
                              'save'.tr(),
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          );
        },
      );
    },
  );
}

void getParticipantSelectCommonPopup(void Function(int, BuildContext) callBack,
    BuildContext context, WidgetRef ref) {
  final reservation = ref.watch(reservationProvider);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      int? selectedUserId;
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: Builder(builder: (context) {
              var width = MediaQuery.of(context).size.width * 0.6;
              var height = MediaQuery.of(context).size.height * 0.6;
              return SizedBox(
                width: width,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'select_retired_player'.tr(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 350,
                      child: reservation == null
                          ? const CircularProgressIndicator()
                          : reservation.gameType == 'S'
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SelectablePlayerCard(
                                      teamColor: const Color(0x006c9472),
                                      playerName: reservation
                                          .btopiaUserCourtReservationList![0]
                                          .name,
                                      teamName: reservation
                                          .btopiaUserCourtReservationList![0]
                                          .attr1,
                                      onTap: () {
                                        setState(() {
                                          selectedUserId = reservation
                                              .btopiaUserCourtReservationList![
                                                  0]
                                              .userId;
                                        });
                                      },
                                      isSelected: selectedUserId != null &&
                                          selectedUserId ==
                                              reservation
                                                  .btopiaUserCourtReservationList![
                                                      0]
                                                  .userId,
                                    ),
                                    SelectablePlayerCard(
                                      playerName: reservation
                                          .btopiaUserCourtReservationList![1]
                                          .name,
                                      teamName: reservation
                                          .btopiaUserCourtReservationList![1]
                                          .attr1,
                                      onTap: () {
                                        setState(() {
                                          selectedUserId = reservation
                                              .btopiaUserCourtReservationList![
                                                  1]
                                              .userId;
                                        });
                                      },
                                      isSelected: selectedUserId != null &&
                                          selectedUserId ==
                                              reservation
                                                  .btopiaUserCourtReservationList![
                                                      1]
                                                  .userId,
                                    )
                                  ],
                                )
                              : Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SelectablePlayerCard(
                                          teamColor: const Color(0x006c9472),
                                          playerName:
                                              "${reservation.btopiaUserCourtReservationList![0].name} ${reservation.btopiaUserCourtReservationList![1].name}",
                                          teamName: reservation
                                                      .btopiaUserCourtReservationList![
                                                          0]
                                                      .attr1 ==
                                                  reservation
                                                      .btopiaUserCourtReservationList![
                                                          1]
                                                      .attr1
                                              ? reservation
                                                  .btopiaUserCourtReservationList![
                                                      0]
                                                  .attr1
                                              : "${reservation.btopiaUserCourtReservationList![0].attr1} ${reservation.btopiaUserCourtReservationList![1].attr1}",
                                          onTap: () {
                                            setState(() {
                                              selectedUserId = reservation
                                                  .btopiaUserCourtReservationList![
                                                      0]
                                                  .userId;
                                            });
                                          },
                                          isSelected: selectedUserId != null &&
                                              selectedUserId ==
                                                  reservation
                                                      .btopiaUserCourtReservationList![
                                                          0]
                                                      .userId,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SelectablePlayerCard(
                                          playerName:
                                              "${reservation.btopiaUserCourtReservationList![2].name} ${reservation.btopiaUserCourtReservationList![3].name}",
                                          teamName: reservation
                                                      .btopiaUserCourtReservationList![
                                                          2]
                                                      .attr1 ==
                                                  reservation
                                                      .btopiaUserCourtReservationList![
                                                          3]
                                                      .attr1
                                              ? reservation
                                                  .btopiaUserCourtReservationList![
                                                      2]
                                                  .attr1
                                              : "${reservation.btopiaUserCourtReservationList![2].attr1} ${reservation.btopiaUserCourtReservationList![3].attr1}",
                                          onTap: () {
                                            setState(() {
                                              selectedUserId = reservation
                                                  .btopiaUserCourtReservationList![
                                                      2]
                                                  .userId;
                                            });
                                          },
                                          isSelected: selectedUserId != null &&
                                              selectedUserId ==
                                                  reservation
                                                      .btopiaUserCourtReservationList![
                                                          2]
                                                      .userId,
                                        )
                                      ],
                                    ),
                                  ],
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
                            child: TextButton(
                              onPressed: () {
                                if (selectedUserId != null) {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(); // 기존 팝업 Close
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    updateMisconductGrid(
                                        ref, "retired", selectedUserId!);
                                    callBack(selectedUserId!, context);
                                  });
                                }
                              },
                              child: Text(
                                'save'.tr(),
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop(); // 기존 팝업 Close
                            },
                            child: Text('close'.tr(),
                                style: const TextStyle(fontSize: 24)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          );
        },
      );
    },
  );
}

Future<SimpleResult<void, ApiError>?> requestShuttlecock(
    BuildContext context, WidgetRef ref) async {
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    //if (defaultParam != null && reservation != null) {
    final shuttleCountParam = ShuttleCountParam(
      gymId: defaultParam!.gymId,
      macAddress: defaultParam.macAddress,
      loginKey: defaultParam.loginKey,
      reservationNum: reservation!.reservationNum,
      courtId: reservation.courtId,
    );
    await gameUseCase.shuttleRequest(shuttleCountParam);
  } catch (e) {
    debugPrint("Error in: $e");
  }
  return null;
}

Future<SimpleResult<void, ApiError>?> monitoringRequest(
    BuildContext context, WidgetRef ref, int managerType) async {
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    final selectedCourt = ref.watch(selectedCourtProvider);
    //if (defaultParam != null && reservation != null) {
    final monitoringCallParam = MonitoringCallParam(
      gymId: defaultParam!.gymId,
      macAddress: defaultParam.macAddress,
      loginKey: defaultParam.loginKey,
      reservationNum: reservation == null ? 0 : reservation.reservationNum,
      courtId:
          reservation == null ? selectedCourt!.courtId : reservation.courtId,
      managerType: managerType,
    );
    await gameUseCase.monitoringRequest(monitoringCallParam);
  } catch (e) {
    debugPrint("Error in: $e");
  }
  return null;
}

void requestShuttle(BuildContext context, WidgetRef ref) async {
  requestShuttlecock(context, ref);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
          content: Text('shuttle_requested.'.tr(),
              style: const TextStyle(fontSize: 20)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(); // 기존 팝업 Close
              },
              child: Text('close'.tr(), style: const TextStyle(fontSize: 20)),
            ),
          ]);
    },
  );
  //}
}

void ompCalled(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
          content:
              Text('omp_called'.tr(), style: const TextStyle(fontSize: 20)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(); // 기존 팝업 Close
              },
              child: Text(
                'close'.tr(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ]);
    },
  );
}

void courtError(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
          content:
              Text('court_error'.tr(), style: const TextStyle(fontSize: 20)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(); // 기존 팝업 Close
              },
              child: Text('close'.tr(), style: const TextStyle(fontSize: 20)),
            ),
          ]);
    },
  );
}

void suspension(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
          content: Text('suspend'.tr(), style: TextStyle(fontSize: 20)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(); // 기존 팝업 Close
              },
              child: Text('resume'.tr(), style: const TextStyle(fontSize: 20)),
            ),
          ]);
    },
  );
}

void callInjury(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
          content: Text('referee_medical_called'.tr(),
              style: const TextStyle(fontSize: 20)),
          actions: [
            TextButton(
              onPressed: () {
                monitoringRequest(context, ref, 2);
                monitoringRequest(context, ref, 0);
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context, rootNavigator: true).pop(); // 기존 팝업 Close
              },
              child: Text('close'.tr(), style: const TextStyle(fontSize: 20)),
            ),
          ]);
    },
  );
}

void refereeCall(BuildContext preContext, WidgetRef ref) {
  showDialog(
    context: preContext,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
          content:
              Text('referee_called'.tr(), style: const TextStyle(fontSize: 20)),
          actions: [
            TextButton(
              onPressed: () {
                updateMisconductGrid(ref, "referee", 0);
                Navigator.of(context, rootNavigator: true).pop(); // 기존 팝업 Close
              },
              child: Text('close'.tr(), style: const TextStyle(fontSize: 20)),
            ),
          ]);
    },
  );
}

void warning(Player player, context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
          title: Text(
            "info".tr(),
            style: const TextStyle(fontSize: 24),
          ),
          content: Text('${player.name} was warned for misconduct.',
              style: const TextStyle(fontSize: 20)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context, rootNavigator: true).pop(); // 기존 팝업 Close
              },
              child: Text('close'.tr(), style: const TextStyle(fontSize: 20)),
            ),
          ]);
    },
  );
}

void requestRetired(int loseUserId, context, WidgetRef ref) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
          title: Text(
            "alert".tr(),
            style: const TextStyle(fontSize: 24),
          ),
          content: Text('confirm_retired'.tr(),
              style: const TextStyle(fontSize: 20)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                showEndPopup(
                    context, ref, 'RETIRED', loseUserId); // 기존 팝업 Close
              },
              child: Text('retired'.tr(), style: TextStyle(fontSize: 20)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                undoScores(context, ref);
              },
              child: Text('cancel'.tr(), style: TextStyle(fontSize: 20)),
            ),
          ]);
    },
  );
}

void requestDisqualified(Player player, context, WidgetRef ref) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
          content: Text(
            '${player.name}' 'disqualified_received'.tr(),
            style: const TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context, rootNavigator: true).pop();
                showEndPopup(context, ref, 'DISQUALIFIED', null); // 기존 팝업 Close
              },
              child: Text(
                'close'.tr(),
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ]);
    },
  );
}

void requestInjury(Player player, BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
          title: Text(
            "ok".tr(),
            style: const TextStyle(fontSize: 24),
          ),
          content: Text(
            '${player.name}' 'confirm_referee_medical_call'.tr(),
            style: const TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
              onPressed: () {
                //서버 부상 호출
                updateMisconductGrid(ref, "injury", player.userId);
                monitoringRequest(context, ref, 2);
                monitoringRequest(context, ref, 0);
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'yes_referee_call'.tr(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            TextButton(
              onPressed: () {
                updateMisconductGrid(ref, "injury-only", player.userId);
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context, rootNavigator: true).pop(); // 기존 팝업 Close
              },
              child: Text('no_only_scoresheet'.tr(),
                  style: const TextStyle(fontSize: 20)),
            )
          ]);
    },
  );
}

void requestFaultReferee(Player player, BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
          content: Text(
            '${player.name}' 'fault_received'.tr(),
            style: const TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
              onPressed: () {
                monitoringRequest(context, ref, 0);
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'ok'.tr(),
                style: const TextStyle(fontSize: 20),
              ),
            )
          ]);
    },
  );
}

//팀을 입력하면 해당 팀의 두번 째 userId를 가져오는 함수
int getUserIdWithParticipant(int userId, WidgetRef ref) {
  int userId = 0;
  final aTeamPlayer1ForScoreSheet = ref.read(aTeamPlayer1ForScoreSheetProvider);
  final bTeamPlayer1ForScoreSheet = ref.read(bTeamPlayer1ForScoreSheetProvider);
  if (userId == aTeamPlayer1ForScoreSheet!.userId) {
    userId = aTeamPlayer1ForScoreSheet.userId;
  } else {
    userId = bTeamPlayer1ForScoreSheet!.userId;
  }
  return userId;
}
