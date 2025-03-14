import 'package:chat_up/presentation/screens/auth/profile_setup.dart';
import 'package:flutter/material.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Check your SMS for the OTP and\nenter it here to proceed.',
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 90, 90, 90),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 90, 90, 90),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 90, 90, 90),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 90, 90, 90),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Profile()));
              }, 
              child: const Text(
              'Resend OTP',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),)
          ),
        ],
      ),
    );
  }
}