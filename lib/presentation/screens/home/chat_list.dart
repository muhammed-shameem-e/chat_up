import 'package:chat_up/presentation/screens/home/call%20sub%20pages/call_screen.dart';
import 'package:chat_up/presentation/screens/home/chat%20sub%20pages/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 300,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.search,color: Colors.white,size: 25),
                  fillColor: const Color.fromARGB(255, 90, 90, 90),
                  labelText: 'Search',
                  labelStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  )
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemBuilder: (ctx,index){
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatScreen()));
                  },
                  child: ListTile(
                   leading: GestureDetector(
                    onTap: (){
                      showUserProfile(context);
                    },
                     child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: Icon(Icons.person,color: Colors.white,size: 30),
                        ),
                      ),
                   ),
                    title: const Text(
                      'David',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.5,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    subtitle: const Text(
                      'hyy',
                      style: TextStyle(
                        color: Color.fromARGB(255, 180, 180, 180),
                      ),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            '6:14 PM',
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }, 
              separatorBuilder: (ctx,index){
                return const SizedBox(height: 5);
              },
              itemCount: 20),
          )
        ],
      ),
    );
  }
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