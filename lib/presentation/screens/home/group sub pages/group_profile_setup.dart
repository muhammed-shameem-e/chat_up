import 'package:flutter/material.dart';

class GroupProfileSetup extends StatelessWidget {
  const GroupProfileSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Center(
                child: Text(
                  'Add a profile picture and enter your\ngroup name to complete your group setup.',
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 100,
                backgroundColor:Color.fromARGB(255, 90, 90, 90),
                child: Center(
                  child: IconButton(
                    onPressed: null, 
                    icon: Icon(Icons.add_a_photo,color: Colors.white,size: 30)),
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
                  decoration: InputDecoration(
                    labelText: 'Group name',
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
              SizedBox(
                width: 250,
                child: TextFormField(
                  maxLines: null,
                  minLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'Description (Optional)',
                    alignLabelWithHint: true,
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
                onPressed: (){
                  Navigator.of(context).pop();
                  }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(250, 40)
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  ),
                ))
            ],
          ),
        ),
      ),
    );
  }
}