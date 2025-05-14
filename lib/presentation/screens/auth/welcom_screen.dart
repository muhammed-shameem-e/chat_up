import 'package:chat_up/presentation/screens/auth/verification_screen.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});

  final List<String> instructions = [
    "Experience seamless messaging, voice & video calls with ease.",
    "All messages are end-to-end encrypted for your privacy. We do not store your chats on our servers.",
    "Respect others while chatting. Hate speech, harassment, or threats are not tolerated. Avoid sending spam, misleading content, or harmful links.",
    "Your phone number is required for authentication. You can manage your account settings anytime under Settings > Privacy.",
    "Make high-quality voice and video calls using an internet connection. Share status updates with your contacts for 24 hours before they disappear.",
    "You can send images, videos, voice messages, and documents easily. Manage your media storage in Settings > Storage & Data.",
    "Enable Two-Step Verification for additional security. Report & block suspicious contacts anytime.",
    "Regular updates bring new features and security improvements. For any issues, contact Support in Settings > Help.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Welcome to ChatUp',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: instructions.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}. ',
                          style: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            instructions[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.amber,
                  minimumSize: const Size(400, 50)
                ),
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Verification()),
                        );
                },
                child:  const Text(
                    'Agree',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
