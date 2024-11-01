import 'dart:math';

import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/domain/model/enum_service_type.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/game_play/widget/w_undo_setting.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/presentation/main/s_court_entrance.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widget/timer.dart';
import '../../../common/widget/timerReverse.dart';
import '../game_play/s_play.dart';
import '../game_play/vo/enum_service_direction.dart';
import '../game_play/w_scoreboard_appbar.dart';
import '../game_play/widget/w_court.dart';
import '../game_play/widget/w_scoresheet.dart';
import '../game_play/widget/w_shuttle_count.dart';
import '../login/s_login.dart';
import 's_game_ready.dart';

final isInitPositionChangedProvider = StateProvider((ref) => false);
final isInitATeamPositionChangedProvider = StateProvider((ref) => false);
final isInitBTeamPositionChangedProvider = StateProvider((ref) => false);

class PositionSettingScreen extends ConsumerStatefulWidget {
  @override
  _PositionSettingScreenState createState() => _PositionSettingScreenState();
}

class _PositionSettingScreenState extends ConsumerState<PositionSettingScreen> {
  late ElapsedTimeReverseNotifier _elapsedTimeReverseNotifier;
  @override
  void initState() {
    super.initState();
    _elapsedTimeReverseNotifier = ref.read(elapsedTimeReverseProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initValues();
    });
  }

  void initValues() {
    ref.read(currentPageProvider.notifier).state = 'setting';
    // ignore: prefer_interpolation_to_compose_strings
    ref.read(aScoreProvider.notifier).state = 0;
    ref.read(bScoreProvider.notifier).state = 0;
    ref.read(aTeamPlayer1ScoreGridProvider.notifier).state =
        List.filled(100, '');
    ref.read(aTeamPlayer2ScoreGridProvider.notifier).state =
        List.filled(100, '');
    ref.read(bTeamPlayer1ScoreGridProvider.notifier).state =
        List.filled(100, '');
    ref.read(bTeamPlayer2ScoreGridProvider.notifier).state =
        List.filled(100, '');
    ref.read(serviceOverCntProvider.notifier).state = 0;
    ref.read(serviceDirectionProvider.notifier).state = ServiceDirection.LRRR;
    ref.read(aTeamChallengeCntProvider.notifier).state =
        ref.read(scoreboardSettingProvider)!.challengeCnt;
    ref.read(bTeamChallengeCntProvider.notifier).state =
        ref.read(scoreboardSettingProvider)!.challengeCnt;
    ref.read(intervalGivenProvider.notifier).state = false;
    ref.read(isIntervalProvider.notifier).state = false;
    ref.read(serviceOrderProvider.notifier).state = [];
    final currentSet = ref.watch(currentSetProvider);
    final reservation = ref.watch(reservationProvider);
    final isPositionChanged = ref.watch(isPositionChangedProvider);

    updateParticipants(ref, reservation);
    ref.read(aScoreProvider.notifier).state = 0;
    ref.read(bScoreProvider.notifier).state = 0;
    ref.read(misconductCntProvider.notifier).state = 0;
    ref.read(aTeamChallengeCntProvider.notifier).state =
        ref.read(scoreboardSettingProvider)!.challengeCnt;
    ref.read(bTeamChallengeCntProvider.notifier).state =
        ref.read(scoreboardSettingProvider)!.challengeCnt;
    final aTeamScore = ref.watch(aTeamScoreProvider);
    final bTeamScore = ref.watch(bTeamScoreProvider);
    if (currentSet == 2) {
      if (!isPositionChanged) {
        ref.read(isAteamPositionChangedProvider.notifier).state = false;
        ref.read(isBteamPositionChangedProvider.notifier).state = false;
        ref.read(isInitATeamPositionChangedProvider.notifier).state = false;
        ref.read(isInitBTeamPositionChangedProvider.notifier).state = false;
      } else {
        ref.read(isAteamPositionChangedProvider.notifier).state = true;
        ref.read(isBteamPositionChangedProvider.notifier).state = true;
        ref.read(isInitATeamPositionChangedProvider.notifier).state = true;
        ref.read(isInitBTeamPositionChangedProvider.notifier).state = true;
      }
      ref.read(serviceOrderProvider.notifier).state = [];
      courtChangeWithInitService(ref);
      if (aTeamScore.set1Score > bTeamScore.set1Score) {
        if (isPositionChanged) {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.LRRR;
          ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.S;
          ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        } else {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.RRLR;
          ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.S;
          ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        }
      } else {
        if (isPositionChanged) {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.RRLR;
          ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.R;
          ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        } else {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.LRRR;
          ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.R;
          ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        }
      }

      showIntervalPopup(context, ref, reservation!.courtId, 120);
    } else if (currentSet == 3) {
      if (!isPositionChanged) {
        ref.read(isAteamPositionChangedProvider.notifier).state = false;
        ref.read(isBteamPositionChangedProvider.notifier).state = false;
        ref.read(isInitATeamPositionChangedProvider.notifier).state = false;
        ref.read(isInitBTeamPositionChangedProvider.notifier).state = false;
      } else {
        ref.read(isAteamPositionChangedProvider.notifier).state = true;
        ref.read(isBteamPositionChangedProvider.notifier).state = true;
        ref.read(isInitATeamPositionChangedProvider.notifier).state = true;
        ref.read(isInitBTeamPositionChangedProvider.notifier).state = true;
      }
      ref.read(serviceOrderProvider.notifier).state = [];
      courtChangeWithInitService(ref);
      if (aTeamScore.set2Score > bTeamScore.set2Score) {
        if (isPositionChanged) {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.LRRR;
          ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.S;
          ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        } else {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.RRLR;
          ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.S;
          ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.R;
        }
      } else {
        if (isPositionChanged) {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.RRLR;
          ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.R;
          ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        } else {
          ref.read(serviceDirectionProvider.notifier).state =
              ServiceDirection.LRRR;
          ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.R;
          ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.S;
        }
      }
      showIntervalPopup(context, ref, reservation!.courtId, 120);
    } else {
      ref.read(isAteamPositionChangedProvider.notifier).state = false;
      ref.read(isBteamPositionChangedProvider.notifier).state = false;
      ref.read(isInitATeamPositionChangedProvider.notifier).state = false;
      ref.read(isInitBTeamPositionChangedProvider.notifier).state = false;
      ref.read(isInitPositionChangedProvider.notifier).state = false;
      ref.read(isPositionChangedProvider.notifier).state = false;
      _elapsedTimeReverseNotifier.stopTimer();
      _elapsedTimeReverseNotifier.resetTimer();
      _elapsedTimeReverseNotifier.startTimer();
    }
    //카드 초기화
    firebaseUpdateGameScore(ref, 0, 0);
  }

  @override
  void dispose() {
    _elapsedTimeReverseNotifier.stopTimer();
    _elapsedTimeReverseNotifier.resetTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    final reservationList = ref.watch(reservationListProvider);
    final firstReservation = reservationList.when(
      data: (reservations) =>
          reservations.isNotEmpty ? reservations.first : null,
      loading: () => null,
      error: (error, stackTrace) => null,
    );
    final gameType = ref.watch(gameTypeProvider);
    return Scaffold(
      appBar: ScoreboardAppBar(),
      body: PopScope(
        canPop: false,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 2,
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PlayScreen()),
                              );
                            },
                            child: Container(
                              width: 300,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: context.appColors.redBtnColor,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  'Love All Play'
                                      .text
                                      .color(Colors.white)
                                      .size(24)
                                      .bold
                                      .make(),
                                  width20,
                                  Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(70))),
                                      child: Icon(
                                        EvaIcons.arrowRight,
                                        size: 30,
                                        color: context.appColors.redBtnColor,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              EvaIcons.swapOutline,
                              size: 64,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              //A팀, B팀 위치 변경
                              courtChangeWithInitService(ref);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: ShuttleCount(),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 1,
                        child: (firstReservation == null)
                            ? const SizedBox()
                            : gameType == 'D'
                                ? Transform.rotate(
                                    angle: pi / 2,
                                    child: IconButton(
                                      icon: const Icon(
                                        EvaIcons.swapOutline,
                                        size: 64,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        switchAteamPositionWithInitService(ref);
                                      },
                                    ),
                                  )
                                : const SizedBox()),
                    const Flexible(flex: 3, child: Court()),
                    Flexible(
                        flex: 1,
                        child: (firstReservation == null)
                            ? const SizedBox()
                            : gameType == 'D'
                                ? Transform.rotate(
                                    angle: pi / 2,
                                    child: IconButton(
                                      icon: const Icon(
                                        EvaIcons.swapOutline,
                                        size: 64,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        switchBteamPositionWithInitService(ref);
                                      },
                                    ),
                                  )
                                : const SizedBox()),
                  ],
                )),
            Flexible(
                flex: 1, child: Scoresheet(scrollController: _scrollController))
          ],
        ),
      ),
    );
  }
}

