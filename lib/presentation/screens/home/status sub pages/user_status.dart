import 'package:flutter/material.dart';

class UserStatus extends StatelessWidget {
  const UserStatus({super.key});

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
                    SizedBox(
                      width: 275,
                      height: 50,
                      child: TextFormField(
                        maxLines: null,
                        minLines: 1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 90, 90, 90),
                          prefixIcon: const Icon(Icons.emoji_emotions,color: Colors.white),
                          labelText: 'Message',
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                        ),
                      ),
                    ),
                   IconButton(
                    onPressed: (){}, 
                    icon: const Icon(Icons.favorite_outline,color: Colors.white,size: 35))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}