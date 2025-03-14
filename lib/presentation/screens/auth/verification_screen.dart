import 'package:chat_up/presentation/screens/auth/otp_screen.dart';
import 'package:flutter/material.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("Enter your phone number to continue.\nwe'll send you verification code (OTP)\nto confirm your identity.",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 90, 90, 90),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text('+91',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                  const SizedBox(width: 2.5),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter your phone number',
                          labelStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 90, 90, 90),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Tap 'Next' to receive\na verification code via SMS.",
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const OTP()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(50, 40)
                  ),
                  child: const Text('Next',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                  ),),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}