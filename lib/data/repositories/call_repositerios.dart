// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:chat_up/presentation/screens/home/call%20sub%20pages/call_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// const String APP_ID = "9c0fde6e6d1741ad89421d03a40d9f2d";

// class CallService extends ChangeNotifier{

//   final RtcEngine _engine = createAgoraRtcEngine();
  
//   Future<void> askCallPermissions() async {
//   await [Permission.microphone, Permission.camera].request();
//   }

//   Future<String?> getNumber(String key)async{
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(key);
//   }

//   Future<void> makeCall(BuildContext context,bool value,String recieverId,String senderId) async {
//     final channelName = 'chat_${recieverId}_$senderId';
//     await askCallPermissions();
//     Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
//     CallScreen(
//       channelName: channelName,
//       isVideoCall: value,
//     )));
//   }

//   Future<void> initAgoraEngine(BuildContext context,String channelName,bool isVideo) async{

//     await _engine.initialize(
//       const RtcEngineContext(
//         appId: APP_ID,
//       )
//     );

//     if(isVideo){
//       await _engine.enableVideo();
//       await _engine.startPreview();
//     }

//     _engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (RtcConnection connection, int elapsed){
//           print('joined channel: $channelName');
//         },
//         onUserJoined: (RtcConnection connection, int remoteUid, int elapsed){
//           print('user joined: $remoteUid');
//         },
//         onUserOffline: (RtcConnection connection,int remoteUid, UserOfflineReasonType reason){
//           print('user offline: $remoteUid');
//         }
//       )
//     );

//     await _engine.joinChannel(
//       token: '', 
//       channelId: channelName, 
//       uid: 0, 
//       options: const ChannelMediaOptions(),
//       );
//   }

//   Future<void> endCall(BuildContext context) async{
//     await _engine.leaveChannel();
//     await _engine.release();
//     Navigator.of(context).pop();
//   }
// }
