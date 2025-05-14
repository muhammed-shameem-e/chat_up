import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthProviders extends ChangeNotifier{
  String phoneNumber = '';
  File? _image;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  File? get image => _image;
  
  Future<void> pickImage(ImageSource source)async{
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if(pickedFile != null){
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }
  
  void setUserPhone(String number){
    phoneNumber = number;
    notifyListeners();
  }
  void setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }
  void imageEmpty(){
    _image = null; 
  }
}