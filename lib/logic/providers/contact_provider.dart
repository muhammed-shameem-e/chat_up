import 'package:flutter/foundation.dart';

class ContactProvider extends ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;
  List<Map<String,dynamic>> _matchedContacts = [];
  List<Map<String,dynamic>> get matchedContatcts => _matchedContacts;
  void setMatchedContacts(List<Map<String,dynamic>> contact){
    _matchedContacts = contact;
    _loading = false;
    notifyListeners();
  } 
}