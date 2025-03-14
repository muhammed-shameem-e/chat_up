import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 60),
           const Center(
            child: Text(
              'David',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Ringing...',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 150),
           Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: Colors.white,
                )
              ),
              child: const CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 150),
          Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    minimumSize: const Size(63, 63)
                  ),
                  onPressed: null, 
                  child: const Icon(Icons.more_vert,color: Colors.white)),
                  const SizedBox(width: 20),
                   ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    minimumSize: const Size(63, 63)
                  ),
                  onPressed: null, 
                  child: const Icon(Icons.volume_up,color: Colors.white)),
                  const SizedBox(width: 20),
                   ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    minimumSize: const Size(63, 63)
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, 
                  child:  const Icon(Icons.call_end,color: Colors.black),
                   ),
                  ],
                ),
        ],
      ),
    );
  }
}