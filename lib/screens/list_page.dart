import 'dart:io';
import 'package:crud_hive_task/Functions/db_functions.dart';
import 'package:crud_hive_task/screens/inner_list_page.dart';
import 'package:crud_hive_task/screens/login_page.dart';
import 'package:crud_hive_task/screens/update_screen.dart';
import 'package:flutter/material.dart';

import '../Models/db_model.dart';

class ListPage extends StatelessWidget {
  const ListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListPage'),
        centerTitle: true,
        leading: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
            child: const Icon(Icons.arrow_back),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green), ),),
            
      ),
      backgroundColor:Color.fromARGB(255, 255, 249, 205),
      body: ValueListenableBuilder(
        valueListenable: studentLists,
        builder: (BuildContext ctx, List<Car> studentLists, Widget? child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                itemCount: studentLists.length,
                itemBuilder: (context, index) {
                  final data = studentLists[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InnerList(
                              name: data.name,
                              model: data.model,
                              color: data.color,
                              img: data.imgg, // Remove the extra period here
                            ),
                          ),
                        );
                      },
                      title: Text('Name: ${data.name}'),
                      subtitle: Text('model: ${data.model}'),
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        backgroundImage: data.imgg != null
                            ? FileImage(File(data.imgg!))
                            : null, // Load image if available
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateScreen(
                                    name: data.name,
                                    model: data.model,
                                    color: data.color,
                                    img: data.imgg, // Pass image path
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteCar(index);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
