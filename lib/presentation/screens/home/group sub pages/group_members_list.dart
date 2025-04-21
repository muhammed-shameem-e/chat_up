import 'package:chat_up/presentation/screens/settings/additional_functions.dart';
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
}