import 'package:chat_up/data/repositories/contact_repositerios.dart';
import 'package:chat_up/data/repositories/text_styles.dart';
import 'package:chat_up/logic/providers/contact_provider.dart';
import 'package:chat_up/presentation/screens/home/chat%20sub%20pages/chat_screen.dart';
import 'package:chat_up/presentation/screens/settings/additional_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatList extends StatelessWidget {
  ChatList({super.key});

  final FetchContact fetchContact = FetchContact();
  
  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 300,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.search,color: Colors.white,size: 25),
                  fillColor: const Color.fromARGB(255, 90, 90, 90),
                  labelText: 'Search',
                  labelStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  )
                ),
              ),
            ), 
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder(
              future: _fetchContacts(contactProvider), 
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(color: Colors.amber,),);
                } else {
                  final matchUser = contactProvider.matchedContatcts;
                  return matchUser.isEmpty 
            ? const Center(child: Text('No chatUp Users from your contacts',
            style: TextStyle(color: Colors.white,),),)
            : ListView.builder(
              itemBuilder: (ctx,index){
                final user = matchUser[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: 
                    (context) => ChatScreen(recieverId: user['number'],image: user['image'],name: user['name'],)));
                  },
                  child: ListTile(
                   leading: GestureDetector(
                    onTap: (){
                      showUserProfile(context);
                    },
                     child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: user['image'] != null && user['image'].isNotEmpty 
                          ? NetworkImage(user['image'])
                          : null,
                          backgroundColor: Colors.black,
                        ),
                      ),
                   ),
                    title: Text(
                      user['name'] ?? 'David',
                      style: TextStyles.userNames,
                    ),
                    subtitle: const Text(
                      'say hyy',
                      style: TextStyle(
                        color: Color.fromARGB(255, 180, 180, 180),
                      ),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            '6:14 PM',
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: matchUser.length); 
                }
              }),
          ),
        ],
      ),
    );
  }
   Future<void> _fetchContacts(ContactProvider contactProvider) async {
    if (!contactProvider.loading) {
      List<Map<String, dynamic>> contacts = await fetchContact.getmatchedUsers();
      contactProvider.setMatchedContacts(contacts);
    }
  }
  Future<String?> getNumber(String key)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}