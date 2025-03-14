import 'package:chat_up/presentation/screens/auth/verification_screen.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final ScrollController _scrollController = ScrollController();
  bool isScrolledToEnd = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(onScroll);
  }
  @override
  Widget build(BuildContext context) {

    List<String> terms = [
  "1. Experience seamless messaging, voice & video calls with ease.",

  "2. Secure & Private Messaging",
  "     All messages are end-to-end encrypted for your privacy.",
  "     We do not store your chats on our servers.",

  "3. User Guidelines",
  "     Respect others while chatting. Hate speech, harassment, or threats are not tolerated.",
  "     Avoid sending spam, misleading content, or harmful links.",

  "4. Account & Data",
  "     Your phone number is required for authentication.",
  "     You can manage your account settings anytime under Settings > Privacy.",

  "5. Calling & Status",
  "     Make high-quality voice and video calls using an internet connection.",
  "     Share status updates with your contacts for 24 hours before they disappear.",

  "6. Media & Storage",
  "     You can send images, videos, voice messages, and documents easily.",
  "     Manage your media storage in Settings > Storage & Data.",

  "7. Safety & Security",
  "     Enable Two-Step Verification for additional security.",
  "     Report & block suspicious contacts anytime.",

  "8. Updates & Support",
  "     Regular updates bring new features and security improvements.",
  "     For any issues, contact Support in Settings > Help."
];


    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Welcome to ChatUp',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30,
                fontStyle:FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: ListView.separated(
                controller: _scrollController,
                itemBuilder: (ctx,index){
                  return Text(terms[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,);
                }, 
                separatorBuilder: (ctx,index){
                  return const SizedBox(height: 5);
                }, 
                itemCount: terms.length),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
              onPressed: isScrolledToEnd ?
              (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Verification()));
              }: null,
               child: Text('Agree',
              style: TextStyle(
                color: isScrolledToEnd ? Colors.amber : Colors.grey,
              ),)),
            )
          ],
        ),
      ),
    );
  }
  void onScroll(){
    if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent){
      setState(() {
        isScrolledToEnd = true;
      });
    }
  }
}
