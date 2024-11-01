import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_play/popup/w_position_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerCard extends ConsumerWidget {
  const PlayerCard(
      {super.key,
      this.teamColor,
      this.bgColor,
      required this.teamName,
      required this.playerName,
      required this.userId,
      this.blackCard,
      this.redCard,
      this.yellowCard});

  final Color? teamColor;
  final Color? bgColor;
  final String teamName;
  final String playerName;
  final int userId;
  final bool? yellowCard;
  final bool? redCard;
  final bool? blackCard;

  PlayerCard copyWith({
    Color? bgColor,
    Color? teamColor,
    String? teamName,
    String? playerName,
    int? userId,
    bool? yellowCard,
    bool? redCard,
    bool? blackCard,
  }) {
    return PlayerCard(
      bgColor: bgColor ?? this.bgColor,
      teamColor: teamColor ?? this.teamColor,
      teamName: teamName ?? this.teamName,
      playerName: playerName ?? this.playerName,
      userId: userId ?? this.userId,
      yellowCard: yellowCard ?? this.yellowCard,
      redCard: redCard ?? this.redCard,
      blackCard: blackCard ?? this.blackCard,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => {showPositionPopup(context, ref)},
      child: SizedBox(
        width: 200.0,
        height: 130.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: playerName == ''
                    ? const Color.fromARGB(0, 0, 0, 0)
                    : (teamColor ?? const Color(0xff7c94b6)),
                border: playerName == ''
                    ? null
                    : Border.all(
                        width: 1,
                      ),
              ),
              height: 40,
              width: 200.0,
              child: Center(
                  child: teamName.text
                      .color(context.appColors.textBadgeText)
                      .size(24)
                      .make()),
            ),
            Container(
              decoration: BoxDecoration(
                color: playerName == ''
                    ? const Color.fromARGB(0, 0, 0, 0)
                    : (bgColor ?? const Color.fromARGB(255, 255, 255, 255)),
                border: playerName == ''
                    ? null
                    : Border.all(
                        width: 1,
                      ),
              ),
              width: 200.0,
              height: 90,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  blackCard == null
                      ? const Text('')
                      : blackCard!
                          ? Container(
                              width: 15,
                              height: 30,
                              decoration:
                                  const BoxDecoration(color: Colors.black))
                          : const Text(''),
                  redCard == null
                      ? const Text('')
                      : redCard!
                          ? Container(
                              width: 15,
                              height: 30,
                              decoration:
                                  const BoxDecoration(color: Colors.red))
                          : const Text(''),
                  yellowCard == null
                      ? const Text('')
                      : yellowCard!
                          ? Container(
                              width: 15,
                              height: 30,
                              decoration:
                                  const BoxDecoration(color: Colors.yellow))
                          : const Text(''),
                  const SizedBox(
                    width: 10,
                  ),
                  playerName.text.bold
                      .size(24)
                      .color(context.appColors.text)
                      .make()
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
