import 'package:flutter/material.dart';

class SeeProfilePhoto extends StatelessWidget {
  const SeeProfilePhoto({super.key,required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          icon: const Icon(Icons.arrow_back,color: Colors.amber)),
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
          loadingBuilder: (context,child,loadingProgress){
            if(loadingProgress == null) return child;
            return const CircularProgressIndicator(color: Colors.amber);
          },
          errorBuilder: (context,error,stackTrace){
            return const Icon(Icons.error,color: Colors.red,size: 50,);
          },
        ),
      ),
    );
  }
}