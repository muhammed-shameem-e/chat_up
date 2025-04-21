import 'package:chat_up/logic/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditUserAbout extends StatelessWidget {
  EditUserAbout({super.key,required this.about});
  final String about;
  final TextEditingController _newAboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 90, 90, 90),
      title: const Text(
        'About',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            style: const TextStyle(color: Colors.white,),
            controller: _newAboutController,
            decoration: InputDecoration(
              hintText: about,
              hintStyle: const TextStyle(color: Colors.white),
            ),          
            validator: (value){
          if(value == null || value.isEmpty){
            return 'please enter you new name';
          }else{
            return null;
          }
        },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
          onPressed: (){
            userProvider.updateAbout(_newAboutController.text);
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            minimumSize: const Size(300, 60)
          ),
           child: const Text(
            'Submit',
            style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 17.5
            ),
          ))
        ],
      ),
    );
  }
}