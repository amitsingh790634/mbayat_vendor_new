import 'package:flutter/material.dart';

class LoaderNotifier extends ChangeNotifier {
  int _counter = 0;

  bool get isLoading => _counter > 0;

  void show() {
    _counter++;
    notifyListeners();
  }

  void hide() {
    if (_counter > 0) _counter--;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }
}
