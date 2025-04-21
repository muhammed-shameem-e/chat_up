import 'package:chat_up/presentation/screens/home/chat%20sub%20pages/chat_screen.dart';
import 'package:chat_up/presentation/screens/settings/additional_functions.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                    title: Text(
                      'David',
                      style: textTheme.displayLarge,
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