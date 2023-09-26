import 'package:crud_hive_task/Models/db_model.dart';
import 'package:crud_hive_task/controller/logincontroller.dart';
import 'package:crud_hive_task/controller/updatecontroller.dart';
import 'package:crud_hive_task/screens/first_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CarAdapter().typeId)) {
    Hive.registerAdapter(CarAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => loginprovider()),
        ChangeNotifierProvider(create: (context) => UpdateProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstPage(),
        theme: ThemeData(
            primaryColor: Colors.green,
            appBarTheme: AppBarTheme(
              backgroundColor:
                  Colors.green, 
            ),
            buttonTheme: ButtonThemeData(buttonColor: Colors.green)),
      ),
    );
  }
}
