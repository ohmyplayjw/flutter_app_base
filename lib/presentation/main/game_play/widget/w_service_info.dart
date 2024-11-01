import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../vo/enum_service_direction.dart';

class ServiceInfo extends ConsumerWidget {
  const ServiceInfo(
      {super.key, required this.serviceDirection, required this.isHidden});
  final bool isHidden;
  final ServiceDirection serviceDirection;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Transform.rotate(
      angle: serviceDirection.getArrowAngle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 219, 33, 34),
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Transform.rotate(
              angle: serviceDirection.getCharacterAngle,
              child: Center(
                child: 'R'
                    .text
                    .bold
                    .size(30)
                    .color(context.appColors.textBadgeText)
                    .make(),
              ),
            ),
          ),
          const Icon(
            EvaIcons.arrowUpward,
            size: 150,
            color: Color.fromARGB(255, 0, 41, 174),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 76, 255),
              borderRadius: BorderRadius.all(Radius.circular(70)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Transform.rotate(
                angle: serviceDirection.getCharacterAngle,
                child: Center(
                    child: 'S'
                        .text
                        .bold
                        .size(30)
                        .color(context.appColors.textBadgeText)
                        .make())),
          ),
        ],
      ),
    );
  }
}
