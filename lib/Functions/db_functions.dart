import 'package:crud_hive_task/Models/db_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<Car>> studentLists = ValueNotifier([]);

//to add to db
Future<void> addCar(Car value) async {
  final CarDB = await Hive.openBox<Car>('student_db');
  final id = await CarDB.add(value);
  value.id = id;
  studentLists.value.add(value);
  studentLists.notifyListeners();
}

//get from db
Future<void> getCar() async {
  final CarDB = await Hive.openBox<Car>('student_db');
  studentLists.value.clear();
  studentLists.value.addAll(CarDB.values);
  studentLists.notifyListeners();
}

//delete from db

Future<void> deleteCar(int id) async {
  final CarDB = await Hive.openBox<Car>('student_db');
  await CarDB.deleteAt(id);
  getCar();
}

Future<void> updateCar(int id, Car value) async {
  final CarDB = await Hive.openBox<Car>('student_db');
  await CarDB.putAt(id, value);
  getCar();
}

// Future<void> updateCar( Car updatedCar) async {
//   final CarDB = await Hive.openBox<Car>('student_db');

//   final stdIndex = CarDB.values.toList().indexWhere((std) => std == std);
//   if (stdIndex != -1) {
//     CarDB.putAt(stdIndex, updatedCar);
//   }
// }
