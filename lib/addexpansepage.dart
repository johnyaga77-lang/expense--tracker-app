import 'package:expensetracker/functions.dart';
import 'package:expensetracker/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Addexpansepage extends StatelessWidget {
  const Addexpansepage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController=TextEditingController();
    TextEditingController categoryController=TextEditingController();
    TextEditingController noteController=TextEditingController();
    TextEditingController dateController=TextEditingController();

    void clearfields(){
      amountController.clear();
      categoryController.clear();
      noteController.clear();
      dateController.clear();
    }


    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFCFAF7),
        appBar: AppBar(
          backgroundColor: Color(0xFFFCFAF7),
          title: Text("Add Expense",style: GoogleFonts.plusJakartaSans(fontSize: 18,fontWeight: FontWeight.bold),),
          centerTitle: true,
          leading: IconButton(onPressed: (){
      
          }, icon: Icon(Icons.close)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
              buildTextField("\$Amount",amountController),
              SizedBox(height: 24,),
              buildTextField("Category",categoryController),
              SizedBox(height: 24,),
              buildTextField("Note",noteController),
              SizedBox(height: 24,),
              buildTextField("Date",dateController),
                ],
              ),
          
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(onPressed: (){
                  int amount = int.parse(amountController.text);
                  final value = Expensing(
                    amount: amount, 
                    category: categoryController.text, 
                    note: noteController.text, 
                    date: dateController.text
                    );
                    addExpense(value);
                    print("Data Added..................");
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Data Added",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w500,color: Colors.green),),
                          content: Text("Your data have been Saved succesfully",style: GoogleFonts.plusJakartaSans(color: Colors.black),),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                              clearfields();
                            }, 
                            child: Text("0K",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),))
                          ],
                        );
                    });
                    
                    
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFFF7DB05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )
                ),
                child: Text("Save",style: GoogleFonts.plusJakartaSans(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xFF1C1A0D)),)),
              )
              
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextField(String hint,TextEditingController controller){
    return TextField(
      controller:controller ,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.plusJakartaSans(fontSize: 16,color: Color(0xFF9E9447)),
        filled: true,
        fillColor: Color(0xFFF5F2E5),
        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}