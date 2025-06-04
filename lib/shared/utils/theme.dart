import 'package:flutter/cupertino.dart';

class ThemeChange extends ChangeNotifier {
  static ThemeChange instance = ThemeChange();

  bool isDartTheme = false;
  void changeTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}
