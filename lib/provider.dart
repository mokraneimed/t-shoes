import 'dart:collection';

import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  int selectedIndex = 1;

  void changeIndex(int ndex) {
    selectedIndex = ndex;
    notifyListeners();
  }
}
