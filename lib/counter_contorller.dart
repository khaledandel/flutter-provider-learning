import 'package:flutter/material.dart';

class CounterConterllar extends ChangeNotifier {
  int counter = 0;

  void incrementConter() {
    counter++;
    notifyListeners();
    print("Cont");
  }
}
