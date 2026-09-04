import 'package:flutter/material.dart';

class CounterConterllar extends ChangeNotifier {
  String? userName;
  int counter = 0;

  void incrementConter() {
    counter++;
    notifyListeners();
  }

  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }
}
