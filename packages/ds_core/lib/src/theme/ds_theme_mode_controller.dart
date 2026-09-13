import 'package:flutter/material.dart';

class DsThemeModeController extends ChangeNotifier {
  DsThemeModeController(ThemeMode mode) : _mode = mode;

  ThemeMode _mode;
  ThemeMode get mode => _mode;

  void setMode(ThemeMode newMode) {
    if (_mode != newMode) {
      _mode = newMode;
      notifyListeners();
    }
  }

  void toggle() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
