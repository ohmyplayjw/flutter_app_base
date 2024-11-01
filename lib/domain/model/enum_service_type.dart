enum Service {
  S,
  R,
  none;

  @override
  String toString() {
    switch (this) {
      case Service.S:
        return 'S';
      case Service.R:
        return 'R';
      case Service.none:
        return '';
      default:
        return '';
    }
  }

  static Service fromString(String value) {
    switch (value) {
      case 'S':
        return Service.S;
      case 'R':
        return Service.R;
      default:
        return Service.none;
    }
  }
}