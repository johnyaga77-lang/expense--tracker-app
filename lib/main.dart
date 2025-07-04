import 'package:expensetracker/addexpansepage.dart';
import 'package:expensetracker/bottombar.dart';
import 'package:expensetracker/expensespage.dart';
import 'package:expensetracker/functions.dart';
import 'package:expensetracker/homepage.dart';
import 'package:expensetracker/model.dart';
import 'package:expensetracker/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


void main()async{
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ExpensingAdapter().typeId)){
    Hive.registerAdapter(ExpensingAdapter());
  }
  final db = await Hive.openBox<Expensing>(dbName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color(0xFFFCFAF7),
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
      );
  }
}