import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProvider with ChangeNotifier {
  final ImagePicker _imagePicker = ImagePicker();
  late TextEditingController nameController;
  late TextEditingController modelController;
  late TextEditingController colorController;
  File? image;

  Future<void> pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }
}
