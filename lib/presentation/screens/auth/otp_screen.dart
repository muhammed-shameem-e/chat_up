import 'package:chat_up/data/repositories/auth_repositerios.dart';
import 'package:chat_up/logic/providers/auth_provider.dart';
import 'package:chat_up/main.dart';
import 'package:chat_up/presentation/screens/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTP extends StatelessWidget {
  OTP({super.key,required this.verificationId,required this.phoneNumber});
  final String phoneNumber;
  final String verificationId;
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviders>(context);
    WidgetsBinding.instance.addPostFrameCallback((_){
      authProvider.setLoading(false);
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          const Text(
            'Check your SMS for the OTP and\nenter it here to proceed.',
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
                        height: 75,
                        width: 200,
                        child: TextFormField(
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          autofillHints: const [AutofillHints.oneTimeCode],
                          maxLength: 6,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Enter OTP',
                            labelStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 90, 90, 90),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value)async{
                            if(value.length == 6){
                              saveNumber('number', authProvider.phoneNumber);
                              final snapshot = await FirebaseFirestore.instance
                                     .collection('user')
                                     .where('number',isEqualTo: authProvider.phoneNumber)
                                     .get();
                              if(snapshot.docs.isNotEmpty){
                                final prefs = await SharedPreferences.getInstance();
                                await prefs.setBool(SAVE_KEY_VALUE, true);
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                              }else{
                                verifyOTP(verificationId, otpController.text, phoneNumber, context);
                              }
                            }
                          },
                        ),
                      ),
          ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: (){

              }, 
              child: const Text(
                'Resend OTP',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ))
            ],
      )
          );
  } 
  Future<void> saveNumber(String key,String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}