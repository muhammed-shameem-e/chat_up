import 'package:chat_up/data/repositories/personal_chat_repositerios.dart';
import 'package:chat_up/logic/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputSection extends StatelessWidget {
  InputSection
  ({
    super.key,
    required this.recieverId,
    });

  final String recieverId;
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void sendMessage()async{
    if(_messageController.text.isNotEmpty){
      await _chatService.sendPersonalMessages(recieverId, _messageController.text);
      _messageController.clear();
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    return Padding(
    padding: const EdgeInsets.all(10),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 60,
              child: Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: const TextSelectionThemeData(
                  cursorColor: Colors.white,         
                  selectionColor: Colors.white24,    
                  selectionHandleColor: Colors.white,
                ),
               ),
                child: TextFormField(
                  controller: _messageController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 5,
                  minLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 90, 90, 90),
                    prefixIcon: IconButton(
                      onPressed: (){
                      }, 
                      icon: Icon(
                      chatProvider.showImogePicker ? Icons.keyboard
                      : Icons.emoji_emotions,color: Colors.white,
                      )),
                    labelText: 'Message',
                    labelStyle: const TextStyle(color: Colors.white),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.attach_file, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_a_photo, color: Colors.white),
                        ),
                      ],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                     focusedBorder: OutlineInputBorder(
                     borderSide: const BorderSide(color: Colors.white, width: 1),
                     borderRadius: BorderRadius.circular(20),
                     ),
                  ),
                  onChanged: (value){
                    if(value.trim().isNotEmpty){
                      chatProvider.issendMode(true);
                    }else{
                      chatProvider.issendMode(false);
                    }
                  },
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: const CircleBorder(),
              minimumSize: const Size(50, 50),
            ),
            onPressed: () {
              if(_messageController.text.trim().isNotEmpty){
                chatProvider.issendMode(false);
                sendMessage();
              }
            },
            child: Icon(
              chatProvider.hasText ? Icons.send : 
              Icons.mic, color: Colors.black),
          ),
        ],
      ),
    ),
  );
  }
}