import 'package:expensetracker/expensespage.dart';
import 'package:expensetracker/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState(){
   super.initState();
   getData(); 
   calcTotalExpense();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF7),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFAF7),
        title: Text("Expenses",style: GoogleFonts.plusJakartaSans(fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
              valueListenable: expenseListNotifire,
              builder: (context, expenseList,child) {
                final total = calcTotalExpense();
                return Container(
                  height: 222,
                  width: 358,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFD700),const Color.fromARGB(255, 107, 96, 38)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("$total/-",style: GoogleFonts.plusJakartaSans(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                        Text("Total Expenses",style: GoogleFonts.plusJakartaSans(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),
                      ],
                    ),
                  ),
                );
              }
            ),
            SizedBox(height: 24,),
            Text("Recent expenses",style: GoogleFonts.plusJakartaSans(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 24,),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: expenseListNotifire, 
                builder: (context, expenseList, child){
                  return ListView.builder(
                    itemCount: expenseList.length,
                    itemBuilder: (context, index) {
                      final expense = expenseList[index];
              
                      return  ExpenseItems(amount: expense.amount.toString(), label: expense.category, date: expense.date); 
                  });
                }
                ),
            )
            
          ],
        ),
      ),
    );
  }
}
class ExpenseItems extends StatelessWidget{
  String amount;
  String label;
  String date;
  ExpenseItems({
    required this.amount,
    required this.label,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(amount,style: GoogleFonts.plusJakartaSans(fontSize: 16,fontWeight: FontWeight.w500),),
              Text(label,style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Color(0xFF9E9447)),),
            ],
          ),
          Text(date,style: GoogleFonts.plusJakartaSans(fontSize: 14,color: Color(0xFF9E9447)),)
        ],
      ),
    ); 
  }
}

