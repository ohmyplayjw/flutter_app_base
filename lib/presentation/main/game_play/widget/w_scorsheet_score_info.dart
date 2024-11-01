import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../s_play.dart';

class ScoresheetScoreInfo extends ConsumerWidget {
  final ScrollController scrollController;
  const ScoresheetScoreInfo({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aTeamPlayer1ScoreGrid = ref.watch(aTeamPlayer1ScoreGridProvider);
    final aTeamPlayer2ScoreGrid = ref.watch(aTeamPlayer2ScoreGridProvider);
    final bTeamPlayer1ScoreGrid = ref.watch(bTeamPlayer1ScoreGridProvider);
    final bTeamPlayer2ScoreGrid = ref.watch(bTeamPlayer2ScoreGridProvider);

    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        bottom: 15.0,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        itemCount: 100,
        itemBuilder: (context, index) {
          return ScoreGrid(
            aTeamPlayer1Score: aTeamPlayer1ScoreGrid[index],
            aTeamPlayer2Score: aTeamPlayer2ScoreGrid[index],
            bTeamPlayer1Score: bTeamPlayer1ScoreGrid[index],
            bTeamPlayer2Score: bTeamPlayer2ScoreGrid[index],
          );
        },
      ),
    );
  }
}

class ScoreGrid extends StatelessWidget {
  final String aTeamPlayer1Score;
  final String aTeamPlayer2Score;
  final String bTeamPlayer1Score;
  final String bTeamPlayer2Score;
  final double height = 30.0;
  final double width = 30.0;

  const ScoreGrid({
    super.key,
    required this.aTeamPlayer1Score,
    required this.aTeamPlayer2Score,
    required this.bTeamPlayer1Score,
    required this.bTeamPlayer2Score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScoreCell(
          score: aTeamPlayer1Score,
          backgroundColor: const Color.fromARGB(255, 222, 222, 222),
        ),
        ScoreCell(
            score: aTeamPlayer2Score,
            backgroundColor: const Color.fromARGB(255, 222, 222, 222)),
        ScoreCell(score: bTeamPlayer1Score, backgroundColor: Colors.white),
        ScoreCell(score: bTeamPlayer2Score, backgroundColor: Colors.white),
      ],
    );
  }
}

class ScoreCell extends StatelessWidget {
  final String score;
  final double height = 30.0;
  final double width = 30.0;
  final Color backgroundColor;

  const ScoreCell(
      {super.key, required this.score, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Colors.black),
        ),
        child: Center(
            child: Text(score,
                style: const TextStyle(fontWeight: FontWeight.bold))),
      ),
    );
  }
}
