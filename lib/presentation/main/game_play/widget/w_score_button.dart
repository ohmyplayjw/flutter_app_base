import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../common/common.dart';
import '../../game_ready/s_game_ready.dart';
import '../popup/w_challenge_request_popup.dart';
import 'package:flutter/services.dart';

import '../s_play.dart';
// Added: Material related widgets needed

class TeamScoreSection extends ConsumerWidget {
  final String team;
  final int challengeCnt;

  const TeamScoreSection({
    super.key,
    required this.team,
    required this.challengeCnt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ChallengeButton(challengeCnt: challengeCnt, team: team),
        height30,
        ScoreButton(team: team),
      ],
    );
  }
}

class ScoreButton extends ConsumerWidget {
  final String team;

  const ScoreButton({
    super.key,
    required this.team,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aScore = ref.watch(aScoreProvider);
    final bScore = ref.watch(bScoreProvider);
    final aTeamAnnouncement = ref.watch(aTeamAnnouncementProvider);
    final bTeamAnnouncement = ref.watch(bTeamAnnouncementProvider);
    final winTeam = ref.watch(winTeamProvider);
    return ZoomTapAnimation(
      child: Container(
        alignment: Alignment.center,
        width: 190,
        height: 200,
        decoration: BoxDecoration(
          color:
              (winTeam == "A" && team == "A" || winTeam == "B" && team == "B")
                  ? const Color.fromARGB(255, 246, 255, 0)
                  : (winTeam == "B" && team == "A") ||
                          (winTeam == "A" && team == "B")
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : const Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Tap(
          onTap: () async {
            HapticFeedback.vibrate();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const Center(child: CircularProgressIndicator());
              },
            );
            await Future.delayed(const Duration(milliseconds: 100));
            getScore(ref, team);
            Navigator.of(context).pop();
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                team == "A"
                    ? aTeamAnnouncement.text
                        .color(context.appColors.text)
                        .size(17)
                        .bold
                        .make()
                    : bTeamAnnouncement.text
                        .color(context.appColors.text)
                        .size(17)
                        .bold
                        .make(),
                AnimatedFlipCounter(
                  value: team == "A" ? aScore : bScore,
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 85,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "SCORE"
                        .text
                        .color(context.appColors.text)
                        .size(25)
                        .bold
                        .make(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChallengeButton extends StatelessWidget {
  const ChallengeButton(
      {super.key, required this.challengeCnt, required this.team});

  final int challengeCnt;
  final String team;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 124, 125, 129),
          borderRadius: BorderRadius.all(Radius.circular(500)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Tap(
          onTap: () {
            if (challengeCnt == 0) {
              showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      content: const Text(
                        '챌린지를 더 이상 쓸 수 없습니다.',
                        style: TextStyle(fontSize: 20),
                      ),
                      actions: [
                        CupertinoDialogAction(
                            isDefaultAction: true,
                            child: const Text("확인"),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    );
                  });
            } else {
              showChallengeRequestPopup(context, team);
            }
          },
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              challengeCnt.text
                  .color(context.appColors.textBadgeText)
                  .size(26)
                  .bold
                  .make(),
              (challengeCnt > 1 ? 'challenges' : 'challenge')
                  .text
                  .color(context.appColors.textBadgeText)
                  .size(12)
                  .bold
                  .make(),
            ],
          )),
        ),
      ),
    );
  }
}

void getScore(WidgetRef ref, String team) {
  if (team == 'A') {
    ref.read(winTeamProvider.notifier).state = team;
    ref.read(aScoreProvider.notifier).state++;
  } else if (team == 'B') {
    ref.read(winTeamProvider.notifier).state = team;
    ref.read(bScoreProvider.notifier).state++;
  }
}
