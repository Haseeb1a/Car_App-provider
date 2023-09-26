import 'dart:io';
import 'package:crud_hive_task/controller/updatecontroller.dart';
import 'package:crud_hive_task/screens/list_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crud_hive_task/Models/db_model.dart';
import 'package:crud_hive_task/Functions/db_functions.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatefulWidget {
  final String name;
  final String model;
  final String color;
  final String? img;
  final int index;

  UpdateScreen({
    required this.name,
    required this.model,
    required this.color,
    this.img,
    required this.index,
  });

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  void initState() {
    super.initState();
    final updateprovider = Provider.of<UpdateProvider>(context, listen: false);
    updateprovider.nameController = TextEditingController(text: widget.name);
    updateprovider.modelController = TextEditingController(text: widget.model);
    updateprovider.colorController = TextEditingController(text: widget.color);
    updateprovider.image = widget.img != null
        ? File(widget.img!)
        : null; // Set the old image if available
  }

  @override
  Widget build(BuildContext context) {
    final updateprovider = Provider.of<UpdateProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Car'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: updateprovider.nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: updateprovider.modelController,
              decoration: InputDecoration(labelText: 'Model'),
            ),
            TextField(
              controller: updateprovider.colorController,
              decoration: InputDecoration(labelText: 'Color'),
            ),
            SizedBox(height: 16),
            Consumer<UpdateProvider>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: value.pickImage, // Call _pickImage when tapped
                  child: value.image == null && widget.img != null
                      ? Image.file(
                          File(widget
                              .img!), // Use the old image if _image is null
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : value.image == null
                          ? Text('Tap to select an image')
                          : Image.file(
                              value.image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final updatedCar = Car(
                  name: updateprovider.nameController.text,
                  model: updateprovider.modelController.text,
                  color: updateprovider.colorController.text,
                  imgg: updateprovider.image?.path ??
                      widget.img, // Use the updated image path or old image
                  id: widget.index,
                );
                updateCar(widget.index, updatedCar);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListPage(),
                    ));
              },
              child: Text('Update'),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green), ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    final updateprovider = Provider.of<UpdateProvider>(context, listen: false);
    updateprovider.nameController.dispose();
    updateprovider.modelController.dispose();
    updateprovider.colorController.dispose();
    super.dispose();
  }
}
