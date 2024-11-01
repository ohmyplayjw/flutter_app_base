import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/domain/model/enum_service_type.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_ready/popup/w_umpire_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../game_play/s_play.dart';
import '../s_game_ready.dart';

void showLoadPrevGamePopup(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var width = MediaQuery.of(context).size.width * 0.5;
      var height = MediaQuery.of(context).size.height * 0.3;
      return Dialog(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                    child: Center(
                        child: Text(
                  'progress_comment'.tr(),
                  style: const TextStyle(fontSize: 20),
                ))),
              )),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          ref.read(isPlayedBeforeProvider.notifier).state =
                              true;
                          ref
                              .read(aTeamPlayer1InitServiceProvider.notifier)
                              .state = Service.none;
                          ref
                              .read(aTeamPlayer2InitServiceProvider.notifier)
                              .state = Service.none;
                          ref
                              .read(bTeamPlayer1InitServiceProvider.notifier)
                              .state = Service.none;
                          ref
                              .read(bTeamPlayer2InitServiceProvider.notifier)
                              .state = Service.none;
                          final reservation = ref.watch(reservationProvider);
                          ref.read(gameTypeProvider.notifier).state =
                              reservation!.gameType;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PlayScreen()),
                          );
                        },
                        child: Text('continue'.tr(),
                            style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showUmpirePopup(context, ref);
                      },
                      child: Text(
                        'from_begining'.tr(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
