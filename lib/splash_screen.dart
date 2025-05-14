import 'package:chat_up/logic/providers/splash_provider.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    SplashProvider().startCheck(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/chatuplogo.png', height: 200, width: 200),
      ),
    );
  }
}
