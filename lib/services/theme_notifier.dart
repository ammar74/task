import 'dart:ui';

import 'package:flutter/foundation.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;


  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

}