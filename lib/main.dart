import 'package:chat_up/data/repositories/personal_chat_repositerios.dart';
import 'package:chat_up/logic/providers/auth_provider.dart';
import 'package:chat_up/logic/providers/chat_provider.dart';
import 'package:chat_up/logic/providers/contact_provider.dart';
import 'package:chat_up/logic/providers/user_provider.dart';
import 'package:chat_up/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

const SAVE_KEY_VALUE = 'userLoggedIn';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getString('number') ?? '+9188006749';

   ZegoUIKitPrebuiltCallInvitationService().init(
    appID: 179656385,
    appSign: '89133e05afd2a88d888e9d74c4d47b82df6a2a5d8c245bf96314b942a1ebef52', 
    userID: userId, 
    userName: userId, 
    plugins: [ZegoUIKitSignalingPlugin()]);
  
  await Firebase.initializeApp();
 ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProviders()),
          ChangeNotifierProvider(create: (context) => UserProvider()),
          ChangeNotifierProvider(create: (context) => ContactProvider()),
          ChangeNotifierProvider(create: (context) => ChatService()),
          ChangeNotifierProvider(create: (context) => ChatProvider()),
        ],
        child: const MyApp(),
      ),
    );
  });
}
class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}