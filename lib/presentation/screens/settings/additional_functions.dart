import 'package:chat_up/logic/providers/auth_provider.dart';
import 'package:chat_up/logic/providers/user_provider.dart';
import 'package:chat_up/main.dart';
import 'package:chat_up/presentation/screens/auth/verification_screen.dart';
import 'package:chat_up/presentation/screens/home/call%20sub%20pages/call_screen.dart';
import 'package:chat_up/presentation/screens/home/chat%20sub%20pages/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void chooseCamera(BuildContext context){
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    showModalBottomSheet(
      context: context, 
      builder: (context){
        return Container(
          height: 100,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: (){
                  userProvider.pickAndUploadImage(ImageSource.camera);
                  Navigator.of(context).pop();
                }, 
                icon: const Icon(Icons.add_a_photo,color: Colors.amber)),
                IconButton(
                onPressed: (){
                  userProvider.pickAndUploadImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                }, 
                icon: const Icon(Icons.photo,color: Colors.amber)),
            ],
          ),
        );
      });
}
void confirmation(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
          'Confirm',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.5,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
          ),
        ),
        content: const Text(
          'If you Log Out your app will be exit and and you need to verify your number when you comeback',
          style: TextStyle(
            color: Color.fromARGB(255, 180, 180, 180),
          ),
        ),
        actions: [
          TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.white,
            ),
          )),
          TextButton(
          onPressed: ()async{
            Provider.of<AuthProviders>(context,listen: false).setLoading(false);
            Provider.of<UserProvider>(context,listen: false).clearUserData();
            ZegoUIKitPrebuiltCallInvitationService().uninit();
            final _prefs = await SharedPreferences.getInstance();
                      await _prefs.setBool(SAVE_KEY_VALUE, false);
                      Navigator.of(context).
                      pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Verification()),
                      (route) => false);
          }, 
          child: const Text(
            'Log Out',
            style: TextStyle(
              color: Colors.amber,
            ),
          )),
        ],
        );
      });
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
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen()));
                  }, 
                  child: const Icon(Icons.details,color: Colors.white)),
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

 void showStatusViews(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (context){
        return SingleChildScrollView(
          child: Container(
            height: 300,
            color: Colors.black,
            child: Expanded(
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
                                backgroundColor: Colors.black,
                                child: Icon(Icons.person,color: Colors.white,size: 30),
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
                            '44 minutes ago',
                            style: TextStyle(
                              color: Color.fromARGB(255, 180, 180, 180),
                            ),
                          ),
                  );
                },
                 separatorBuilder: (ctx,index){
                  return const SizedBox(height: 10);
                 }, 
                 itemCount: 20),
            ),
          ),
        );
      });
  }

 void exitConfirm(BuildContext context){
    showDialog(
      context: (context), 
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            'Confirm',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: const Text(
            'Are you sure to delete this group',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
               child: const Text(
                'NO',
                style: TextStyle(
                  color: Colors.blue,
                ),
               )),
               TextButton(
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
               child: const Text(
                'YES',
                style: TextStyle(
                  color: Colors.red,
                ),
               ))
          ],
        );}
    );
  }

  void selectDp(BuildContext context){
    final imageProvider = Provider.of<AuthProviders>(context,listen: false);
    showModalBottomSheet(
      context: context, 
      builder: (context){
        return Container(
          height: 100,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: (){
                  imageProvider.pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                }, 
                icon: const Icon(Icons.add_a_photo,color: Colors.amber)),
                IconButton(
                onPressed: (){
                  imageProvider.pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                }, 
                icon: const Icon(Icons.photo,color: Colors.amber)),
            ],
          ),
        );
      });
  }