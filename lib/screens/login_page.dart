import 'package:crud_hive_task/Functions/db_functions.dart';
import 'package:crud_hive_task/Models/db_model.dart';
import 'package:crud_hive_task/controller/logincontroller.dart';
import 'package:crud_hive_task/screens/list_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // File? _image;
  @override
  Widget build(BuildContext context) {
    final login = Provider.of<loginprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddPage'),
        centerTitle: true,
        actions: [
          ElevatedButton(
            
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => ListPage()));
            },
            child:  Icon(Icons.library_books_outlined),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green), ),

          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  login.pickImage();
                },
                icon: const Icon(Icons.photo_camera),
                label: const Text('SET THE IMAGE'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.pink), ),
              ),
              if (login.image != null)
                Image.file(
                  login.image!,
                  height: 100,
                ),
              TextFormField(
                controller: login.nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Car name',
                  labelText: 'Car',
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: login.modelController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Car model',
                  labelText: 'model',
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: login.colorController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter the color',
                  labelText: 'color',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  login.addButtonClick();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListPage(),
                    ),
                  );
                  login.nameController.clear();
                  login.modelController.clear();
                  login.colorController.clear();
                },
              style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set the button color to green
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Set the border radius to 20
      ),
    ),
  ),
                label: const Text('ADD CAR'),
                icon: const Icon(Icons.car_repair_sharp),
              
              ),
            ],
          ),
        ),
      ),
    );
  }
}
