import 'package:chat_up/presentation/screens/home/call%20sub%20pages/call_screen.dart';
import 'package:chat_up/presentation/screens/home/chat%20sub%20pages/chat_screen.dart';
import 'package:flutter/material.dart';

class GroupMembersList extends StatelessWidget {
  const GroupMembersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Column(
        children: [
          const Row(
                children: [
                  Text(
                    '20 members',
                    style: TextStyle(
                      color: Color.fromARGB(255, 90, 90, 90),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.search,color: Color.fromARGB(255,90,90,90),)
                ],
              ),
              const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx,index){
                return GestureDetector(
                  onTap: (){
                    if(index != 0){
                      showUserProfile(context);
                    }
                  },
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                        )
                      ),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        child: Icon(Icons.person,color: Colors.white),
                      ),
                    ),
                    title: index != 0 ?
                    const Text(
                      'David',
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ): 
                    const Text(
                      'You',
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    trailing: index != 0 ? 
                    const Icon(Icons.more_vert,color: Colors.white,): null,
                    subtitle: const Text(
                      'Have a good day',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }, 
              separatorBuilder: (ctx,index){
                return const SizedBox(height: 10);
              }, 
              itemCount: 11),
          ),
        ],
      ),
    );
  }
  void showUserProfile(BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SizedBox(
            width: 400,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      )
                    ),
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.black,
                      child: Icon(Icons.person,color: Colors.white,size: 100),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    minimumSize: const Size(63, 63)
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatScreen()));
                  }, 
                  child: const Icon(Icons.message,color: Colors.white)),
                  const SizedBox(width: 20),
                   ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    minimumSize: const Size(63, 63)
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CallScreen()));
                  }, 
                  child: const Icon(Icons.call,color: Colors.white)),
                  const SizedBox(width: 20),
                   ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    minimumSize: const Size(63, 63)
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CallScreen()));
                  }, 
                  child: const Icon(Icons.videocam,color: Colors.white))
                  ],
                )
              ],
            ),
          ),
        );
      });
  }
}