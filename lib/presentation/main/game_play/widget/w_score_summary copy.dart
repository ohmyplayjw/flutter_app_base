import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../domain/model/vo_participant.dart';
import '../../game_ready/s_game_ready.dart';
import '../s_play.dart';
import '../vo/vo_team_score.dart';
import 'w_team_score_table.dart';

class ScoreSummary extends ConsumerStatefulWidget {
  ScoreSummary({Key? key}) : super(key: key);

  @override
  _ScoreSummaryState createState() => _ScoreSummaryState();
}

class _ScoreSummaryState extends ConsumerState<ScoreSummary> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadParticipants();
    });
  }

  void _loadParticipants() async {
    settingScore(ref);
  }

  @override
  Widget build(BuildContext context) {
    final isPositionChanged = ref.watch(isPositionChangedProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ref
                    .watch(isPositionChanged
                        ? bTeamAnnouncementProvider
                        : aTeamAnnouncementProvider)
                    .text
                    .color(context.appColors.brightText)
                    .size(16)
                    .make(),
                SizedBox(
                  width: 100,
                  child: AnimatedFlipCounter(
                    value: ref.watch(
                        isPositionChanged ? bScoreProvider : aScoreProvider),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            width20,
            Column(
              children: [
                TeamScoreTable(
                  teamScoreProvider: aTeamScoreProvider,
                ),
                TeamScoreTable(
                  teamScoreProvider: bTeamScoreProvider,
                ),
              ],
            ),
            Column(
              children: [
                ref
                    .watch(isPositionChanged
                        ? aTeamAnnouncementProvider
                        : bTeamAnnouncementProvider)
                    .text
                    .color(context.appColors.brightText)
                    .size(16)
                    .make(),
                SizedBox(
                  width: 100,
                  child: AnimatedFlipCounter(
                    value: ref.watch(
                        isPositionChanged ? aScoreProvider : bScoreProvider),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Center(
          child:
              ref.watch(announcementProvider).toString().text.size(14).make(),
        ),
      ],
    );
  }
}

void settingScore(WidgetRef ref) {
  final aTeamParticipant = ref.read(aTeamParticipantProvider) ??
      Participant(participantId: '', playerList: []);
  final bTeamParticipant = ref.read(bTeamParticipantProvider) ??
      Participant(participantId: '', playerList: []);
  final currentSet = ref.read(currentSetProvider);
  final aTeamName = aTeamParticipant.playerList.length == 1
      ? aTeamParticipant.playerList[0].attr1
      : aTeamParticipant.playerList[0].attr1 ==
              aTeamParticipant.playerList[1].attr1
          ? aTeamParticipant.playerList[0].attr1
          : "${aTeamParticipant.playerList[0].attr1}/${aTeamParticipant.playerList[1].attr1}";
  final aTeamPlayerName = aTeamParticipant.playerList.length == 1
      ? aTeamParticipant.playerList[0].name
      : "${aTeamParticipant.playerList[0].name}/${aTeamParticipant.playerList[1].name}";
  final bTeamName = bTeamParticipant.playerList.length == 1
      ? bTeamParticipant.playerList[0].attr1
      : bTeamParticipant.playerList[0].attr1 ==
              bTeamParticipant.playerList[1].attr1
          ? bTeamParticipant.playerList[0].attr1
          : "${bTeamParticipant.playerList[0].attr1}/${bTeamParticipant.playerList[1].attr1}";
  final bTeamPlayerName = bTeamParticipant.playerList.length == 1
      ? bTeamParticipant.playerList[0].name
      : "${bTeamParticipant.playerList[0].name}/${bTeamParticipant.playerList[1].name}";
  if (currentSet == 1) {
    ref.read(aTeamScoreProvider.notifier).state =
        TeamScore(aTeamName, aTeamPlayerName, 0, 0, 0, 0);
    ref.read(bTeamScoreProvider.notifier).state =
        TeamScore(bTeamName, bTeamPlayerName, 0, 0, 0, 0);
  }
}
