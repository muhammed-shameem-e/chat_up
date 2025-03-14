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
  void showStatusViews(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (context){
        return SingleChildScrollView(
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                   decoration: const BoxDecoration(
                  color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20,top: 10),
                    child: Text(
                      'Views',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.5,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (ctx,index){
                      return ListTile(
                        leading: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.black,
                                    child: Icon(Icons.person,color: Colors.white,size: 30),
                                  ),
                                ),
                                title: const Text(
                                'David',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              subtitle: const Text(
                                '44 minutes ago',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 180, 180, 180),
                                ),
                              ),
                      );
                    },
                     separatorBuilder: (ctx,index){
                      return const SizedBox(height: 10);
                     }, 
                     itemCount: 20),
                ),
              ],
            ),
          ),
        );
      });
  }
}