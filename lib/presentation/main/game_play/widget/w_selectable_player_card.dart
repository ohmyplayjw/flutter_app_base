import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectablePlayerCard extends ConsumerWidget {
  const SelectablePlayerCard(
      {super.key,
      //required this.playerId,
      required this.onTap,
      required this.isSelected,
      this.teamColor,
      this.teamName,
      required this.playerName});

  final Color? teamColor;
  final String? teamName;
  final String? playerName;
  //final String? playerId;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.red : Colors.transparent,
            width: 3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 124, 148, 182),
                  border: Border.all(
                    width: 1,
                  ),
                ),
                height: 40,
                width: 250.0,
                child: Center(
                    child: teamName!.text
                        .color(context.appColors.brightText)
                        .size(24)
                        .make()),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                ),
                width: 250.0,
                height: 90,
                child: Center(
                    child: playerName!.text.bold
                        .size(24)
                        .color(context.appColors.text)
                        .make()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
