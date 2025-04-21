import 'package:chat_up/presentation/screens/settings/additional_functions.dart';
import 'package:flutter/material.dart';

class MyStatus extends StatelessWidget {
  const MyStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
           LinearProgressIndicator(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
            value: 0.5,
           ),
           const SizedBox(height: 10),
           SizedBox(
           width: double.infinity,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               IconButton(
                 onPressed: (){
                   Navigator.of(context).pop();
                 }, 
                 icon: const Icon(Icons.arrow_back,color: Colors.white,)),
               Container(
                 decoration: BoxDecoration(
                   border: Border.all(
                     width: 1,
                     color: Colors.white,
                   ),
                   color: Colors.black,
                   shape: BoxShape.circle,
                 ),
                 child: const CircleAvatar(
                   backgroundColor: Colors.black,
                   radius: 20,
                 ),
               ),
               const SizedBox(width: 10),
               const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                       Text(
                             'David',
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 17.5,
                               fontWeight: FontWeight.bold,
                               fontStyle: FontStyle.italic,
                             ),
                           ),
                           Text(
                             '7 hours ago',
                             style: TextStyle(
                               color: Colors.grey,
                               fontStyle: FontStyle.italic,
                             ),
                           ),
                 ],
               ),
               const Spacer(),
               const Icon(Icons.pause,color: Colors.white),
               const Icon(Icons.more_vert,color: Colors.white),
             ],
           ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (){
                        showStatusViews(context);
                      },
                       icon: const Icon(Icons.remove_red_eye,color: Colors.amber,)),
                       const Text(
                        '56',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                       )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}