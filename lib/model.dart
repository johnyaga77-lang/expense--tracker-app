import 'package:hive/hive.dart';
part 'model.g.dart';


@HiveType(typeId: 1)
class Expensing{
  @HiveField(0)
  int? id;
  @HiveField(1)
  final int amount;
   @HiveField(2)
  final String category;
   @HiveField(3)
  final String note;
   @HiveField(4)
  final String date;

  Expensing({required this.amount,required this.category,required this.note,required this.date,this.id});
}