import 'dart:io';

import 'package:crud_hive_task/screens/list_page.dart';
import 'package:flutter/material.dart';

class InnerList extends StatelessWidget {
  String name, model, color;
  String? img; // Make img nullable by adding '?'

  InnerList({
    super.key,
    required this.name,
    required this.model,
    required this.color,
    this.img, // Update parameter to be nullable
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ListPage()),
            );
          },
          child: const Icon(Icons.arrow_back),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green), ),
          
        ),
        title: const Text('DetailsPage'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 700,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 100,
                  backgroundImage: img != null
                      ? FileImage(File(img!))
                      : null, // Use FileImage if img is not null
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Name: $name'),
                Text('Model: $model'),
                Text('color: $color'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
