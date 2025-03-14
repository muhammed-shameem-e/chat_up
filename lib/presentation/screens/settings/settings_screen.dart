import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  List<Widget> leading = [
    const Icon(Icons.privacy_tip,color: Colors.white,),
    const Icon(Icons.settings,color: Colors.white,),
    const Icon(Icons.notifications,color: Colors.white,),
    const Icon(Icons.storage,color: Colors.white,),
  ];
  List<String> title= [
    'Privacy',
    'Chat settings',
    'Notification settings',
    'Storage & Data usage',
  ];
  List<String> subtitle = [
    'Last seen, Read reciepts',
    'Theme, Whallpaper',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 90, 90, 90),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Settings',
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
                  subtitle: index <= 1 ?Text(subtitle[index],
                  style: const TextStyle(
                    color: Colors.white,
                  ),):null,
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