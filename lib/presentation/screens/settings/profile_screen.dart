import 'package:chat_up/logic/providers/user_provider.dart';
import 'package:chat_up/presentation/screens/settings/additional_functions.dart';
import 'package:chat_up/presentation/screens/settings/edit_user_datas.dart/user_about.dart';
import 'package:chat_up/presentation/screens/settings/edit_user_datas.dart/user_name.dart';
import 'package:chat_up/presentation/screens/settings/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if(userProvider.name.isEmpty && userProvider.about.isEmpty && userProvider.image.isEmpty){
        final number = await getNumber('number');
        if(number != null && number.isNotEmpty){
          userProvider.fetchUserData(number);
        }
      }
    });
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
      body: 

      Consumer<UserProvider>(
        builder: (context,user, _){
          if(user.name.isEmpty && user.about.isEmpty && user.image.isEmpty){
            return const Center(child: CircularProgressIndicator(color: Colors.amber,),);
          }
          return SingleChildScrollView(
            child: Column(
                    children: [
            const SizedBox(height: 20),
            Center(
                    child: GestureDetector(
                      onTap: (){
                        if(user.image.isNotEmpty){
                          Navigator.of(context).
                          push(MaterialPageRoute(builder: (context) => SeeProfilePhoto(imageUrl: user.image)));
                        }else{
                          chooseCamera(context);
                        }
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: Colors.white,
                              )
                            ),
                            child: user.image.isNotEmpty ?
                            CircleAvatar(
                              radius: 100,
                              backgroundImage: NetworkImage(user.image),
                            ):
                            const CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.black,
                              child: Icon(Icons.person,color: Colors.white,size: 100),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: (){
                                    chooseCamera(context);
                                  }, icon: const Icon(Icons.add_a_photo,color: Colors.black)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.person,color: Colors.white,),
                    title: const Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.5,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: (){
                        final currentName = user.name;
                        showDialog(
                          context: context, 
                          builder: (ctx) => EditUserName(name: currentName));
                      }, 
                      icon: const Icon(Icons.edit,color:Colors.amber)),
                    subtitle: Text(
                      user.name,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                     trailing: IconButton(
                      onPressed: (){
                        final currentAbout = user.about;
                        showDialog(
                          context: context, 
                          builder: (ctx) => EditUserAbout(about: currentAbout));
                      }, 
                      icon: const Icon(Icons.edit,color:Colors.amber)),
                    leading: const Icon(Icons.info,color: Colors.white),
                    title: const Text(
                      'About',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.5,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    subtitle: Text(
                      user.about,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                   const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.phone,color: Colors.white),
                    title: const Text(
                      'Phone',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.5,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    subtitle: Text(
                      user.number,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                    ],
                  ),
          );
        })
    );
  }
  Future<String?> getNumber(String key)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  
}