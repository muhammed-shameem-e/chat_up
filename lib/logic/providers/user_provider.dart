import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider extends ChangeNotifier{
  String _name = '';
  String _about = '';
  String _image = '';
  String _number = '';
  String _uid = '';
  String? _docId;

  String get name => _name;
  String get about => _about;
  String get image => _image;
  String get number => _number;
  String get uid => _uid;

  final ImagePicker _picker = ImagePicker();

  Future<void> fetchUserData(String phoneNumber)async{
     final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('number', isEqualTo: phoneNumber)
      .limit(1)
      .get();

    if(snapshot.docs.isNotEmpty){
      final doc = snapshot.docs.first;
      final data = doc.data();

      _docId = doc.id;
      _name = data['name'] ?? '';
      _about = data['about'] ?? '';
      _image = data['image'] ?? '';
      _number = data['number'] ?? '';
      _uid = data['uid'] ?? '';

      notifyListeners();
      
    }
  }

  Future<void> updateName(String newName) async{
    if(_docId != null){
      await FirebaseFirestore.instance.collection('users').doc(_docId).update({'name':newName});
      _name = newName;
      notifyListeners();
    }
  }

  Future<void> updateAbout(String newAbout) async{
    if(_docId != null){
      await FirebaseFirestore.instance.collection('users').doc(_docId).update({'about':newAbout});
      _about = newAbout;
      notifyListeners();
    }
  }

 Future<String?> pickAndUploadImage(ImageSource source) async {
  if (_docId == null) return null;

  final pickedImage = await _picker.pickImage(source: source);
  if (pickedImage == null) return null;

  File imageFile = File(pickedImage.path);

  // Delete old image if it exists 
  if (_image.isNotEmpty) {
    try {
      await FirebaseStorage.instance.refFromURL(_image).delete();
    } catch (e) {
      print("Old image not found or already deleted: $e");
    }
  }

  // Upload new image
  final fileName = imageFile.path.split('/').last;
  final ref = FirebaseStorage.instance.ref().child('profile_photos/$fileName');
  UploadTask uploadTask = ref.putFile(imageFile);
  TaskSnapshot snapshot = await uploadTask;

  final newImageUrl = await snapshot.ref.getDownloadURL();

  // Update Firestore with new image URL
  await FirebaseFirestore.instance
      .collection('users')
      .doc(_docId)
      .update({'image': newImageUrl});

  _image = newImageUrl;
  notifyListeners();

  return _image;
}

void clearUserData() {
  _name = '';
  _about = '';
  _image = '';
  _number = '';
  _uid = '';
  _docId = null;
  notifyListeners();
}
}