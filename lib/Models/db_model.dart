import 'package:hive_flutter/adapters.dart';

part 'db_model.g.dart';

@HiveType(typeId: 1)
class Car {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String  model;

  @HiveField(3)
  final String  color;

  @HiveField(4)
  final String? imgg;

  Car({required this.name, required this.model,this.imgg, required this.color, this.id
      
      });
}
