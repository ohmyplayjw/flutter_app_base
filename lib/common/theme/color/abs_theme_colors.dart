import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

typedef ColorProvider = Color Function();

abstract class AbstractThemeColors {
  const AbstractThemeColors();

  Color get seedColor => const Color.fromARGB(255, 71, 105, 150);

  Color get veryBrightGrey => AppColors.brightGrey;

  Color get drawerBg => const Color.fromARGB(255, 255, 255, 255);

  Color get scrollableItem => const Color.fromARGB(255, 57, 57, 57);

  Color get iconButton => const Color.fromARGB(255, 0, 0, 0);

  Color get iconButtonInactivate => const Color.fromARGB(255, 162, 162, 162);

  Color get inActivate => const Color.fromARGB(255, 200, 207, 220);

  Color get activate => const Color.fromARGB(255, 63, 72, 95);

  Color get badgeBg => AppColors.blueGreen;

  Color get textBadgeText => Colors.white;

  Color get badgeBorder => Colors.transparent;

  Color get divider => const Color.fromARGB(255, 228, 228, 228);

  Color get text => AppColors.darkGrey;

  Color get hintText => AppColors.middleGrey;

  Color get brightText => AppColors.brightGrey;

  Color get focusedBorder => AppColors.darkGrey;

  Color get confirmText => AppColors.blue;

  Color get drawerText => text;

  Color get snackbarBgColor => AppColors.mediumBlue;

  Color get primaryBtnColor => AppColors.veryDarkGrey;

  Color get blueBackground => AppColors.darkBlue;

  Color get darkblueBackground => AppColors.veryDarkBlue;

  Color get redBtnColor => const Color.fromARGB(255, 219, 33, 34);

  Color get blueBtnColor => const Color(0xFF344D9F);
}
