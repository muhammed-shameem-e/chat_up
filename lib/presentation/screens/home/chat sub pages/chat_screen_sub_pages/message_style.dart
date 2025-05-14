import 'package:chat_up/presentation/screens/home/chat%20sub%20pages/chat_humble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PersonalChatScreen extends StatelessWidget {
  const PersonalChatScreen
  ({ super.key,
     required this.senderId,
     required this.document,
    });

  final String senderId;
  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == senderId)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    bool isSender = data['senderId'] == senderId;
    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ChatHumble(
              message: data['message'],
              time: data['timeStamp'],
              isSender: isSender,
            ),
          ],
        ),
      ),
    );
  }
}