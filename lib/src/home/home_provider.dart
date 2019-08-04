import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider with ChangeNotifier {
  double incomeBarLength = 0,
      totalIncome ,
      expenseBarLength = 0,
      totalExpense ;

  void initialize() async {
    SharedPreferences myprefs = await SharedPreferences.getInstance();
   myprefs.getDouble('totalIncome')==null?setTotalIncome=1.0: setTotalIncome = myprefs.getDouble('totalIncome');
    myprefs.getDouble('totalExpense')==null?setTotalExpense=1.0:setTotalExpense = myprefs.getDouble('totalExpense');
  }

  ///getters
  get getTotalIncome => totalIncome;
  get getTotalExpense => totalExpense;
  get getIncomeBarLength => incomeBarLength;
  get getExpenseBarLength => expenseBarLength;

  ///setters
  set setTotalIncome(double totalIncome) {
    this.totalIncome = totalIncome;
    notifyListeners();
  }

  set setTotalExpense(double totalExpense) {
    this.totalExpense = totalExpense;
    notifyListeners();
  }

  set setIncomeBarLength(double length) {
    this.incomeBarLength = length;
    notifyListeners();
  }

  set setExpenseBarLength(double length) {
    this.expenseBarLength = length;
    notifyListeners();
  }
}
