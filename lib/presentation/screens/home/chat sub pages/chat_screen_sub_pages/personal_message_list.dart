import 'package:chat_up/data/repositories/personal_chat_repositerios.dart';
import 'package:chat_up/presentation/screens/home/chat%20sub%20pages/chat_screen_sub_pages/message_style.dart';
import 'package:flutter/material.dart';

class PersonalMessageList extends StatelessWidget {
  PersonalMessageList
  ({
    super.key,
    required this.senderId,
    required this.recieverId,
    });

  final String senderId;
  final String recieverId;
  final ChatService _chatService = ChatService();
  final ScrollController _scrollController = ScrollController();

   void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _chatService.getMessages(senderId, recieverId), 
      builder: (context,snapshot){
        if(snapshot.hasError){
          return Text(
            'error${snapshot.error}'
          );
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(color: Colors.amber,),);
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });

        return Padding(
          padding: const EdgeInsets.all(5),
          child: ListView(
            controller: _scrollController,
            children: snapshot.data!.docs.map((document) => PersonalChatScreen(senderId: senderId, document: document)).toList(),
          ),
        );
      });
  }
}