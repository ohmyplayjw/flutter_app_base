import 'dart:math' as math;

enum ServiceDirection {
  LRRR,
  LLRL,
  RRLR,
  RLLL;

  static ServiceDirection fromString(String value) {
    return ServiceDirection.values.firstWhere(
      (e) => e.toString().split('.').last == value,
      orElse: () => throw ArgumentError('Invalid ServiceDirection: $value'),
    );
  }
}

extension ServiceDirectionExtension on ServiceDirection {
  double get getArrowAngle {
    switch (this) {
      case ServiceDirection.LRRR:
        return math.pi / 4;
      case ServiceDirection.LLRL:
        return math.pi * 3 / 4;
      case ServiceDirection.RRLR:
        return -math.pi * 3 / 4;
      case ServiceDirection.RLLL:
        return -math.pi / 4;
      default:
        return 0.0;
    }
  }

  double get getCharacterAngle {
    switch (this) {
      case ServiceDirection.LRRR:
        return -math.pi / 4;
      case ServiceDirection.LLRL:
        return -math.pi * 3 / 4;
      case ServiceDirection.RRLR:
        return math.pi * 3 / 4;
      case ServiceDirection.RLLL:
        return math.pi / 4;
      default:
        return 0.0;
    }
  }
}
