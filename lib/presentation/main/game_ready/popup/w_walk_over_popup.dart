import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:flutter/material.dart';

void showWalkOverPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'WALK OVER',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'SELECT WALK OVER TEAM',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              const Text(
                '상대팀의 기권으로 승리하는 팀을 선택해주세요.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.green,
                          padding: const EdgeInsets.all(8),
                          child: const Center(
                            child: Text(
                              '요넥스',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(8),
                          child: const Center(
                            child: Text(
                              '이용대 최솔규',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.blue,
                          padding: const EdgeInsets.all(8),
                          child: const Center(
                            child: Text(
                              '삼성생명',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(8),
                          child: const Center(
                            child: Text(
                              '서승재 김원호',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('cancel'.tr()),
          ),
          TextButton(
            onPressed: () {
              // Save 버튼 로직 추가
              Navigator.pop(context);
            },
            child: Text('save'.tr()),
          ),
        ],
      );
    },
  );
}
