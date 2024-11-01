import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/model/vo_player.dart';
import '../../game_ready/s_game_ready.dart';
import '../s_play.dart';
import '../widget/w_selectable_player_card.dart';

void getPlayerSelectCommonPopup(
    String type,
    void Function(Player, BuildContext) callBack,
    BuildContext context,
    WidgetRef ref) {
  final reservation = ref.watch(reservationProvider);
  final aTeamPlayer1 = ref.watch(aTeamPlayer1Provider);
  final aTeamPlayer2 = ref.watch(aTeamPlayer2Provider);
  final bTeamPlayer1 = ref.watch(bTeamPlayer1Provider);
  final bTeamPlayer2 = ref.watch(bTeamPlayer2Provider);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Player? selectedPlayer;
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            content: Builder(builder: (context) {
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
                      type == "warning"
                          ? 'Select the player who will receive the Warning.'
                          : type == "fault"
                              ? 'Select the player who will receive the Fault.'
                              : type == "injury"
                                  ? 'Select the injured player'
                                  : type == "disqualified"
                                      ? '실격당한 선수를 선택하세요'
                                      : '',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 350,
                      child: reservation == null
                          ? const CircularProgressIndicator()
                          : reservation.gameType == 'S'
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SelectablePlayerCard(
                                      playerName: aTeamPlayer1?.playerName,
                                      teamName: aTeamPlayer1?.teamName,
                                      onTap: () {
                                        setState(() {
                                          selectedPlayer = Player(
                                            participantId: '0',
                                            userId: aTeamPlayer1!.userId,
                                            attr1: aTeamPlayer1.teamName,
                                            name: aTeamPlayer1.playerName,
                                          );
                                        });
                                      },
                                      isSelected: selectedPlayer != null &&
                                          selectedPlayer!.userId ==
                                              aTeamPlayer1!.userId,
                                    ),
                                    SelectablePlayerCard(
                                      playerName: bTeamPlayer1!.playerName,
                                      teamName: bTeamPlayer1.teamName,
                                      onTap: () {
                                        setState(() {
                                          selectedPlayer = Player(
                                            participantId: '0',
                                            userId: bTeamPlayer1.userId,
                                            attr1: bTeamPlayer1.teamName,
                                            name: bTeamPlayer1.playerName,
                                          );
                                        });
                                      },
                                      isSelected: selectedPlayer != null &&
                                          selectedPlayer!.userId ==
                                              bTeamPlayer1.userId,
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
                                          playerName: aTeamPlayer1!.playerName,
                                          teamName: aTeamPlayer1.teamName,
                                          onTap: () {
                                            setState(() {
                                              selectedPlayer = Player(
                                                participantId: '0',
                                                userId: aTeamPlayer1.userId,
                                                attr1: aTeamPlayer1.teamName,
                                                name: aTeamPlayer1.playerName,
                                              );
                                            });
                                          },
                                          isSelected: selectedPlayer != null &&
                                              selectedPlayer!.userId ==
                                                  aTeamPlayer1.userId,
                                        ),
                                        SelectablePlayerCard(
                                          playerName: aTeamPlayer2!.playerName,
                                          teamName: aTeamPlayer2.teamName,
                                          onTap: () {
                                            setState(() {
                                              selectedPlayer = Player(
                                                  participantId: '0',
                                                  userId: aTeamPlayer2.userId,
                                                  attr1: aTeamPlayer2.teamName,
                                                  name:
                                                      aTeamPlayer2.playerName);
                                            });
                                          },
                                          isSelected: selectedPlayer != null &&
                                              selectedPlayer!.userId ==
                                                  aTeamPlayer2.userId,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 30),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SelectablePlayerCard(
                                          playerName: bTeamPlayer1!.playerName,
                                          teamName: bTeamPlayer1.teamName,
                                          onTap: () {
                                            setState(() {
                                              selectedPlayer = Player(
                                                participantId: '0',
                                                userId: bTeamPlayer1.userId,
                                                attr1: bTeamPlayer1.teamName,
                                                name: bTeamPlayer1.playerName,
                                              );
                                            });
                                          },
                                          isSelected: selectedPlayer != null &&
                                              selectedPlayer!.userId ==
                                                  bTeamPlayer1.userId,
                                        ),
                                        SelectablePlayerCard(
                                          playerName: bTeamPlayer2!.playerName,
                                          teamName: bTeamPlayer2.teamName,
                                          onTap: () {
                                            setState(() {
                                              selectedPlayer = Player(
                                                participantId: '0',
                                                userId: bTeamPlayer2.userId,
                                                attr1: bTeamPlayer2.teamName,
                                                name: bTeamPlayer2.playerName,
                                              );
                                            });
                                          },
                                          isSelected: selectedPlayer != null &&
                                              selectedPlayer!.userId ==
                                                  bTeamPlayer2.userId,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                    ),
                  ],
                ),
              );
            }),
            actions: [
              TextButton(
                onPressed: () {
                  if (selectedPlayer != null) {
                    updateMisconductGrid(ref, type, selectedPlayer!.userId);
                    callBack(selectedPlayer!, context);
                  } // 기존 팝업 Close
                },
                child: Text('save'.tr()),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // 기존 팝업 Close
                },
                child: Text('close'.tr()),
              ),
            ],
          );
        },
      );
    },
  );
}
