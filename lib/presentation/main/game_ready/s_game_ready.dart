import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widget/timer.dart';
import '../../../data/models/vo_court_param.dart';
import '../../../data/models/vo_game_start_param.dart';
import '../../../data/models/vo_liveop_response.dart';
import '../../../data/models/vo_reservation_list.dart';
import '../../../data/network/result/api_error.dart';
import '../../../data/simple_result.dart';
import '../../../domain/model/enum_service_type.dart';
import '../../../domain/model/vo_court.dart';
import '../../../domain/model/vo_participant.dart';
import '../../../domain/model/vo_player.dart';
import '../../../domain/model/vo_reservation.dart';
import '../../controller/auth_controller.dart';
import '../../controller/game_controller.dart';
import '../../controller/gym_controller.dart';
import '../game_play/popup/w_setting_popup.dart';
import '../game_play/s_play.dart';
import '../game_play/vo/vo_team_score.dart';
import '../game_play/w_scoreboard_appbar.dart';
import '../game_play/widget/w_player_card.dart';
import '../s_court_entrance.dart';
import 'popup/w_load_prev_game_popup.dart';
import 'popup/w_umpire_popup.dart';

final reservationListProvider = FutureProvider<List<Reservation>>((ref) async {
  final selectedCourt = ref.watch(selectedCourtProvider);
  if (selectedCourt == null) {
    throw Exception("no court selected");
  }
  final defaultParam = ref.watch(defaultParamProvider);
  final courtParam = CourtParam(
    gymId: defaultParam!.gymId,
    loginKey: defaultParam.loginKey,
    macAddress: defaultParam.macAddress,
    courtId: selectedCourt.courtId.toString(),
  );
  final courtsUseCase = ref.read(gymUseCaseProvider);
  final result = await courtsUseCase.getReservations(courtParam);
  if (result.isSuccess) {
    return result.successData.reservations;
  } else {
    throw Exception(result.failureData.message);
  }
});

final reservationsProvider = StateProvider<ReservationList?>((ref) => null);
final isCameraChangedProvider = StateProvider((ref) => false);

final aTeamParticipantProvider = StateProvider<Participant?>((ref) => null);
final bTeamParticipantProvider = StateProvider<Participant?>((ref) => null);
final aTeamPlayer1Provider = StateProvider<PlayerCard?>((ref) => null);
final aTeamPlayer2Provider = StateProvider<PlayerCard?>((ref) => null);
final bTeamPlayer1Provider = StateProvider<PlayerCard?>((ref) => null);
final bTeamPlayer2Provider = StateProvider<PlayerCard?>((ref) => null);
final aTeamPlayer1ForScoreSheetProvider = StateProvider<Player?>((ref) => null);
final aTeamPlayer2ForScoreSheetProvider = StateProvider<Player?>((ref) => null);
final bTeamPlayer1ForScoreSheetProvider = StateProvider<Player?>((ref) => null);
final bTeamPlayer2ForScoreSheetProvider = StateProvider<Player?>((ref) => null);
final aTeamPlayer1InitServiceProvider =
    StateProvider<Service?>((ref) => Service.S);
final aTeamPlayer2InitServiceProvider =
    StateProvider<Service?>((ref) => Service.none);
final bTeamPlayer1InitServiceProvider =
    StateProvider<Service?>((ref) => Service.R);
final bTeamPlayer2InitServiceProvider =
    StateProvider<Service?>((ref) => Service.none);
final reservationNumProvider = StateProvider((ref) => 0);
final reservationProvider = StateProvider<Reservation?>((ref) => null);
final gameTypeProvider = StateProvider<String?>((ref) => 'S');
final aTeamScoreProvider =
    StateProvider<TeamScore>((ref) => TeamScore('', '', 0, 0, 0, 0));
final bTeamScoreProvider =
    StateProvider<TeamScore>((ref) => TeamScore('', '', 0, 0, 0, 0));
final currentSetProvider = StateProvider((ref) => 1);
final winTeamProvider = StateProvider((ref) => "");
final aScoreProvider = StateProvider((ref) => 0);
final bScoreProvider = StateProvider((ref) => 0);
final misconductCntProvider = StateProvider((ref) => 0);
final intervalGivenProvider = StateProvider((ref) => false);
final aTeamChallengeCntProvider = StateProvider((ref) => 2);
final bTeamChallengeCntProvider = StateProvider((ref) => 2);
final refereeNameProvider = StateProvider((ref) => '');
final refereeTypeProvider = StateProvider((ref) => 'L');
final isPlayedBeforeProvider = StateProvider((ref) => false);
final shuttleCounterProvider = StateProvider((ref) => 0);

