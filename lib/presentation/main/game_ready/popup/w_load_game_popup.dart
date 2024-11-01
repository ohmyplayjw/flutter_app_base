import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nav/nav.dart';

import '../../s_court_entrance.dart';

void showLoadGamePopup(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select the event and input the match number.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                '종목과 종목의 경기번호를 입력하세요.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'SELECT THE EVENT',
                            border: OutlineInputBorder(),
                          ),
                          items: <String>['Event 1', 'Event 2', 'Event 3']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                        const SizedBox(height: 16),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'INPUT THE MATCH NUMBER',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '남중단-16',
                          style: TextStyle(color: Colors.blue),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '의정부시 GSC 강재웅 신백철\n오산시 GSC 엄효정 권오성',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    height: 48, // 두 개 인풋박스의 높이
                    child: ElevatedButton(
                      onPressed: () {
                        // OK 버튼 로직 추가
                      },
                      child: const Text('OK'),
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
              Nav.push(const CourtEntranceScreen());
            },
            child: const Text('BACK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(); // 기존 팝업 Close
              //showUmpirePopup(context, ref); // 새로운 팝업 열기
            },
            child: const Text('NEXT'),
          ),
        ],
      );
    },
  );
}
