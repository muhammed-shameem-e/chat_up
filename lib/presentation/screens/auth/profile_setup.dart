import 'package:chat_up/data/models/user_model.dart';
import 'package:chat_up/logic/providers/auth_provider.dart';
import 'package:chat_up/main.dart';
import 'package:chat_up/presentation/screens/home/home_screen.dart';
import 'package:chat_up/presentation/screens/settings/additional_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSetUp extends StatelessWidget {
  ProfileSetUp({super.key,required this.phoneNumber});
  final String phoneNumber;

  String? image;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<AuthProviders>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Center(
                  child: Text(
                    'Add a profile picture(Optional) and enter your\nname to personalaize your account.',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: (){
                    selectDp(context);
                  },
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor:const Color.fromARGB(255, 90, 90, 90),
                    backgroundImage: imageProvider.image != null ?
                    FileImage(imageProvider.image!) : null,
                    child: imageProvider.image == null ?
                    Center(
                      child:
                      IconButton(
                        onPressed: (){
                          selectDp(context);
                        }, 
                        icon: const Icon(Icons.add_a_photo,size: 30,color: Colors.white,))
                    ):null,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 1,
                  width: 225,
                  color: Colors.amber,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: _nameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Name',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 90, 90, 90),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                          ),
                       ),
                       validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter your name';
                        }else{
                          return null;
                        }
                       },
                   ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: _aboutController,
                    style: const TextStyle(color: Colors.white),
                    maxLength: 60,
                    decoration: InputDecoration(
                      labelText: 'About(Optional)',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 90, 90, 90),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                          ),
                       ),
                   ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: ()async{
                    imageProvider.setLoading(true);
                    if(_formKey.currentState!.validate()){
                    String? imageUrl;
                    if(imageProvider.image != null){
                      final ref = FirebaseStorage.instance
                    .ref()
                    .child('profile_photos/${imageProvider.image!.path}');

                    await ref.putFile(imageProvider.image!);
                    imageUrl = await ref.getDownloadURL();
                    }
                    
                       final newData = UserModel(
                        name: _nameController.text.trim(), 
                        about: _aboutController.text.trim().isNotEmpty ? 
                        _aboutController.text.trim() : 'let them know about you',
                        number: imageProvider.phoneNumber,
                        image: imageUrl ?? '');

                        await FirebaseFirestore.instance
                        .collection('user')
                        .add(newData.toMap());
                      final _prefs = await SharedPreferences.getInstance();
                      await _prefs.setBool(SAVE_KEY_VALUE, true);
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false,
                      );
                       ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                       behavior: SnackBarBehavior.floating,
                       content: const Center(
                       child: Text('Login accomplished. welcome to ChatUp...',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                       color: Colors.amber,
                    )),
                  ),
                       backgroundColor: Colors.black,
                       margin: const EdgeInsets.all(20),
                       shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10)
                    ),
                       duration: const Duration(seconds: 3),
                         ),
                       );
                    }
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(250, 40)
                  ),
                  child: imageProvider.isLoading == false ?
                  const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                    ),
                  ): const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  )
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}