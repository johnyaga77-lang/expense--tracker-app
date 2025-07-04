import 'package:expensetracker/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Expensespage extends StatefulWidget {
  const Expensespage({super.key});

  @override
  State<Expensespage> createState() => _ExpensespageState();
}

class _ExpensespageState extends State<Expensespage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF7),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFAF7),
        title: Text("Expenses",style: GoogleFonts.plusJakartaSans(fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(onPressed: (){

        }, icon: Icon(Icons.arrow_back)
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: expenseListNotifire, 
        builder: (context, expenseList, child) {
          return ListView.builder(
            itemCount: expenseList.length,
            itemBuilder: (context, index) {
              final expense = expenseList[index];

              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  child:expensedItem(amount:expense.amount.toString() , label: expense.category, date:expense.date),
                );
            }
          );
        })
    );
  }
}
class expensedItem extends StatelessWidget{
  String amount;
  String label;
  String date;

  expensedItem({
    required this.amount,
    required this.label,
    required this.date
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
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
          Text(date,style: GoogleFonts.plusJakartaSans(fontSize: 16),)
        ],
      ),
    );
  }
}