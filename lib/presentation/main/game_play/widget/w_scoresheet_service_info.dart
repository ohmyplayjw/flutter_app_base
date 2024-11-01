import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/model/enum_service_type.dart';
import '../../game_ready/s_game_ready.dart';

const teamNameWidth = 200.0;
const playerNameWidth = 200.0;
const serviceWidth = 30.0;
const height = 30.0;

class ScoresheetServiceInfo extends ConsumerWidget {
  const ScoresheetServiceInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aTeamPlayer1InitService = ref.watch(aTeamPlayer1InitServiceProvider);
    final aTeamPlayer2InitService = ref.watch(aTeamPlayer2InitServiceProvider);
    final bTeamPlayer1InitService = ref.watch(bTeamPlayer1InitServiceProvider);
    final bTeamPlayer2InitService = ref.watch(bTeamPlayer2InitServiceProvider);
    return Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
          bottom: 15.0,
        ),
        child: Column(
          children: [
            ScoresheetService(
                backgroundColor: const Color.fromARGB(255, 222, 222, 222),
                service: aTeamPlayer1InitService ?? Service.fromString(''),
                score: aTeamPlayer1InitService != Service.none
                    ? 0.toString()
                    : ''),
            ScoresheetService(
                backgroundColor: const Color.fromARGB(255, 222, 222, 222),
                service: aTeamPlayer2InitService ?? Service.fromString(''),
                score: aTeamPlayer2InitService != Service.none
                    ? 0.toString()
                    : ''),
            ScoresheetService(
                backgroundColor: Colors.white,
                service: bTeamPlayer1InitService ?? Service.fromString(''),
                score: bTeamPlayer1InitService != Service.none
                    ? 0.toString()
                    : ''),
            ScoresheetService(
                backgroundColor: Colors.white,
                service: bTeamPlayer2InitService ?? Service.fromString(''),
                score:
                    bTeamPlayer2InitService != Service.none ? 0.toString() : '')
          ],
        ));
  }
}

class ScoresheetService extends StatelessWidget {
  final Service service;
  final String score;
  final Color backgroundColor;

  const ScoresheetService(
      {super.key,
      required this.service,
      required this.score,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30.0,
          child: Container(
              width: serviceWidth,
              height: 30,
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: Colors.black),
              ),
              child: Center(child: service.toString().text.make())),
        ),
        SizedBox(
          width: 30.0,
          child: Container(
              width: serviceWidth,
              height: 30,
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: Colors.black),
              ),
              child: Center(child: score.toString().text.make())),
        ),
      ],
    );
  }
}
