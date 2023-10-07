import 'package:flutter/material.dart';

class ShowPasswordProvider with ChangeNotifier {
  bool isHidden = true;

  void changeHiddenStatus() {
    isHidden = !isHidden;
    notifyListeners();
  }
}
