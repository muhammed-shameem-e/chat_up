import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallScreen extends StatelessWidget {
  CallScreen
  ({
    super.key,
    required this.channelName,
    required this.isVideoCall,
    required this.userId,
    required this.userName,
    });

  final String channelName;
  final bool isVideoCall;
  final String userId;
  final String userName;

  @override
  Widget build(BuildContext context) {
    
    return ZegoUIKitPrebuiltCall(
      appID: 179656385, 
      appSign: '89133e05afd2a88d888e9d74c4d47b82df6a2a5d8c245bf96314b942a1ebef52',
      callID: channelName,
       userID: userId, 
       userName: userName, 
       config: isVideoCall ?
       ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
       : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
       ..turnOnCameraWhenJoining = false,
       );
  }
}