void courtChangeWithInitService(WidgetRef ref) async {
  final gameType = ref.watch(gameTypeProvider);
  final currentSet = ref.watch(currentSetProvider);
  if (gameType == 'D') {
    //복식일 때 서비스 권과 함께 court Change
    ref.read(isInitPositionChangedProvider.notifier).state =
        (!ref.watch(isInitPositionChangedProvider));
    final isInitATeamPositionChanged =
        ref.watch(isInitATeamPositionChangedProvider);
    final isInitBTeamPositionChanged =
        ref.watch(isInitBTeamPositionChangedProvider);
    ref.read(isInitATeamPositionChangedProvider.notifier).state =
        (!isInitATeamPositionChanged);
    ref.read(isInitBTeamPositionChangedProvider.notifier).state =
        (!isInitBTeamPositionChanged);
    ref.read(isPositionChangedProvider.notifier).state =
        (!ref.watch(isPositionChangedProvider));
    ref.read(isAteamPositionChangedProvider.notifier).state =
        (!ref.watch(isAteamPositionChangedProvider));
    ref.read(isBteamPositionChangedProvider.notifier).state =
        (!ref.watch(isBteamPositionChangedProvider));
    final aTeamPlayer1InitService = ref.watch(aTeamPlayer1InitServiceProvider);
    final aTeamPlayer2InitService = ref.watch(aTeamPlayer2InitServiceProvider);
    final bTeamPlayer1InitService = ref.watch(bTeamPlayer1InitServiceProvider);
    final bTeamPlayer2InitService = ref.watch(bTeamPlayer2InitServiceProvider);
    if ((isInitATeamPositionChanged && isInitBTeamPositionChanged) ||
        (!isInitATeamPositionChanged && !isInitBTeamPositionChanged)) {
      ref.read(aTeamPlayer1InitServiceProvider.notifier).state =
          bTeamPlayer1InitService;
      ref.read(aTeamPlayer2InitServiceProvider.notifier).state =
          bTeamPlayer2InitService;
      ref.read(bTeamPlayer1InitServiceProvider.notifier).state =
          aTeamPlayer1InitService;
      ref.read(bTeamPlayer2InitServiceProvider.notifier).state =
          aTeamPlayer2InitService;
    } else if ((isInitATeamPositionChanged && !isInitBTeamPositionChanged) ||
        (!isInitATeamPositionChanged && isInitBTeamPositionChanged)) {
      ref.read(aTeamPlayer1InitServiceProvider.notifier).state =
          bTeamPlayer2InitService;
      ref.read(aTeamPlayer2InitServiceProvider.notifier).state =
          bTeamPlayer1InitService;
      ref.read(bTeamPlayer1InitServiceProvider.notifier).state =
          aTeamPlayer2InitService;
      ref.read(bTeamPlayer2InitServiceProvider.notifier).state =
          aTeamPlayer1InitService;
    }
  } else {
    ref.read(isInitPositionChangedProvider.notifier).state =
        !ref.watch(isInitPositionChangedProvider);
    ref.read(isPositionChangedProvider.notifier).state =
        !ref.watch(isPositionChangedProvider);
    switchAteamPosition(ref);
    switchBteamPosition(ref);
    final aTeamPlayer1InitService = ref.watch(aTeamPlayer1InitServiceProvider);
    final aTeamPlayer2InitService = ref.watch(aTeamPlayer2InitServiceProvider);
    final bTeamPlayer1InitService = ref.watch(bTeamPlayer1InitServiceProvider);
    final bTeamPlayer2InitService = ref.watch(bTeamPlayer2InitServiceProvider);
    ref.read(aTeamPlayer1InitServiceProvider.notifier).state =
        bTeamPlayer1InitService;
    ref.read(aTeamPlayer2InitServiceProvider.notifier).state =
        bTeamPlayer2InitService;
    ref.read(bTeamPlayer1InitServiceProvider.notifier).state =
        aTeamPlayer1InitService;
    ref.read(bTeamPlayer2InitServiceProvider.notifier).state =
        aTeamPlayer2InitService;
  }
  updateGameScore(ref, 0, 0, false, currentSet);
  firebaseUpdateGameScore(ref, 0, 0);
}

