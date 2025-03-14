import 'package:chat_up/presentation/screens/home/call%20sub%20pages/call_screen.dart';
import 'package:flutter/material.dart';

class CallList extends StatelessWidget {
  const CallList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
           const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent',
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemBuilder: (ctx,index){
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black
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
                  subtitle: Row(
                    children: [
                      index % 2 == 0 ?
                      const Icon(Icons.arrow_upward,color: Colors.green,size: 15)
                      : const Icon(Icons.arrow_downward,color: Colors.red,size: 15),
                      Text(
                        '3:51 PM',
                        style: TextStyle(
                          color: index % 2 == 0 ? Colors.green:Colors.red,
                          fontStyle: FontStyle.italic,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  trailing: index % 2 == 0 ?
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CallScreen()));
                    },
                    child: const Icon(Icons.call,color: Colors.amber))
                  :GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CallScreen()));
                    },
                    child: const Icon(Icons.videocam,color: Colors.amber)),
                );
              }, 
              separatorBuilder: (ctx,index){
                return const SizedBox(height: 5);
              },
              itemCount: 20),
          ),
        ],
      ),
    );
  }
}