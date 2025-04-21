import 'package:chat_up/presentation/screens/home/group%20sub%20pages/group_members_list.dart';
import 'package:chat_up/presentation/screens/settings/additional_functions.dart';
import 'package:flutter/material.dart';

class GroupProfile extends StatelessWidget {
  GroupProfile({super.key});
  List<Widget> icons = [
    const Icon(Icons.description,color: Colors.white),
    const Icon(Icons.music_note,color: Colors.white),
    const Icon(Icons.exit_to_app,color: Colors.red),
  ];
  List<String> options = [
    'Description',
    'Mute Notification',
    'Exit gruop',
  ];
  List<Widget> trailing = [
    const Icon(Icons.edit,color: Colors.white,),
    const Icon(Icons.toggle_off,color: Colors.white,size: 40),
  ];

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
      body: SingleChildScrollView(
        child: Column(
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
                '70 members',
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
            SizedBox(
              height: 170,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx,index){
                  return GestureDetector(
                    onTap: (){
                      if(index == 2){
                        exitConfirm(context);
                      }
                    },
                    child: ListTile(
                      leading: icons[index],
                      title: Text(
                        options[index],
                        style: TextStyle(
                          color: index == 2 ? Colors.red:Colors.white,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      trailing: index <= 1 ? trailing[index]: null,
                    ),
                  );
                }, 
                separatorBuilder: (ctx,index){
                  return const SizedBox(height: 5);
                }, 
                itemCount: options.length),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: 1000,
              child: GroupMembersList(),
              ),
          ],
        ),
      ),
    );
  }
}