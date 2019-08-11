import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myexpenses/src/local_storage/sharedPreferences.dart';
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class ExpenseDescription extends StatelessWidget {
  final String imagePath;
  final String categoryName;
  final double totalExpense, expense;
  ExpenseDescription(
      {this.categoryName, this.totalExpense, this.expense, this.imagePath});
  final TextEditingController _descriptionController =
      new TextEditingController();
  final OutlineInputBorder inputBorder = new OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
      color: Colors.green,
    ),
  );
  final BoxDecoration containerDecoration = new BoxDecoration(boxShadow: [
    BoxShadow(
        color: Colors.white,
        blurRadius: 10,
        offset: Offset(2, 1),
        spreadRadius: 0),
    BoxShadow(
        color: Colors.white,
        blurRadius: 10,
        offset: Offset(-2, -1),
        spreadRadius: 0)
  ]);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover)),
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ///for Service category Title
              Container(
                decoration: containerDecoration,
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 5,
              ),

              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ///for expense
                    Container(
                      decoration: containerDecoration,
                      child: Text('Rs. ' + expense.toString(),
                          style: TextStyle(color: Colors.red, fontSize: 12)),
                    ),
                    Container(
                      height: 5,
                    ),

                    ///for date and time

                    Container(
                      decoration: containerDecoration,
                      child: Text(
                          DateTime.now().hour.toString() +
                              ':' +
                              '${DateTime.now().minute}' +
                              '  ' +
                              DateTime.now().day.toString() +
                              '-' +
                              DateTime.now().month.toString() +
                              '-' +
                              DateTime.now().year.toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ),
                  ],
                ),
              ),

              ///for description
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Opacity(
                  opacity: 0.8,
                  child: TextField(
                    maxLines: 6,
                    controller: _descriptionController,
                    autocorrect: false,
                    autofocus: false,
                    cursorColor: Colors.green,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                        border: inputBorder,
                        focusedBorder: inputBorder,
                        filled: true,
                        contentPadding: EdgeInsets.all(8),
                        hintText: 'Give brief description...',
                        fillColor: Colors.grey[100]),
                  ),
                ),
              ),

              ///for go back save and cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ///for backButton
                  Container(
                    decoration: containerDecoration,
                    child: BackButton(
                      color: Colors.deepOrange,
                    ),
                  ),

                  ///for save button
                  Container(
                    decoration: containerDecoration,
                    child: CupertinoButton(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        ///on save add details in category list and update total expense
                        updateSharedPreferences(totalExpense: totalExpense);

                        ///save description and individual expenses
                        saveDetailedExpenses(
                            expense: expense,
                            description: _descriptionController.text != ''
                                ? _descriptionController.text
                                : 'No Details.',
                            date: DateTime.now(),
                            categoryKey: categoryName);

                        ///dismiss 2 dialogs
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  ///for cancel button
                  Container(
                    decoration: containerDecoration,
                    child: CupertinoButton(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  ///to save detailed expenses record in local storage
  Future saveDetailedExpenses(
      {@required double expense,
      @required String description,
      @required DateTime date,
      @required String categoryKey}) async {
    SharedPreferences detailedExpensesPrefs =
        await SharedPreferences.getInstance();
    Map fromLocal=new Map();
    int localLength = 1;
    if (detailedExpensesPrefs.getString('expenseIn' +categoryName) != null) {
      fromLocal = convert.jsonDecode(
          detailedExpensesPrefs.getString('expenseIn' + categoryName));
      localLength = fromLocal.length + 1;
    }
    fromLocal['$localLength'] = [
      '$expense',
      description,
      DateTime.now().toString()
    ];

    ///encode description before storing in local storage
    String encodedDetail = convert.jsonEncode(fromLocal);

    if (categoryKey == 'Kitchen')
      updateSharedPreferences(expenseInKitchen: encodedDetail);
    else if (categoryKey == 'Clothing')
      updateSharedPreferences(expenseInClothing: encodedDetail);
    else if (categoryKey == 'Transportation')
      updateSharedPreferences(expenseInTransportation: encodedDetail);
    else if (categoryKey == 'Foods')
      updateSharedPreferences(expenseInFood: encodedDetail);
    else if (categoryKey == 'Interior')
      updateSharedPreferences(expenseInInterior: encodedDetail);
    else
      updateSharedPreferences(expenseInHealth: encodedDetail);
    print('detailed expenses updated successfully!!!');
    Future.delayed(Duration(seconds: 4)).then((_) {
      print(convert
          .jsonDecode(detailedExpensesPrefs.getString('expenseIn'+categoryName)));
    });
  }
}
