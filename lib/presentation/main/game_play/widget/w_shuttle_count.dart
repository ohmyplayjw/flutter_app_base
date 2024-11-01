import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/vo_liveop_response.dart';
import '../../../../data/models/vo_shuttle_count.dart';
import '../../../../data/network/result/api_error.dart';
import '../../../../data/simple_result.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/game_controller.dart';
import '../../game_ready/s_game_ready.dart';

class ShuttleCount extends ConsumerWidget {
  const ShuttleCount({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              if (ref.read(shuttleCounterProvider) > 0) {
                ref.read(shuttleCounterProvider.notifier).state--;
                shuttleCountMinus(ref);
              }
            },
            icon: const Icon(
              EvaIcons.minus,
            ),
            color: const Color.fromARGB(255, 255, 255, 255),
            iconSize: 20,
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(
                  Color.fromARGB(255, 145, 145, 145)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                '$basePath/icon/ic_shuttle.png',
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
              AnimatedFlipCounter(
                  value: ref.watch(shuttleCounterProvider),
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          width10,
          IconButton(
            onPressed: () {
              shuttleCountPlus(ref);
              ref.read(shuttleCounterProvider.notifier).state++;
            },
            icon: const Icon(
              EvaIcons.plus,
            ),
            color: const Color.fromARGB(255, 255, 255, 255),
            iconSize: 40,
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(
                  Color.fromARGB(255, 145, 145, 145)),
            ),
          )
        ],
      ),
    );
  }
}

Future<SimpleResult<LiveopResponse, ApiError>?> shuttleCountPlus(
    WidgetRef ref) async {
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    //if (defaultParam != null && reservation != null) {
    final shuttleCountParam = ShuttleCountParam(
      gymId: defaultParam!.gymId,
      macAddress: defaultParam.macAddress,
      loginKey: defaultParam.loginKey,
      reservationNum: reservation!.reservationNum,
      courtId: reservation.courtId,
    );
    final result = await gameUseCase.shuttleCountPlus(shuttleCountParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}

Future<SimpleResult<LiveopResponse, ApiError>?> shuttleCountMinus(
    WidgetRef ref) async {
  try {
    final defaultParam = ref.read(defaultParamProvider);
    final reservation = ref.read(reservationProvider);
    final gameUseCase = ref.read(gameUseCaseProvider);
    //if (defaultParam != null && reservation != null) {
    final shuttleCountParam = ShuttleCountParam(
      gymId: defaultParam!.gymId,
      macAddress: defaultParam.macAddress,
      loginKey: defaultParam.loginKey,
      reservationNum: reservation!.reservationNum,
      courtId: reservation.courtId,
    );
    final result = await gameUseCase.shuttleCountMinus(shuttleCountParam);
    return result;
    //}
  } catch (e) {
    return SimpleResult.failure(ApiError(message: e.toString()));
  } finally {}
}
