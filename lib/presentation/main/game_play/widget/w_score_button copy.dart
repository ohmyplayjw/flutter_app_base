import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../common/common.dart';
import '../../game_ready/s_game_ready.dart';
import '../popup/w_challenge_request_popup.dart';
import 'package:flutter/services.dart';
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
    return ZoomTapAnimation(
      child: Container(
        alignment: Alignment.center,
        width: 180,
        height: 180,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
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
                const Icon(
                  Icons.keyboard_arrow_up,
                  size: 40,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                'SCORE'.text.color(context.appColors.text).size(30).bold.make(),
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
                    return AlertDialog(
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
                  .color(context.appColors.brightText)
                  .size(26)
                  .bold
                  .make(),
              (challengeCnt > 1 ? 'challenges' : 'challenge')
                  .text
                  .color(context.appColors.brightText)
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
    ref.read(aScoreProvider.notifier).state++;
  } else if (team == 'B') {
    ref.read(bScoreProvider.notifier).state++;
  }
}
