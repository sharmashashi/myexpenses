import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as json;

class HomeProvider with ChangeNotifier {
  double incomeBarLength = 0, totalIncome=0.1, expenseBarLength = 0, totalExpense=0.1;
  int remainingDays = 0;

  void initialize() async {
    SharedPreferences myprefs = await SharedPreferences.getInstance();
    myprefs.getDouble('totalIncome') == null
        ? setTotalIncome = 1.0
        : setTotalIncome = myprefs.getDouble('totalIncome')-1;
    myprefs.getDouble('totalExpense') == null
        ? setTotalExpense = 1.0
        : setTotalExpense = myprefs.getDouble('totalExpense')-1;
    if (myprefs.getString('salaryDayDate') != null) {
      DateTime salaryDay = DateTime.parse(myprefs.getString('salaryDayDate'));
      setRemainingDays = salaryDay.difference(DateTime.now()).inDays;
    }
  }

  ///getters
  get getTotalIncome => totalIncome;
  get getTotalExpense => totalExpense;
  get getIncomeBarLength => incomeBarLength;
  get getExpenseBarLength => expenseBarLength;
  get getRemainingDays => remainingDays;

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

  set setRemainingDays(int remainingDays) {
    this.remainingDays = remainingDays;
    notifyListeners();
  }
}
