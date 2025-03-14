import 'package:chat_up/presentation/screens/home/group%20sub%20pages/group_profile_setup.dart';
import 'package:flutter/material.dart';

class SelectGroupMembers extends StatelessWidget {
  const SelectGroupMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 60),
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
          const SizedBox(height: 10),
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
                  trailing: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )
                );
              }, 
              separatorBuilder: (ctx,index){
                return const SizedBox(height: 20);
              },
              itemCount: 20),
          ),
        ],
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const GroupProfileSetup()));
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(250, 40)
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  ),
                )),
        ),
    );
  }
}