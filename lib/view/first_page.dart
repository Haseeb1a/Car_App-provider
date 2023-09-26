import 'package:crud_hive_task/services/db_functions.dart';
import 'package:crud_hive_task/view/login_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    getCar();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
                
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
