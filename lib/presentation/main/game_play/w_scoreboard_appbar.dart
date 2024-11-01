import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/common/widget/timerReverse.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_play/s_play.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_play/widget/w_undo_setting.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_ready/s_position_setting.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/s_court_entrance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/widget/timer.dart';
import '../game_ready/popup/w_umpire_popup.dart';
import '../game_ready/s_game_ready.dart';

class ScoreboardAppBar extends ConsumerWidget implements PreferredSizeWidget {
  ScoreboardAppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 경기 시간 데이터를 가져오기 위해 필요한 Provider를 설정
    final umpire = ref.watch(selectedUmpireProvider);
    final serviceJudge = ref.watch(selectedServiceJudgeProvider);
    final reservation = ref.watch(reservationProvider);
    final elapsedTime = ref.watch(elapsedTimeProvider);
    final elapsedReverseTime = ref.watch(elapsedTimeReverseProvider);
    final currentPage = ref.watch(currentPageProvider);
    final currentSet = ref.watch(currentSetProvider);
    return AppBar(
        elevation: 1,
        shadowColor: const Color.fromARGB(8, 0, 0, 0),
        centerTitle: true,
        title: Text(
          currentPage == 'setting' && currentSet == 1
              ? _formatDuration(elapsedReverseTime)
              : _formatDuration(elapsedTime),
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        leadingWidth: MediaQuery.of(context).size.width * 0.4,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                if (currentPage == 'ready') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CourtEntranceScreen()),
                  );
                } else if (currentPage == 'setting') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CourtEntranceScreen()));
                } else if (currentPage == 'play') {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            width: 400,
                            height: 230,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Text(
                                    'alert'.tr(),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(
                                        'alert_move_setting_screen'.tr(),
                                        style: const TextStyle(fontSize: 20),
                                      ),
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
                                            right: BorderSide(
                                                color: Colors.grey, width: 1),
                                          ),
                                        ),
                                        child: CupertinoDialogAction(
                                            isDefaultAction: true,
                                            child: Text(
                                              "ok".tr(),
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            onPressed: () {
                                              //서버에 보냈던 모든 해당 세트 모든 점수 삭제
                                              final scoreSheetIndex = ref.watch(
                                                  scoreSheetIndexProvider);
                                              for (int i = scoreSheetIndex;
                                                  i >= 0;
                                                  i--) {
                                                undoScores(context, ref);
                                              }
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PositionSettingScreen()),
                                              );
                                            }),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CupertinoDialogAction(
                                          isDefaultAction: true,
                                          child: Text(
                                            "cancel".tr(),
                                            style:
                                                const TextStyle(fontSize: 24),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            (reservation == null)
                ? ''.text.make()
                : "Court ${reservation.courtId} ${reservation.gameName}"
                    .text
                    .color(context.appColors.text)
                    .size(24)
                    .make(),
          ],
        ),
        actions: [
          umpire != null
              ? Text('Umpire : ${umpire.refereeName}')
              : const SizedBox(),
          width20,
          serviceJudge != null
              ? Text('Service Judge : ${serviceJudge.refereeName}')
              : const SizedBox(),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

String _formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return '$minutes:$seconds';
}
