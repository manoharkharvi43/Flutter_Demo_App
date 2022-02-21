import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Color color1 = Colors.lightBlue;
  Color color2 = Colors.red;
  Color color3 = Colors.amberAccent;

  void changeThemeColor(
      {Color color1 = Colors.lightBlue,
      Color color2 = Colors.red,
      color3 = Colors.amberAccent}) {
    this.color1 = color1;
    this.color2 = color2;
    this.color3 = color3;
    notifyListeners();
  }
}

class toggleBackgroundColor extends ChangeNotifier {
  Color bgColor = Colors.white;
  bool isDark = false;
  changeBgColor(Color color) {
    bgColor = color;
    isDark = !isDark;
    notifyListeners();
  }
}
