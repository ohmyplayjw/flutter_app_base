import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/model/enum_service_type.dart';
import '../../game_ready/s_game_ready.dart';
import '../s_play.dart';
import '../vo/enum_service_direction.dart';
import 'w_player_card.dart';
import 'w_service_info.dart';

class Court extends ConsumerWidget {
  const Court({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aTeamPlayer1 = ref.watch(aTeamPlayer1Provider);
    final aTeamPlayer2 = ref.watch(aTeamPlayer2Provider);
    final bTeamPlayer1 = ref.watch(bTeamPlayer1Provider);
    final bTeamPlayer2 = ref.watch(bTeamPlayer2Provider);
    final serviceDirection = ref.watch(serviceDirectionProvider);
    final isPositionChanged = ref.watch(isPositionChangedProvider);
    final isAteamPositionChanged = ref.watch(isAteamPositionChangedProvider);
    final isBteamPositionChanged = ref.watch(isBteamPositionChangedProvider);

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            width: 1,
          ),
        ),
        height: 262.0,
        width: 750.0,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            PlayerCard(
                bgColor: isAteamPositionChanged
                    ? const Color.fromARGB(255, 255, 255, 235)
                    : Colors.white,
                teamColor: !isPositionChanged
                    ? const Color.fromARGB(255, 108, 148, 114)
                    : const Color(0xff7c94b6),
                userId: isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer2 == null
                            ? 0
                            : bTeamPlayer2.userId
                        : bTeamPlayer1!.userId
                    : isAteamPositionChanged
                        ? aTeamPlayer1!.userId
                        : aTeamPlayer2 == null
                            ? 0
                            : aTeamPlayer2.userId,
                playerName: isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer2 == null
                            ? ''
                            : bTeamPlayer2.playerName
                        : bTeamPlayer1!.playerName
                    : isAteamPositionChanged
                        ? aTeamPlayer1!.playerName
                        : aTeamPlayer2 == null
                            ? ''
                            : aTeamPlayer2.playerName,
                teamName: isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer2 == null
                            ? ''
                            : bTeamPlayer2.teamName
                        : bTeamPlayer1!.teamName
                    : isAteamPositionChanged
                        ? aTeamPlayer1!.teamName
                        : aTeamPlayer2 == null
                            ? ''
                            : aTeamPlayer2.teamName,
                yellowCard: isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer2 == null
                            ? false
                            : bTeamPlayer2.yellowCard
                        : bTeamPlayer1!.yellowCard
                    : isAteamPositionChanged
                        ? aTeamPlayer1!.yellowCard
                        : aTeamPlayer2 == null
                            ? false
                            : aTeamPlayer2.yellowCard,
                redCard: isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer2 == null
                            ? false
                            : bTeamPlayer2.redCard
                        : bTeamPlayer1!.redCard
                    : isAteamPositionChanged
                        ? aTeamPlayer1!.redCard
                        : aTeamPlayer2 == null
                            ? false
                            : aTeamPlayer2.redCard,
                blackCard: isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer2 == null
                            ? false
                            : bTeamPlayer2.blackCard
                        : bTeamPlayer1!.blackCard
                    : isAteamPositionChanged
                        ? aTeamPlayer1!.blackCard
                        : aTeamPlayer2 == null
                            ? false
                            : aTeamPlayer2.blackCard),
            PlayerCard(
                bgColor: isAteamPositionChanged
                    ? Colors.white
                    : const Color.fromARGB(255, 255, 255, 235),
                teamColor: !isPositionChanged
                    ? const Color.fromARGB(255, 108, 148, 114)
                    : const Color(0xff7c94b6),
                userId: isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer1!.userId
                        : bTeamPlayer2 == null
                            ? 0
                            : bTeamPlayer2.userId
                    : isAteamPositionChanged
                        ? aTeamPlayer2 == null
                            ? 0
                            : aTeamPlayer2.userId
                        : aTeamPlayer1!.userId,
                playerName: isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer1!.playerName
                        : bTeamPlayer2 == null
                            ? ''
                            : bTeamPlayer2.playerName
                    : isAteamPositionChanged
                        ? aTeamPlayer2 == null
                            ? ''
                            : aTeamPlayer2.playerName
                        : aTeamPlayer1!.playerName,
                teamName: isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer1!.teamName
                        : bTeamPlayer2 == null
                            ? ''
                            : bTeamPlayer2.teamName
                    : isAteamPositionChanged
                        ? aTeamPlayer2 == null
                            ? ''
                            : aTeamPlayer2.teamName
                        : aTeamPlayer1!.teamName,
                yellowCard: isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer1!.yellowCard
                        : bTeamPlayer2 == null
                            ? false
                            : bTeamPlayer2.yellowCard
                    : isAteamPositionChanged
                        ? aTeamPlayer2 == null
                            ? false
                            : aTeamPlayer2.yellowCard
                        : aTeamPlayer1!.yellowCard,
                redCard: isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer1!.redCard
                        : bTeamPlayer2 == null
                            ? false
                            : bTeamPlayer2.redCard
                    : isAteamPositionChanged
                        ? aTeamPlayer2 == null
                            ? false
                            : aTeamPlayer2.redCard
                        : aTeamPlayer1!.redCard,
                blackCard: isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer1!.blackCard
                        : bTeamPlayer2 == null
                            ? false
                            : bTeamPlayer2.blackCard
                    : isAteamPositionChanged
                        ? aTeamPlayer2 == null
                            ? false
                            : aTeamPlayer2.blackCard
                        : aTeamPlayer1!.blackCard)
          ]),
          Center(
            child: SizedBox(
              child: GestureDetector(
                onTap: () => changeService(ref, serviceDirection),
                child: ServiceInfo(
                  isHidden: false,
                  serviceDirection: serviceDirection,
                ),
              ),
            ),
          ),
          Column(children: [
            PlayerCard(
                bgColor: isBteamPositionChanged
                    ? Colors.white
                    : const Color.fromARGB(255, 255, 255, 235),
                teamColor: !isPositionChanged
                    ? const Color(0xff7c94b6)
                    : const Color.fromARGB(255, 108, 148, 114),
                userId: !isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer2 == null
                            ? 0
                            : bTeamPlayer2.userId
                        : bTeamPlayer1!.userId
                    : isAteamPositionChanged
                        ? aTeamPlayer1!.userId
                        : aTeamPlayer2 == null
                            ? 0
                            : aTeamPlayer2.userId,
                playerName: !isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer2 == null
                            ? ''
                            : bTeamPlayer2.playerName
                        : bTeamPlayer1!.playerName
                    : isAteamPositionChanged
                        ? aTeamPlayer1!.playerName
                        : aTeamPlayer2 == null
                            ? ''
                            : aTeamPlayer2.playerName,
                teamName: !isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer2 == null
                            ? ''
                            : bTeamPlayer2.teamName
                        : bTeamPlayer1!.teamName
                    : isAteamPositionChanged
                        ? aTeamPlayer1!.teamName
                        : aTeamPlayer2 == null
                            ? ''
                            : aTeamPlayer2.teamName,
                yellowCard: !isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer2 == null
                            ? false
                            : bTeamPlayer2.yellowCard
                        : bTeamPlayer1!.yellowCard
                    : isAteamPositionChanged
                        ? aTeamPlayer1!.yellowCard
                        : aTeamPlayer2 == null
                            ? false
                            : aTeamPlayer2.yellowCard,
                redCard: !isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer2 == null
                            ? false
                            : bTeamPlayer2.redCard
                        : bTeamPlayer1!.redCard
                    : isAteamPositionChanged
                        ? aTeamPlayer1!.redCard
                        : aTeamPlayer2 == null
                            ? false
                            : aTeamPlayer2.redCard,
                blackCard: !isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer2 == null
                            ? false
                            : bTeamPlayer2.blackCard
                        : bTeamPlayer1!.blackCard
                    : isAteamPositionChanged
                        ? aTeamPlayer1!.blackCard
                        : aTeamPlayer2 == null
                            ? false
                            : aTeamPlayer2.blackCard),
            PlayerCard(
                bgColor: isBteamPositionChanged
                    ? const Color.fromARGB(255, 255, 255, 235)
                    : Colors.white,
                teamColor: !isPositionChanged
                    ? const Color(0xff7c94b6)
                    : const Color.fromARGB(255, 108, 148, 114),
                userId: !isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer1!.userId
                        : bTeamPlayer2 == null
                            ? 0
                            : bTeamPlayer2.userId
                    : isAteamPositionChanged
                        ? aTeamPlayer2 == null
                            ? 0
                            : aTeamPlayer2.userId
                        : aTeamPlayer1!.userId,
                playerName: !isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer1!.playerName
                        : bTeamPlayer2 == null
                            ? ''
                            : bTeamPlayer2.playerName
                    : isAteamPositionChanged
                        ? aTeamPlayer2 == null
                            ? ''
                            : aTeamPlayer2.playerName
                        : aTeamPlayer1!.playerName,
                teamName: !isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer1!.teamName
                        : bTeamPlayer2 == null
                            ? ''
                            : bTeamPlayer2.teamName
                    : isAteamPositionChanged
                        ? aTeamPlayer2 == null
                            ? ''
                            : aTeamPlayer2.teamName
                        : aTeamPlayer1!.teamName,
                yellowCard: !isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer1!.yellowCard
                        : bTeamPlayer2 == null
                            ? false
                            : bTeamPlayer2.yellowCard
                    : isAteamPositionChanged
                        ? aTeamPlayer2 == null
                            ? false
                            : aTeamPlayer2.yellowCard
                        : aTeamPlayer1!.yellowCard,
                redCard: !isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer1!.redCard
                        : bTeamPlayer2 == null
                            ? false
                            : bTeamPlayer2.redCard
                    : isAteamPositionChanged
                        ? aTeamPlayer2 == null
                            ? false
                            : aTeamPlayer2.redCard
                        : aTeamPlayer1!.redCard,
                blackCard: !isPositionChanged
                    ? isBteamPositionChanged
                        ? bTeamPlayer1!.blackCard
                        : bTeamPlayer2 == null
                            ? false
                            : bTeamPlayer2.blackCard
                    : isAteamPositionChanged
                        ? aTeamPlayer2 == null
                            ? false
                            : aTeamPlayer2.blackCard
                        : aTeamPlayer1!.blackCard)
          ]),
        ]),
      ),
    );
  }
}

