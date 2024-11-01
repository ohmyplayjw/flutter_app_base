import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'w_scoresheet_player_info.dart';
import 'w_scoresheet_service_info.dart';
import 'w_scorsheet_score_info.dart';

class Scoresheet extends StatelessWidget {
  final ScrollController scrollController;

  const Scoresheet({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ScoresheetPlayerInfo(),
        const ScoresheetServiceInfo(),
        Expanded(
            child: ScoresheetScoreInfo(scrollController: scrollController)),
      ],
    );
  }
}
