import 'package:chat_up/data/repositories/auth_repositerios.dart';
import 'package:chat_up/logic/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class Verification extends StatelessWidget {
  Verification({super.key});
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String fullNumber = '';
  

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviders>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Form(
              key: _formKey,
              child: const Center(
                child: Text("Enter your phone number to continue.\nwe'll send you verification code (OTP)\nto confirm your identity.",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center),
              ),
            ),
            const SizedBox(height: 20),
              Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: IntlPhoneField(
                  controller: phoneController,
                  dropdownTextStyle: const TextStyle(color: Colors.white),
                  dropdownDecoration: const BoxDecoration(color: Colors.black),
                  initialCountryCode: 'IN',
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    counterStyle: const TextStyle(color: Colors.white),
                    labelText: 'Phone number',
                    labelStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)
                    )
                  ),
                  onChanged: (phone){
                    fullNumber = phone.completeNumber;
                  },
                ),
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
                    if(phoneController.text.isNotEmpty){
                      authProvider.setLoading(true);
                      authProvider.setUserPhone(fullNumber);
                     sendOTP(fullNumber, context);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(50, 40)
                  ),
                  child: authProvider.isLoading == false ? 
                  const Text('Next',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                  ),): const SizedBox(
                    height: 20,
                    width:20,
                    child: CircularProgressIndicator(color: Colors.black,)),
                )
              ],
            )
          ],
        ),
      )
    );
  }

}