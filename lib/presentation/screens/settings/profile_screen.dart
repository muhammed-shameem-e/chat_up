import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  List<Widget> leading = [
    const Icon(Icons.person,color: Colors.white,),
    const Icon(Icons.info,color: Colors.white,),
    const Icon(Icons.info,color: Colors.white,),
  ];

  List<String> title= [
    'Name',
    'About',
    'Phone'
  ];

  List<String> subtitle = [
    'David',
    'Hyy...guys...',
    '+91 9188006749',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 90, 90, 90),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 17.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
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
                Expanded(
            child: ListView.separated(
              itemBuilder: (ctx,index){
                return ListTile(
                  leading: leading[index],
                  title: Text(
                    title[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17.5,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  subtitle: Text(subtitle[index],
                  style: const TextStyle(
                    color: Colors.white,
                  ),),
                );
              }, 
              separatorBuilder: (ctx,index){
                return const SizedBox(height: 10);
              }, 
              itemCount: title.length),
          ),
        ],
      ),
    );
  }
}