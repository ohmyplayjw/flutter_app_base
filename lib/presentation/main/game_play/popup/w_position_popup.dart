import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/domain/model/enum_service_type.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_play/vo/enum_service_direction.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_play/widget/w_undo_setting.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_ready/s_position_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/constants.dart';
import '../../game_ready/s_game_ready.dart';
import '../s_play.dart';
import '../widget/w_misconduct_card.dart';

void showPositionPopup(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Builder(builder: (context) {
          var width = MediaQuery.of(context).size.width * 0.5;
          var height = MediaQuery.of(context).size.width * 0.2;
          return SizedBox(
            width: width,
            height: height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('position_setting'.tr(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MisconductCard(
                            cardName: 'swap_left_team'.tr(),
                            imgPath: '$basePath/icon/ic_swap_left.png',
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              swapLeftTeam(ref);
                            }),
                        MisconductCard(
                          cardName: 'swap_court'.tr(),
                          imgPath: '$basePath/icon/ic_swap_court.png',
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).pop();
                            swapCourt(ref);
                          },
                        ),
                        MisconductCard(
                            cardName: 'swap_right_team'.tr(),
                            imgPath: '$basePath/icon/ic_swap_right.png',
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              swapRightTeam(ref);
                            })
                      ],
                    )
                  ],
                ),
                const Divider(),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'close'.tr(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      );
    },
  );
}

void swapLeftTeam(WidgetRef ref) {
  final isPositionChanged = ref.watch(isPositionChangedProvider);
  final aScore = ref.watch(aScoreProvider);
  final bScore = ref.watch(bScoreProvider);
  var serviceOrder = ref.watch(serviceOrderProvider);
  late List<String> newServiceOrder;
  if (isPositionChanged) {
    if (aScore == 0 && bScore == 0) {
      switchBteamPositionWithInitService(ref);
    } else {
      switchBteamPosition(ref);
      if (serviceOrder[0].startsWith("A")) {
        newServiceOrder = swapSecondAndFourthServiceOrder(serviceOrder);
        ref.read(serviceOrderProvider.notifier).state = newServiceOrder;
      } else {
        newServiceOrder = swapFirstAndThirdServiceOrder(serviceOrder);
        ref.read(serviceOrderProvider.notifier).state = newServiceOrder;
      }
    }
    // A가 왼쪽
  } else {
    if (aScore == 0 && bScore == 0) {
      switchAteamPositionWithInitService(ref);
    } else {
      switchAteamPosition(ref);
      if (serviceOrder[0].startsWith("B")) {
        newServiceOrder = swapSecondAndFourthServiceOrder(serviceOrder);
        ref.read(serviceOrderProvider.notifier).state = newServiceOrder;
      } else {
        newServiceOrder = swapFirstAndThirdServiceOrder(serviceOrder);
        ref.read(serviceOrderProvider.notifier).state = newServiceOrder;
      }
    }
  }
}

List<String> swapFirstAndThirdServiceOrder(List<String> serviceOrder) {
  String temp = serviceOrder[0];
  serviceOrder[0] = serviceOrder[2];
  serviceOrder[2] = temp;
  return serviceOrder;
}

List<String> swapSecondAndFourthServiceOrder(List<String> serviceOrder) {
  String temp = serviceOrder[1];
  serviceOrder[1] = serviceOrder[3];
  serviceOrder[3] = temp;
  return serviceOrder;
}

void swapRightTeam(WidgetRef ref) {
  final isPositionChanged = ref.watch(isPositionChangedProvider);
  final aScore = ref.watch(aScoreProvider);
  final bScore = ref.watch(bScoreProvider);
  var serviceOrder = ref.watch(serviceOrderProvider);
  late List<String> newServiceOrder;
  if (isPositionChanged) {
    if (aScore == 0 && bScore == 0) {
      switchAteamPositionWithInitService(ref);
    } else {
      switchAteamPosition(ref);
      if (serviceOrder[0].startsWith("A")) {
        newServiceOrder = swapFirstAndThirdServiceOrder(serviceOrder);
        ref.read(serviceOrderProvider.notifier).state = newServiceOrder;
      } else {
        newServiceOrder = swapSecondAndFourthServiceOrder(serviceOrder);
        ref.read(serviceOrderProvider.notifier).state = newServiceOrder;
      }
    }
  } else {
    // B가 오른쪽
    if (aScore == 0 && bScore == 0) {
      switchBteamPositionWithInitService(ref);
    } else {
      switchBteamPosition(ref);
      if (serviceOrder[0].startsWith("B")) {
        newServiceOrder = swapFirstAndThirdServiceOrder(serviceOrder);
        ref.read(serviceOrderProvider.notifier).state = newServiceOrder;
      } else {
        newServiceOrder = swapSecondAndFourthServiceOrder(serviceOrder);
        ref.read(serviceOrderProvider.notifier).state = newServiceOrder;
      }
    }
  }
}

void swapCourt(WidgetRef ref) {
  final aScore = ref.watch(aScoreProvider);
  final bScore = ref.watch(bScoreProvider);
  final isInitPositionChanged = ref.watch(isInitPositionChangedProvider);
  final currentDirection = ref.watch(serviceDirectionProvider);
  if (aScore == 0 && bScore == 0) {
    ref.read(isInitPositionChangedProvider.notifier).state =
        !isInitPositionChanged;
    courtChangeWithInitService(ref);
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
    ref.read(serviceOrderProvider.notifier).state = serviceOrder;
  } else {
    courtChange(ref);
    switchAteamPosition(ref);
    switchBteamPosition(ref);
    if (currentDirection == ServiceDirection.LLRL) {
      ref.read(serviceDirectionProvider.notifier).state = ServiceDirection.RLLL;
    } else if (currentDirection == ServiceDirection.LRRR) {
      ref.read(serviceDirectionProvider.notifier).state = ServiceDirection.RRLR;
    } else if (currentDirection == ServiceDirection.RLLL) {
      ref.read(serviceDirectionProvider.notifier).state = ServiceDirection.LLRL;
    } else if (currentDirection == ServiceDirection.RRLR) {
      ref.read(serviceDirectionProvider.notifier).state = ServiceDirection.LRRR;
    }
  }
}
