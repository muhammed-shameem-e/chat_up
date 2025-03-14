import 'package:flutter/material.dart';

class MemberProfile extends StatelessWidget {
  const MemberProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          icon: const Icon(Icons.arrow_back,color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
          const SizedBox(height: 5),
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
              '+91 9188006749',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 20),
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
                  child: const Icon(Icons.call,color: Colors.white)),
                  const SizedBox(width: 30),
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
                  child: const Icon(Icons.videocam,color: Colors.white)),
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
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      popupMenuTheme: PopupMenuThemeData(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      )
                    ),
                    child: PopupMenuButton(
                      icon: const Icon(Icons.more_vert,color: Colors.white),
                      itemBuilder: (context) => [
                         const PopupMenuItem(
                        value: 'Edit',
                        child: Text('Edit',
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                       const PopupMenuItem(
                        value: 'Share',
                        child: Text('Share',
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                      ]),
                  ))
                  ],
                ),
                const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.notifications,color:Colors.white),
            title:Text(
              'Notifications',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                fontSize: 17.5,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.block,color:Colors.red),
            title:Text(
              'Block David',
              style: TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                fontSize: 17.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}