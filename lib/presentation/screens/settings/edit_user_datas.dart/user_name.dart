import 'package:chat_up/logic/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditUserName extends StatelessWidget {
  EditUserName({super.key});
  final TextEditingController _newNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 90, 90, 90),
      title: const Text(
        'Enter your new name',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
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
            controller: _newNameController,
            decoration: const InputDecoration(
              hintText: 'New name',
              hintStyle: TextStyle(color: Color.fromARGB(255, 175, 175, 175))
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
            userProvider.updateName(_newNameController.text);
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