void courtChange(WidgetRef ref) {
  ref.read(isPositionChangedProvider.notifier).state =
      (!ref.watch(isPositionChangedProvider));
  final aScore = ref.watch(aScoreProvider);
  final bScore = ref.watch(bScoreProvider);
  firebaseUpdateGameScore(ref, aScore, bScore);
  // ref.read(isAteamPositionChangedProvider.notifier).state =
  //     !ref.watch(isAteamPositionChangedProvider);
  // ref.read(isBteamPositionChangedProvider.notifier).state =
  //     !ref.watch(isBteamPositionChangedProvider);
  // final aTeamPlayer1 = ref.watch(aTeamPlayer1Provider);
  // final aTeamPlayer2 = ref.watch(aTeamPlayer2Provider);
  // final bTeamPlayer1 = ref.watch(bTeamPlayer1Provider);
  // final bTeamPlayer2 = ref.watch(bTeamPlayer2Provider);

  // ref.read(aTeamPlayer1Provider.notifier).state = bTeamPlayer1;
  // ref.read(aTeamPlayer2Provider.notifier).state = bTeamPlayer2;
  // ref.read(bTeamPlayer1Provider.notifier).state = aTeamPlayer1;
  // ref.read(bTeamPlayer2Provider.notifier).state = aTeamPlayer2;
}

