import 'package:expensetracker/addexpansepage.dart';
import 'package:expensetracker/expensespage.dart';
import 'package:expensetracker/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int selectedIndex = 0;

  void onTapped (int index){
    setState(() {
      selectedIndex = index;
    });
  }
  final List <Widget> pages = [
      Homepage(),
      Addexpansepage(),
      Expensespage(),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFCFAF7),
        currentIndex: selectedIndex,
        onTap: onTapped,
        selectedLabelStyle: GoogleFonts.plusJakartaSans(fontSize: 13,fontWeight: FontWeight.w500,color: Color(0xFF1C1A0D)),
        selectedItemColor: Color(0xFF1C1A0D),
        unselectedItemColor: Color(0xFF9E9447),
        unselectedLabelStyle: GoogleFonts.plusJakartaSans(fontSize: 12,fontWeight: FontWeight.w500),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add",
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
            )
        ] 
        ),
    );
  }
}