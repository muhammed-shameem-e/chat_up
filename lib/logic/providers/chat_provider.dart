import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  bool _showImogePicker = false;
  bool _hasText = false;

  bool get showImogePicker => _showImogePicker;
  bool get hasText => _hasText;

  void isImogeMode(bool imoge){
    _showImogePicker = imoge;
    notifyListeners();
  }

  void issendMode(bool send){
    _hasText = send;
    notifyListeners();
  }
}