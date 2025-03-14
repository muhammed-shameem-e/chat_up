import 'package:chat_up/presentation/screens/home/call%20sub%20pages/call_screen.dart';
import 'package:chat_up/presentation/screens/home/chat%20sub%20pages/member_profile.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 90, 90, 90),
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MemberProfile()));
            },
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                            'David',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.5,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CallScreen()));
              }, 
              icon: const Icon(Icons.call,color: Colors.white)),
              IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.videocam,color: Colors.white)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.more_vert,color: Colors.white))
          ],
        ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 275,
                height: 50,
                child: TextFormField(
                  maxLines: null,
                  minLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 90, 90, 90),
                    prefixIcon: const Icon(Icons.emoji_emotions,color: Colors.white),
                    labelText: 'Message',
                    labelStyle: const TextStyle(color: Colors.white),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      IconButton(
                        onPressed: (){},
                         icon: const Icon(Icons.attach_file,color: Colors.white),),
                      IconButton(
                        onPressed: (){},
                         icon: const Icon(Icons.add_a_photo,color: Colors.white),),
                    ],),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: const CircleBorder(),
                    minimumSize: const Size(50, 50)
                  ),
                  onPressed: (){}, 
                  child: const Icon(Icons.mic,color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}