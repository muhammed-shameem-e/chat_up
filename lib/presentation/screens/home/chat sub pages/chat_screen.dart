import 'package:chat_up/data/repositories/text_styles.dart';
import 'package:chat_up/presentation/screens/home/chat%20sub%20pages/chat_screen_sub_pages/input_section.dart';
import 'package:chat_up/presentation/screens/home/chat%20sub%20pages/chat_screen_sub_pages/personal_message_list.dart';
import 'package:chat_up/presentation/screens/home/chat%20sub%20pages/member_profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key,required this.recieverId,required this.image,required this.name});

  final String recieverId;
  final String image;
  final String name;
  final ValueNotifier<String?> _senderIdNotifier = ValueNotifier<String?>(null);
  // final CallService callService = CallService();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    if (_senderIdNotifier.value == null) {
      String? senderId = await getNumber('number'); 
      _senderIdNotifier.value = senderId;
    }
  });
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 90, 90, 90),
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MemberProfile()));
            },
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(image),
                      radius: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                        Text(
                            name,
                            style: TextStyles.userNames
                          ),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: ()async{
                final senderId = await getNumber('number'); 
                if(senderId != null){
                  List<String> ids = [senderId,recieverId];
                  ids.sort();
                  String channelName = ids.join('_');
                   ZegoUIKitPrebuiltCallInvitationService().send(
                    invitees: [
                      ZegoCallUser(recieverId, name),
                    ], 
                    isVideoCall: false,
                    callID: channelName,
                    resourceID: 'zego_call'
                    );
                          
                }
              }, 
              icon: const Icon(Icons.call,color: Colors.white)),
              IconButton(
              onPressed: ()async{
                final senderId = await getNumber('number'); 
                if(senderId != null){
                  List<String> ids = [senderId,recieverId];
                  ids.sort();
                  String channelName = ids.join('_');
                  ZegoUIKitPrebuiltCallInvitationService().send(
                    invitees: [
                      ZegoCallUser(recieverId, name),
                    ], 
                    isVideoCall: true,
                    callID: channelName,
                    resourceID: 'zego_call'
                    );    
                }
              }, 
              icon: const Icon(Icons.videocam,color: Colors.white)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.more_vert,color: Colors.white))
          ],
        ),
      body: Column(
        children: [
          Expanded( 
            child: ValueListenableBuilder<String?>(
              valueListenable: _senderIdNotifier,
               builder: (context,senderId,_){
                if(senderId == null){
                  return const Center(child: CircularProgressIndicator(color: Colors.amber));
                }
                return PersonalMessageList(senderId: senderId, recieverId: recieverId);
               }),
          ),
          InputSection(recieverId: recieverId)
        ],
      )
    );
  }

  Future<String?> getNumber(String key)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}