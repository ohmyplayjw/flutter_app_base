import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../vo/vo_team_score.dart';

const teamNameWidth = 200.0;
const playerNameWidth = 200.0;
const scoreWidth = 60.0;
const height = 59.0;

class TeamScoreTable extends ConsumerWidget {
  final StateProvider<TeamScore> teamScoreProvider;
  const TeamScoreTable({super.key, required this.teamScoreProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamScore = ref.watch(teamScoreProvider);
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: teamNameWidth,
            decoration:
                BoxDecoration(color: Colors.white, border: Border.all()),
            child: teamScore.teamName.text
                .size(20)
                .bold
                .color(context.appColors.text)
                .overflow(TextOverflow.fade)
                .maxLines(1)
                .softWrap(false)
                .make()),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: playerNameWidth,
            decoration:
                BoxDecoration(color: Colors.white, border: Border.all()),
            // ignore: prefer_interpolation_to_compose_strings
            child: teamScore.playerName.text
                .size(20)
                .bold
                .color(context.appColors.text)
                .overflow(TextOverflow.fade)
                .maxLines(1)
                .softWrap(false)
                .make()),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: scoreWidth,
          decoration: BoxDecoration(
              color: context.appColors.blueBackground, border: Border.all()),
          child: Center(
              child: AnimatedFlipCounter(
            value: teamScore.setScore,
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: scoreWidth,
          decoration: BoxDecoration(color: Colors.white, border: Border.all()),
          child: Center(
              child: AnimatedFlipCounter(
            value: teamScore.set1Score,
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: scoreWidth,
            decoration:
                BoxDecoration(color: Colors.white, border: Border.all()),
            child: Center(
                child: AnimatedFlipCounter(
              value: teamScore.set2Score,
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ))),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: scoreWidth,
          decoration: BoxDecoration(color: Colors.white, border: Border.all()),
          child: Center(
              child: AnimatedFlipCounter(
            value: teamScore.set3Score,
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ],
    );
  }
}
