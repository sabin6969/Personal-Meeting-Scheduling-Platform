import 'package:flutter/material.dart';

class RememberMeProvider with ChangeNotifier {
  bool isSelected = false;

  void changeSelectedStatus(bool status) {
    isSelected = status;
    notifyListeners();
  }
}
