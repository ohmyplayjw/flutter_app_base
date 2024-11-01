import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void showWTimePopup(BuildContext context, int start, VoidCallback onFinish,
    String type, String courtNum) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        content: WTimePopup(
            start: start, onFinish: onFinish, type: type, courtNum: courtNum),
      );
    },
  );
}

class WTimePopup extends StatefulWidget {
  final int start;
  final String type;
  final String courtNum;
  final VoidCallback onFinish;

  WTimePopup(
      {required this.start,
      required this.onFinish,
      required this.courtNum,
      required this.type});

  @override
  _WTimePopupState createState() => _WTimePopupState();
}

class _WTimePopupState extends State<WTimePopup> {
  late Timer _timer;
  late int _start;

  @override
  void initState() {
    super.initState();
    _start = widget.start;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    widget.onFinish(); // 타이머가 끝나거나 팝업이 닫힐 때 콜백 호출
    super.dispose();
  }

  String get timerText {
    final minutes = (_start ~/ 60).toString().padLeft(2, '0');
    final seconds = (_start % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String get headerText {
    if (widget.type == 'READY') {
      return 'Ready To Start';
    } else if (widget.type == 'INTERVAL') {
      if (_start <= 20) {
        return 'Court ${widget.courtNum}, 20 seconds';
      } else {
        return 'Interval';
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          headerText,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        Text(
          timerText,
          style: const TextStyle(fontSize: 48),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'ok',
            style: TextStyle(fontSize: 20),
          ).tr(),
        ),
      ],
    );
  }
}