void changeService(WidgetRef ref, ServiceDirection serviceDirection) {
  final isServiceEditable =
      ref.read(aScoreProvider) == ref.read(bScoreProvider) &&
          ref.read(aScoreProvider) == 0;
  final gameType = ref.watch(gameTypeProvider);
  final aTeamPlayer1InitService = ref.read(aTeamPlayer1InitServiceProvider);
  final aTeamPlayer2InitService = ref.read(aTeamPlayer2InitServiceProvider);
  final bTeamPlayer1InitService = ref.read(bTeamPlayer1InitServiceProvider);
  final bTeamPlayer2InitService = ref.read(bTeamPlayer2InitServiceProvider);
  final isPositionChanged = ref.watch(isPositionChangedProvider);
  if (isServiceEditable && serviceDirection == ServiceDirection.LRRR) {
    //LRRR일 때는
    ref.read(serviceDirectionProvider.notifier).state = ServiceDirection.RRLR;
    if (gameType == 'D') {
      if (bTeamPlayer1InitService == Service.S &&
          aTeamPlayer1InitService == Service.R) {
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      } else if (bTeamPlayer1InitService == Service.S &&
          aTeamPlayer2InitService == Service.R) {
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.S;
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      } else if (bTeamPlayer2InitService == Service.S &&
          aTeamPlayer1InitService == Service.R) {
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.R;
      } else if (bTeamPlayer2InitService == Service.S &&
          aTeamPlayer2InitService == Service.R) {
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.S;
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.R;
      } else if (aTeamPlayer1InitService == Service.S &&
          bTeamPlayer1InitService == Service.R) {
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      } else if (aTeamPlayer1InitService == Service.S &&
          bTeamPlayer2InitService == Service.R) {
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.S;
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      } else if (aTeamPlayer2InitService == Service.S &&
          bTeamPlayer1InitService == Service.R) {
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.R;
      } else if (aTeamPlayer2InitService == Service.S &&
          bTeamPlayer2InitService == Service.R) {
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.S;
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.R;
      }
    } else {
      if (isPositionChanged) {
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      } else {
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      }
    }
  }
  if (isServiceEditable && serviceDirection == ServiceDirection.RRLR) {
    //RRLR일 때는
    ref.read(serviceDirectionProvider.notifier).state = ServiceDirection.LRRR;
    if (gameType == 'D') {
      if (bTeamPlayer1InitService == Service.S &&
          aTeamPlayer1InitService == Service.R) {
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      } else if (bTeamPlayer1InitService == Service.S &&
          aTeamPlayer2InitService == Service.R) {
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.S;
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      } else if (bTeamPlayer2InitService == Service.S &&
          aTeamPlayer1InitService == Service.R) {
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.R;
      } else if (bTeamPlayer2InitService == Service.S &&
          aTeamPlayer2InitService == Service.R) {
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.S;
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.R;
      } else if (aTeamPlayer1InitService == Service.S &&
          bTeamPlayer1InitService == Service.R) {
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      } else if (aTeamPlayer1InitService == Service.S &&
          bTeamPlayer2InitService == Service.R) {
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.S;
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      } else if (aTeamPlayer2InitService == Service.S &&
          bTeamPlayer1InitService == Service.R) {
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.R;
      } else if (aTeamPlayer2InitService == Service.S &&
          bTeamPlayer2InitService == Service.R) {
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.S;
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.none;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.R;
      }
    } else {
      if (isPositionChanged) {
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      } else {
        ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
        ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      }
    }
  }
}
