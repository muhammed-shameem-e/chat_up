import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalMessageModel {
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime timeStamp;

  PersonalMessageModel({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timeStamp,
  });

  Map<String,dynamic> toMap(){
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timeStamp': Timestamp.fromDate(timeStamp),
    };
  }
}