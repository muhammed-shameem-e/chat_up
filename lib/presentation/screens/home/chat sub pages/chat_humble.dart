import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatHumble extends StatelessWidget {
  ChatHumble(
    {super.key,
    required this.message,
    required this.time,
    required this.isSender});

  final String message;
  final Timestamp time;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    final formatedTime = DateFormat('hh:mm a').format(time.toDate());
    return Container(
      constraints: const BoxConstraints(maxWidth: 250),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSender ? const Color.fromARGB(255, 146, 110, 1) : Colors.grey.shade800,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),      
            softWrap: true,
          ),
          const SizedBox(height: 5),
          Text(
            formatedTime,
            style: const TextStyle(
              fontSize: 8,
              color: Colors.white,
            ),
          ),
        ],
      ),
      
    );
  }
}