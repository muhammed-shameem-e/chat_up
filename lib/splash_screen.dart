import 'package:chat_up/presentation/screens/auth/welcom_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hold(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/chatuplogo.png',height: 200,width: 200),
          ),
    );
  }
}
  Future<void> hold(BuildContext context)async{
  await Future.delayed(const Duration(seconds: 3));
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Welcome()));
}