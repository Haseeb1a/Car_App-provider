import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/db_functions.dart';
import '../Models/db_model.dart';

class loginprovider with ChangeNotifier{
    File? image;
    final ImagePicker _imagePicker = ImagePicker();
  // final ImagePicker _imagePicker = ImagePicker();
  final nameController = TextEditingController();
  final modelController = TextEditingController();
  final colorController = TextEditingController();
    Future<void> pickImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // setState(() {
        image = File(pickedFile.path);
        notifyListeners();
      // });
    }
  }
  Future<void> addButtonClick() async {
    
    final _name = nameController.text.trim();
    final model = modelController.text.trim();
    final _class = colorController.text.trim();
    final _img = image?.path;

    if (_name.isEmpty || model.isEmpty || _class.isEmpty) {
      return;
    }

    final car = Car(
      name: _name,
      model: model,
      color: _class,
      imgg: _img,
    );
    addCar(car);
  }
}