void switchAteamPositionWithInitService(WidgetRef ref) async {
  final isInitPositionChanged = ref.watch(isInitPositionChangedProvider);
  // final aTeamPlayer1 = ref.watch(aTeamPlayer1Provider);
  // final aTeamPlayer2 = ref.watch(aTeamPlayer2Provider);
  // ref.read(aTeamPlayer1Provider.notifier).state = aTeamPlayer2;
  // ref.read(aTeamPlayer2Provider.notifier).state = aTeamPlayer1;
  final isInitATeamPositionChanged =
      ref.watch(isInitATeamPositionChangedProvider);
  final isInitBTeamPositionChanged =
      ref.watch(isInitBTeamPositionChangedProvider);

  await Future.microtask(() {});
  if (!isInitPositionChanged) {
    ref.read(isAteamPositionChangedProvider.notifier).state =
        (!ref.watch(isAteamPositionChangedProvider));
    ref.read(isInitATeamPositionChangedProvider.notifier).state =
        !isInitATeamPositionChanged;
    final aTeamPlayer1InitService = ref.watch(aTeamPlayer1InitServiceProvider);
    final aTeamPlayer2InitService = ref.watch(aTeamPlayer2InitServiceProvider);
    ref.read(aTeamPlayer1InitServiceProvider.notifier).state =
        aTeamPlayer2InitService;
    ref.read(aTeamPlayer2InitServiceProvider.notifier).state =
        aTeamPlayer1InitService;
  } else {
    ref.read(isBteamPositionChangedProvider.notifier).state =
        (!ref.watch(isBteamPositionChangedProvider));
    ref.read(isInitBTeamPositionChangedProvider.notifier).state =
        !isInitBTeamPositionChanged;
    final bTeamPlayer1InitService = ref.watch(bTeamPlayer1InitServiceProvider);
    final bTeamPlayer2InitService = ref.watch(bTeamPlayer2InitServiceProvider);
    ref.read(bTeamPlayer1InitServiceProvider.notifier).state =
        bTeamPlayer2InitService;
    ref.read(bTeamPlayer2InitServiceProvider.notifier).state =
        bTeamPlayer1InitService;
  }
}

void switchBteamPositionWithInitService(WidgetRef ref) async {
  final isInitPositionChanged = ref.watch(isInitPositionChangedProvider);
  final isInitATeamPositionChanged =
      ref.watch(isInitATeamPositionChangedProvider);
  final isInitBTeamPositionChanged =
      ref.watch(isInitBTeamPositionChangedProvider);

  await Future.microtask(() {});
  if (!isInitPositionChanged) {
    ref.read(isBteamPositionChangedProvider.notifier).state =
        (!ref.watch(isBteamPositionChangedProvider));
    ref.read(isInitBTeamPositionChangedProvider.notifier).state =
        !isInitBTeamPositionChanged;
    final bTeamPlayer1InitService = ref.watch(bTeamPlayer1InitServiceProvider);
    final bTeamPlayer2InitService = ref.watch(bTeamPlayer2InitServiceProvider);
    ref.read(bTeamPlayer1InitServiceProvider.notifier).state =
        bTeamPlayer2InitService;
    ref.read(bTeamPlayer2InitServiceProvider.notifier).state =
        bTeamPlayer1InitService;
  } else {
    ref.read(isAteamPositionChangedProvider.notifier).state =
        (!ref.watch(isAteamPositionChangedProvider));
    ref.read(isInitATeamPositionChangedProvider.notifier).state =
        !isInitATeamPositionChanged;
    final aTeamPlayer1InitService = ref.watch(aTeamPlayer1InitServiceProvider);
    final aTeamPlayer2InitService = ref.watch(aTeamPlayer2InitServiceProvider);
    ref.read(aTeamPlayer1InitServiceProvider.notifier).state =
        aTeamPlayer2InitService;
    ref.read(aTeamPlayer2InitServiceProvider.notifier).state =
        aTeamPlayer1InitService;
  }
}
