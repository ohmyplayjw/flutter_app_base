import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElapsedTimeReverseNotifier extends StateNotifier<Duration> {
  Timer? _timer;
  Duration initialDuration;

  ElapsedTimeReverseNotifier({required this.initialDuration})
      : super(initialDuration);

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.inSeconds == 0) {
        _timer?.cancel();
      } else {
        state = Duration(seconds: state.inSeconds - 1);
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void resetTimer() {
    _timer?.cancel();
    state = initialDuration;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final elapsedTimeReverseProvider =
    StateNotifierProvider<ElapsedTimeReverseNotifier, Duration>((ref) {
  return ElapsedTimeReverseNotifier(
      initialDuration: const Duration(seconds: 120)); // 원하는 초기 시간 설정
});
