import 'package:chat_up/data/models/personal_message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatService extends ChangeNotifier{

  //SEND MESSAGES
  Future<void> sendPersonalMessages(String recieverId,String message)async{

    final currentUserId = await getNumber('number');
    final DateTime timeStamp = DateTime.now();

    final personalMessage = PersonalMessageModel(
      senderId: currentUserId!, 
      receiverId: recieverId, 
      message: message, 
      timeStamp: timeStamp);

    List<String> ids = [currentUserId,recieverId];
    ids.sort();
    String chatRoomId = ids.join('_');

    await FirebaseFirestore.instance.collection('personalChatRooms').doc(chatRoomId)
    .collection('personalMessages').add(personalMessage.toMap());
  }

  
  Stream<QuerySnapshot> getMessages(String userId,String otherUserId){

      List<String> ids = [userId,otherUserId];
      ids.sort();
      String chatRoomId = ids.join('_');

      return FirebaseFirestore.instance.collection('personalChatRooms').doc(chatRoomId)
      .collection('personalMessages').orderBy('timeStamp',descending: false).snapshots();
    }
  
  Future<String?> getNumber(String key)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}