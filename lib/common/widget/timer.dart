import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElapsedTimeNotifier extends StateNotifier<Duration> {
  Timer? _timer;

  ElapsedTimeNotifier() : super(Duration.zero);

  void startTimer() {
    final startTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      state = DateTime.now().difference(startTime);
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void resetTimer() {
    _timer?.cancel();
    state = Duration.zero;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final elapsedTimeProvider =
    StateNotifierProvider<ElapsedTimeNotifier, Duration>((ref) {
  return ElapsedTimeNotifier();
});
