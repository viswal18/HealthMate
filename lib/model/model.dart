import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class model {
  @HiveField(0)
  final String medicationname;
  @HiveField(1)
  final String quantity;
  @HiveField(2)
  final String frequency;
  @HiveField(3)
  final String time;

  model(
      {required this.medicationname,
      required this.quantity,
      required this.frequency,
      required this.time});
}
