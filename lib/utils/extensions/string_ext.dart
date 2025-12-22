extension StringExt on String {
  bool get isEmail => RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(this);

  bool get isPhone => RegExp(r'^[0-9]{7,15}$').hasMatch(this);

  String get capitalize =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  String get titleCase => split(' ').map((e) => e.capitalize).join(' ');

  String get removeExtraSpaces => trim().replaceAll(RegExp(r'\s+'), ' ');
}
