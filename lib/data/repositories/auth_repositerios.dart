import 'package:chat_up/presentation/screens/auth/otp_screen.dart';
import 'package:chat_up/presentation/screens/auth/profile_setup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

int? _resentToken;

Future<void> sendOTP(String phoneNumber,BuildContext context)async{
  
    await auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    forceResendingToken: _resentToken,
    timeout: const Duration(seconds: 60),
    verificationCompleted: (PhoneAuthCredential credential,)async{
      await auth.signInWithCredential(credential);
    }, 
    verificationFailed: (FirebaseAuthException e){
       ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('verification failed ${e.message}',
      style: const TextStyle(
        color: Colors.amber,
      )),
      backgroundColor: Colors.black,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      duration: const Duration(seconds: 3),
    ),
  );
    }, 
    codeSent: (String verificationId,int? resendToken){
      _resentToken = resendToken;
      print('otp sent to $phoneNumber');
      Navigator.of(context)
      .push(
      MaterialPageRoute(builder: (context) => 
      OTP(verificationId: verificationId,phoneNumber: phoneNumber)));
    }, 
    codeAutoRetrievalTimeout: (String verificationId){
      print('autoretrievel timeout!');
    });
  
}
Future<void> verifyOTP(String verificationId,String otp,String number,BuildContext context)async{
  try{
    PhoneAuthCredential cred = PhoneAuthProvider.credential(
      verificationId: verificationId, 
      smsCode: otp.trim());
      await FirebaseAuth.instance.signInWithCredential(cred);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileSetUp(phoneNumber: number)));
  } catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
      behavior: SnackBarBehavior.floating,
      content: const Text('Invalid OTP. Please try again.',
      style: TextStyle(
        color: Colors.amber,
      )),
      backgroundColor: Colors.black,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      duration: const Duration(seconds: 3),
    ),
  );
  }
}
