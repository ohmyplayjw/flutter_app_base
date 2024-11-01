import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../game_ready/s_game_ready.dart';

const teamNameWidth = 200.0;
const playerNameWidth = 200.0;
const serviceWidth = 30.0;
const height = 30.0;

class ScoresheetPlayerInfo extends ConsumerWidget {
  const ScoresheetPlayerInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aTeamPlayer1 = ref.watch(aTeamPlayer1ForScoreSheetProvider);
    final aTeamPlayer2 = ref.watch(aTeamPlayer2ForScoreSheetProvider);
    final bTeamPlayer1 = ref.watch(bTeamPlayer1ForScoreSheetProvider);
    final bTeamPlayer2 = ref.watch(bTeamPlayer2ForScoreSheetProvider);
    return Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
        child: Column(
          children: [
            ScoresheetPlayer(
                backgroundColor: const Color.fromARGB(255, 222, 222, 222),
                teamName: aTeamPlayer1?.attr1 ?? '',
                playerName: aTeamPlayer1?.name ?? ''),
            ScoresheetPlayer(
                backgroundColor: const Color.fromARGB(255, 222, 222, 222),
                teamName: aTeamPlayer2?.attr1 ?? '',
                playerName: aTeamPlayer2?.name ?? ''),
            ScoresheetPlayer(
                backgroundColor: Colors.white,
                teamName: bTeamPlayer1?.attr1 ?? '',
                playerName: bTeamPlayer1?.name ?? ''),
            ScoresheetPlayer(
                backgroundColor: Colors.white,
                teamName: bTeamPlayer2?.attr1 ?? '',
                playerName: bTeamPlayer2?.name ?? '')
          ],
        ));
  }
}

class ScoresheetPlayer extends StatelessWidget {
  final String teamName;
  final String playerName;
  final Color backgroundColor;

  const ScoresheetPlayer(
      {super.key,
      required this.teamName,
      required this.playerName,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: teamNameWidth,
          child: Container(
              width: teamNameWidth,
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: Colors.black),
              ),
              child: Center(child: teamName.text.bold.make())),
        ),
        SizedBox(
          width: playerNameWidth,
          child: Container(
              width: playerNameWidth,
              height: 30,
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: Colors.black),
              ),
              child: Center(child: playerName.text.bold.make())),
        ),
      ],
    );
  }
}