class GameReadyScreen extends ConsumerStatefulWidget {
  final Court court;
  const GameReadyScreen({Key? key, required this.court}) : super(key: key);

  @override
  _GameReadyScreenState createState() => _GameReadyScreenState();
}

class _GameReadyScreenState extends ConsumerState<GameReadyScreen> {
  late ElapsedTimeNotifier _elapsedTimeNotifier;
  @override
  void initState() {
    super.initState();
    _elapsedTimeNotifier = ref.read(elapsedTimeProvider.notifier);
    Future.microtask(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //ref.refresh(reservationsProvider);
      ref.read(reservationProvider.notifier).state = null;
      await Future.delayed(const Duration(milliseconds: 500));
      _loadReservationAndUpdateParticipants();
    });
  }

  void _loadReservationAndUpdateParticipants() async {
    _elapsedTimeNotifier.stopTimer();
    _elapsedTimeNotifier.resetTimer();
    await getReservations(ref);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    await Future.delayed(const Duration(milliseconds: 100));
    ref.read(selectedUmpireProvider.notifier).state = null;
    ref.read(selectedServiceJudgeProvider.notifier).state = null;
    ref.read(shuttleCounterProvider.notifier).state = 0;
    ref.read(currentPageProvider.notifier).state = 'ready';
    ref.read(currentSetProvider.notifier).state = 1;
    ref.read(aTeamScoreProvider.notifier).state = TeamScore('', '', 0, 0, 0, 0);
    ref.read(bTeamScoreProvider.notifier).state = TeamScore('', '', 0, 0, 0, 0);

    try {
      final reservationList = await ref.watch(reservationsProvider);
      if (reservationList!.reservations.isNotEmpty) {
        ref.read(reservationProvider.notifier).state =
            reservationList.reservations[0];
        if (reservationList.reservations[0].startUse == 0) {
          Navigator.of(context).pop();
          updateParticipants(ref, reservationList.reservations[0]);
        } else {
          Navigator.of(context).pop();
          updateParticipants(ref, reservationList.reservations[0]);
          showLoadPrevGamePopup(context, ref);
        }
        updateGameScore(ref, 0, 0, false, 1);
      } else {
        Navigator.of(context).pop();
        ref.read(reservationProvider.notifier).state = null;
      }
    } catch (e) {
      print('Error loading reservations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final reservationAyscValue = ref.watch(reservationProvider);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: ScoreboardAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (reservationAyscValue != null)
                  InkWell(
                    onTap: () async {
                      final aTeamPlayer = ref.watch(aTeamPlayer1Provider);
                      if (aTeamPlayer!.playerName == '결선1') {
                        showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: SizedBox(
                                  width: 500,
                                  height: 200,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.0),
                                        child: Text(
                                          'ok'.tr(),
                                          style: const TextStyle(fontSize: 24),
                                        ),
                                      ),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: SizedBox(
                                            child: Center(
                                                child: Text(
                                          'error_player_not_ready'.tr(),
                                          style: const TextStyle(fontSize: 20),
                                        ))),
                                      )),
                                      const Divider(),
                                      Expanded(
                                        flex: 1,
                                        child: TextButton(
                                          onPressed: () {
                                            ref.refresh(
                                                reservationListProvider);
                                            _loadReservationAndUpdateParticipants();
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'OK',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                        ref.refresh(reservationListProvider);
                        return;
                      } else {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        );
                        final gameStartResult = await gameStart(ref);
                        if (gameStartResult!.successData.header.returnCode ==
                            0) {
                          Navigator.of(context).pop();
                          showUmpirePopup(context, ref);
                        } else if (gameStartResult
                                .successData.header.returnCode ==
                            1) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(gameStartResult
                                    .successData.header.returnDesc)),
                          );
                          _loadReservationAndUpdateParticipants();
                          return;
                        } else {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('error_game_start'.tr())),
                          );
                          return;
                        }
                      }
                    },
                    child: Container(
                      width: 300,
                      height: 70,
                      decoration: BoxDecoration(
                          color: context.appColors.blueBtnColor,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          'Ready'.text.color(Colors.white).size(24).bold.make(),
                          width20,
                          Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(70))),
                              child: Icon(
                                EvaIcons.arrowRight,
                                size: 30,
                                color: context.appColors.blueBtnColor,
                              ))
                        ],
                      ),
                    ),
                  ),
                height30,
                SizedBox(
                    width: 750,
                    height: 320,
                    child: reservationAyscValue == null
                        ? Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.0, color: Colors.black87),
                                      color: context.appColors.veryBrightGrey),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        'no_game_1st'
                                            .tr()
                                            .text
                                            .size(24)
                                            .color(context.appColors.text)
                                            .make(),
                                        'no_game_2nd'
                                            .tr()
                                            .text
                                            .size(24)
                                            .color(context.appColors.text)
                                            .make(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              height30,
                            ],
                          ))
                        : reservationAyscValue.gameType == 'S'
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                    PlayerCard(
                                      bgColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      teamColor: const Color.fromARGB(
                                          255, 108, 148, 114),
                                      userId: reservationAyscValue
                                          .btopiaUserCourtReservationList![0]
                                          .userId,
                                      playerName: reservationAyscValue
                                          .btopiaUserCourtReservationList![0]
                                          .name,
                                      teamName: reservationAyscValue
                                          .btopiaUserCourtReservationList![0]
                                          .attr1,
                                    ),
                                    PlayerCard(
                                      userId: reservationAyscValue
                                          .btopiaUserCourtReservationList![1]
                                          .userId,
                                      playerName: reservationAyscValue
                                          .btopiaUserCourtReservationList![1]
                                          .name,
                                      teamName: reservationAyscValue
                                          .btopiaUserCourtReservationList![1]
                                          .attr1,
                                    )
                                  ])
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                    Column(
                                      children: [
                                        PlayerCard(
                                          bgColor: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          teamColor: const Color.fromARGB(
                                              255, 108, 148, 114),
                                          userId: reservationAyscValue
                                              .btopiaUserCourtReservationList![
                                                  1]
                                              .userId,
                                          playerName: reservationAyscValue
                                              .btopiaUserCourtReservationList![
                                                  1]
                                              .name,
                                          teamName: reservationAyscValue
                                              .btopiaUserCourtReservationList![
                                                  1]
                                              .attr1,
                                        ),
                                        PlayerCard(
                                          teamColor: const Color.fromARGB(
                                              255, 108, 148, 114),
                                          userId: reservationAyscValue
                                              .btopiaUserCourtReservationList![
                                                  0]
                                              .userId,
                                          playerName: reservationAyscValue
                                              .btopiaUserCourtReservationList![
                                                  0]
                                              .name,
                                          teamName: reservationAyscValue
                                              .btopiaUserCourtReservationList![
                                                  0]
                                              .attr1,
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        PlayerCard(
                                          bgColor: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          userId: reservationAyscValue
                                              .btopiaUserCourtReservationList![
                                                  2]
                                              .userId,
                                          playerName: reservationAyscValue
                                              .btopiaUserCourtReservationList![
                                                  2]
                                              .name,
                                          teamName: reservationAyscValue
                                              .btopiaUserCourtReservationList![
                                                  2]
                                              .attr1,
                                        ),
                                        PlayerCard(
                                          userId: reservationAyscValue
                                              .btopiaUserCourtReservationList![
                                                  3]
                                              .userId,
                                          playerName: reservationAyscValue
                                              .btopiaUserCourtReservationList![
                                                  3]
                                              .name,
                                          teamName: reservationAyscValue
                                              .btopiaUserCourtReservationList![
                                                  3]
                                              .attr1,
                                        )
                                      ],
                                    ),
                                  ])),
                height30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      onPressed: () {
                        _loadReservationAndUpdateParticipants();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.refresh),
                          const SizedBox(width: 10),
                          'refresh'
                              .tr()
                              .text
                              .color(context.appColors.brightText)
                              .size(24)
                              .make(),
                        ],
                      ),
                    ),
                    FilledButton(
                      onPressed: () {
                        ompCalled(context, ref);
                        HapticFeedback.selectionClick;
                        monitoringRequest(context, ref, 1);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 29, 0, 196),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                      ),
                      child: 'omp_call'
                          .tr()
                          .text
                          .color(context.appColors.brightText)
                          .size(24)
                          .make(),
                    ),
                    FilledButton(
                      onPressed: () {
                        refereeCall(context, ref);
                        HapticFeedback.selectionClick;
                        monitoringRequest(context, ref, 0);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 196, 0, 0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                      ),
                      child: 'referee_call'
                          .tr()
                          .text
                          .color(context.appColors.brightText)
                          .size(24)
                          .make(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

Future<SimpleResult<LiveopResponse, ApiError>?> gameStart(WidgetRef ref) async {
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    final gameStartParam = GameStartParam(
      gymId: defaultParam!.gymId,
      macAddress: defaultParam.macAddress,
      loginKey: defaultParam.loginKey,
      reservationNum: reservation!.reservationNum,
      courtId: reservation.courtId,
      startUse: 1,
    );
    final result = await gameUseCase.gameStart(gameStartParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}

Future<List<Reservation>> getReservations(WidgetRef ref) async {
  final selectedCourt = ref.watch(selectedCourtProvider);
  if (selectedCourt == null) {
    throw Exception("no court selected");
  }
  final defaultParam = ref.watch(defaultParamProvider);
  final courtParam = CourtParam(
    gymId: defaultParam!.gymId,
    loginKey: defaultParam.loginKey,
    macAddress: defaultParam.macAddress,
    courtId: selectedCourt.courtId.toString(),
  );
  final courtsUseCase = ref.read(gymUseCaseProvider);
  final result = await courtsUseCase.getReservations(courtParam);
  ref.read(reservationsProvider.notifier).state = result.successData;
  if (result.isSuccess) {
    return result.successData.reservations;
  } else {
    throw Exception(result.failureData.message);
  }
}

void updateParticipants(WidgetRef ref, Reservation? reservation) {
  //updateGameScore(ref, 0, 0, false, 1);
  if (reservation != null &&
      reservation.btopiaUserCourtReservationList != null) {
    ref.read(winTeamProvider.notifier).state = "";
    ref.read(reservationProvider.notifier).state = reservation;
    ref.read(reservationNumProvider.notifier).state =
        reservation.reservationNum;
    if (reservation.gameType == 'S' &&
        reservation.btopiaUserCourtReservationList!.length == 2) {
      final aTeamPlayer1 = reservation.btopiaUserCourtReservationList![0];
      final bTeamPlayer1 = reservation.btopiaUserCourtReservationList![1];
      ref.read(aTeamParticipantProvider.notifier).state = Participant(
          participantId:
              reservation.btopiaUserCourtReservationList![0].participantId,
          playerList: [reservation.btopiaUserCourtReservationList![0]]);
      ref.read(bTeamParticipantProvider.notifier).state = Participant(
          participantId:
              reservation.btopiaUserCourtReservationList![1].participantId,
          playerList: [reservation.btopiaUserCourtReservationList![1]]);
      ref.read(aTeamPlayer1Provider.notifier).state = PlayerCard(
        userId: aTeamPlayer1.userId,
        teamName: aTeamPlayer1.attr1,
        playerName: aTeamPlayer1.name,
      );
      ref.read(bTeamPlayer1Provider.notifier).state = PlayerCard(
        userId: bTeamPlayer1.userId,
        teamName: bTeamPlayer1.attr1,
        playerName: bTeamPlayer1.name,
      );
      ref.read(aTeamParticipantProvider.notifier).state = Participant(
          participantId: aTeamPlayer1.participantId,
          playerList: [aTeamPlayer1]);
      ref.read(bTeamParticipantProvider.notifier).state = Participant(
          participantId: bTeamPlayer1.participantId,
          playerList: [bTeamPlayer1]);
      ref.read(aTeamPlayer1Provider.notifier).state = PlayerCard(
        userId: aTeamPlayer1.userId,
        teamName: aTeamPlayer1.attr1,
        playerName: aTeamPlayer1.name,
      );
      ref.read(bTeamPlayer1Provider.notifier).state = PlayerCard(
          userId: bTeamPlayer1.userId,
          teamName: bTeamPlayer1.attr1,
          playerName: bTeamPlayer1.name);
      ref.read(aTeamPlayer2Provider.notifier).state =
          const PlayerCard(userId: 0, teamName: '', playerName: '');
      ref.read(bTeamPlayer2Provider.notifier).state =
          const PlayerCard(userId: 0, teamName: '', playerName: '');
      ref.read(aTeamPlayer1ForScoreSheetProvider.notifier).state = Player(
          userId: aTeamPlayer1.userId,
          attr1: aTeamPlayer1.attr1,
          name: aTeamPlayer1.name,
          participantId: aTeamPlayer1.participantId);
      ref.read(bTeamPlayer1ForScoreSheetProvider.notifier).state = Player(
          userId: bTeamPlayer1.userId,
          attr1: bTeamPlayer1.attr1,
          name: bTeamPlayer1.name,
          participantId: bTeamPlayer1.participantId);
      ref.read(aTeamPlayer2ForScoreSheetProvider.notifier).state =
          Player(userId: 0, attr1: '', name: '', participantId: '');
      ref.read(bTeamPlayer2ForScoreSheetProvider.notifier).state =
          Player(userId: 0, attr1: '', name: '', participantId: '');
      ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.S;
      ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.R;
      ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
    } else if (reservation.gameType == 'D' &&
        reservation.btopiaUserCourtReservationList!.length == 4) {
      final aTeamPlayer1 = reservation.btopiaUserCourtReservationList![0];
      final aTeamPlayer2 = reservation.btopiaUserCourtReservationList![1];
      final bTeamPlayer1 = reservation.btopiaUserCourtReservationList![2];
      final bTeamPlayer2 = reservation.btopiaUserCourtReservationList![3];
      ref.read(aTeamParticipantProvider.notifier).state = Participant(
          participantId: aTeamPlayer1.participantId,
          playerList: [aTeamPlayer1, aTeamPlayer2]);
      ref.read(bTeamParticipantProvider.notifier).state = Participant(
          participantId: bTeamPlayer1.participantId,
          playerList: [bTeamPlayer1, bTeamPlayer2]);
      ref.read(aTeamPlayer1Provider.notifier).state = PlayerCard(
        userId: aTeamPlayer1.userId,
        teamName: aTeamPlayer1.attr1,
        playerName: aTeamPlayer1.name,
      );
      ref.read(aTeamPlayer2Provider.notifier).state = PlayerCard(
        userId: aTeamPlayer2.userId,
        teamName: aTeamPlayer2.attr1,
        playerName: aTeamPlayer2.name,
      );
      ref.read(bTeamPlayer1Provider.notifier).state = PlayerCard(
          userId: bTeamPlayer1.userId,
          teamName: bTeamPlayer1.attr1,
          playerName: bTeamPlayer1.name);
      ref.read(bTeamPlayer2Provider.notifier).state = PlayerCard(
        userId: bTeamPlayer2.userId,
        teamName: bTeamPlayer2.attr1,
        playerName: bTeamPlayer2.name,
      );
      ref.read(aTeamPlayer1ForScoreSheetProvider.notifier).state = Player(
          userId: aTeamPlayer1.userId,
          attr1: aTeamPlayer1.attr1,
          name: aTeamPlayer1.name,
          participantId: aTeamPlayer1.participantId);
      ref.read(aTeamPlayer2ForScoreSheetProvider.notifier).state = Player(
          userId: aTeamPlayer2.userId,
          attr1: aTeamPlayer2.attr1,
          name: aTeamPlayer2.name,
          participantId: aTeamPlayer2.participantId);
      ref.read(bTeamPlayer1ForScoreSheetProvider.notifier).state = Player(
          userId: bTeamPlayer1.userId,
          attr1: bTeamPlayer1.attr1,
          name: bTeamPlayer1.name,
          participantId: bTeamPlayer1.participantId);
      ref.read(bTeamPlayer2ForScoreSheetProvider.notifier).state = Player(
          userId: bTeamPlayer2.userId,
          attr1: bTeamPlayer2.attr1,
          name: bTeamPlayer2.name,
          participantId: bTeamPlayer2.participantId);

      ref.read(aTeamPlayer1InitServiceProvider.notifier).state = Service.S;
      ref.read(bTeamPlayer1InitServiceProvider.notifier).state = Service.R;
      ref.read(aTeamPlayer2InitServiceProvider.notifier).state = Service.none;
      ref.read(bTeamPlayer2InitServiceProvider.notifier).state = Service.none;
    }
  }
}
