import 'package:expensetracker/model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<Expensing>> expenseListNotifire = ValueNotifier([]);
const dbName = 'ExpenseDB';


Future <void> addExpense(Expensing value) async{
  final db = await Hive.box<Expensing>('ExpenseDB');
  final id = await db.add(value);
  value.id = id;
  expenseListNotifire.value.add(value);
  getData();
  expenseListNotifire.notifyListeners();
}

Future <void> getData() async{
  final db = await Hive.box<Expensing>('ExpenseDB');
  expenseListNotifire.value.clear();
  expenseListNotifire.value.addAll(db.values);
  expenseListNotifire.notifyListeners();
}

int calcTotalExpense() {
  return expenseListNotifire.value.fold(
    0, 
    (sum, item) => sum + int.tryParse(item.amount.toString())!,
  );
}

Future <void> deleteExpense(int index) async{
  final db = Hive.box<Expensing>('ExpenseDB');
  db.delete(index);
  getData();
  expenseListNotifire.notifyListeners();
}