import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FetchContact{

  Future<List<String>> getMobileNumbersFromContacts() async {
    
  var status = await Permission.contacts.status;
  if (!status.isGranted) {
    status = await Permission.contacts.request();
    if (!status.isGranted) {
      return [];
    }
  }

  final contacts = await FastContacts.getAllContacts();
  List<String> numbers = [];

  for (var contact in contacts) {
    for (var phone in contact.phones) {
      numbers.add(
        phone.number.replaceAll(RegExp(r'\s+|\-'), ''),
      );
    }
  }
  print(numbers);
  return numbers;
}


    Future<List<Map<String,dynamic>>> getmatchedUsers() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    final currentUser = await getNumber('number');
    List<Map<String,dynamic>> matchedUsers = [];
    for(var doc in snapshot.docs){
      final user = doc.data();
      if(user['number'] != currentUser){
        matchedUsers.add(user);
      }
    }
    return matchedUsers;
  }

  Future<String?> getNumber(String key)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}