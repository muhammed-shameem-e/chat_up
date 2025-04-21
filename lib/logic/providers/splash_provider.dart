import 'package:chat_up/main.dart';
import 'package:chat_up/presentation/screens/auth/verification_screen.dart';
import 'package:chat_up/presentation/screens/auth/welcom_screen.dart';
import 'package:chat_up/presentation/screens/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider {
  Future<void> startCheck(BuildContext context) async {
    final _prefs = await SharedPreferences.getInstance();
    final userLoggedIn = _prefs.getBool(SAVE_KEY_VALUE);
    if (userLoggedIn == null || userLoggedIn == false) {
      await hold(context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  Future<void> hold(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 6));
    final phone = await getUserNumber('number');
    if (phone != null && phone.isNotEmpty) {
      final snapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('number', isEqualTo: phone)
          .limit(1)
          .get();
      if (snapshot.docs.isNotEmpty) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Verification()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Welcome()),
        );
      }
    }
  }

  Future<String?> getUserNumber(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
