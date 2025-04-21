import 'package:chat_up/presentation/screens/home/call_list.dart';
import 'package:chat_up/presentation/screens/home/chat_list.dart';
import 'package:chat_up/presentation/screens/home/group_list.dart';
import 'package:chat_up/presentation/screens/home/status__list.dart';
import 'package:chat_up/presentation/screens/settings/about_help.dart';
import 'package:chat_up/presentation/screens/settings/additional_functions.dart';
import 'package:chat_up/presentation/screens/settings/profile_screen.dart';
import 'package:chat_up/presentation/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
       child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 90, 90, 90),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            Row(
              children: [
              const IconButton(
              onPressed: null, 
              icon: Icon(Icons.search,color: Colors.white)),
              const IconButton(
                onPressed: null, 
                icon: Icon(Icons.add_a_photo,color: Colors.white,)),
              Theme(
                data: Theme.of(context).copyWith(
                  popupMenuTheme: PopupMenuThemeData(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  )
                ),
                child: PopupMenuButton(
                  icon: const Icon(Icons.more_vert,color: Colors.white),
                  onSelected: (value) async{
                    if(value == 'Settings'){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsScreen()));
                    }else if(value == 'Profile'){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
                    }else if(value == 'About & Help'){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutHelp()));
                    }else if(value == 'Log Out'){
                      confirmation(context);
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'Settings',
                      child: Text('Setting',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                    const PopupMenuItem(
                      value: 'Profile',
                      child:  Text('Profile',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                    const PopupMenuItem(
                      value: 'About & Help',
                      child:Text('About & Help',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                    const PopupMenuItem(
                      value: 'Log Out',
                      child:Text('Log Out',
                      style: TextStyle(
                        color: Colors.amber,
                      ),),
                    ),
                  ]),
              )
              ],
            )
          ],
          title: const Text(
            'ChatUp',
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            labelColor: Colors.white,
            unselectedLabelColor: Color.fromARGB(255, 223, 222, 222),
            labelStyle: TextStyle(
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 15
            ),
            tabs: [
              Tab(text: 'Chats'),
              Tab(text: 'Groups'),
              Tab(text: 'Status'),
              Tab(text: 'Calls'),
            ],
          )
        ),
        body: const TabBarView(
          children: [
            ChatList(),
            GroupList(),
            StatusList(),
            CallList(),
          ],
        ),
       ));
  }
}