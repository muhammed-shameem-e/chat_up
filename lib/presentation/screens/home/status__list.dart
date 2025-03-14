import 'package:chat_up/presentation/screens/home/my_status.dart';
import 'package:chat_up/presentation/screens/home/status%20sub%20pages/user_status.dart';
import 'package:flutter/material.dart';

class StatusList extends StatelessWidget {
  const StatusList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
            leading: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyStatus()));
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
                  child: Center(
                    child: Icon(Icons.add,color: Colors.white),
                  ),
                ),
              ),
            ),
            title: const Text(
              'My status',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            subtitle: const Text(
              'Tap to add status update',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent Updates',
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
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserStatus()));
                  },
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber,
                          width: 1,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
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
                      '3:17 PM',
                      style: TextStyle(
                        color: Color.fromARGB(255, 180, 180, 180),
                      ),
                    ),
                  ),
                );
              }, 
              separatorBuilder: (ctx,index){
                return const SizedBox(height: 5);
              },
              itemCount: 20),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: (){
        },
        child: const Icon(Icons.add_a_photo,color: Colors.black),
      ),
    );
  }
}