import 'package:chat_up/logic/providers/splash_provider.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    // Call the provider function after build is done
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SplashProvider().startCheck(context);
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/chatuplogo.png', height: 200, width: 200),
      ),
    );
  }
}
