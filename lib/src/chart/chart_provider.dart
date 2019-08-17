import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class BarChartProvider extends ChangeNotifier {
  double chartWidth = 0, chartHeight = 0;
  double kitchen = 0,
      health = 0,
      transportation = 0,
      clothing = 0,
      foods = 0,
      other = 0,
      totalExpense = 0;

  initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setTotalExpense = prefs.getDouble('totalExpense');

    ///check for null value and if not then update totalexpense in each item in this provider
    if (prefs.getString('expenseInKitchen') != null) {
      setKitchenTotal =
          totalExpenseMiner(prefs, categoryKey: 'expenseInKitchen');
    }
     if (prefs.getString('expenseInHealth') != null) {
      setHealthTotal =
          totalExpenseMiner(prefs, categoryKey: 'expenseInHealth');
    }
     if (prefs.getString('expenseInTransportation') != null) {
      setTransportationTotal =
          totalExpenseMiner(prefs, categoryKey: 'expenseInTransportation');
    }
     if (prefs.getString('expenseInClothing') != null) {
      setClothingTotal =
          totalExpenseMiner(prefs, categoryKey: 'expenseInClothing');
    }
     if (prefs.getString('expenseInFood') != null) {
      setFoodsTotal =
          totalExpenseMiner(prefs, categoryKey: 'expenseInFood');
    }
     if (prefs.getString('expenseInother') != null) {
      setOtherTotal =
          totalExpenseMiner(prefs, categoryKey: 'expenseInother');
    }
  }

  ///returns total expense in specified category
  double totalExpenseMiner(SharedPreferences prefs, {String categoryKey}) {
    double total = 0;
    Map categoryDetailMap = convert.jsonDecode(prefs.getString(categoryKey));
    for (int i = 1; i <= categoryDetailMap.length; i++) {
      total += double.parse(categoryDetailMap['$i'][0]);
    }
    return total;
  }

  ///getter
  get getKitchenTotal => kitchen;
  get getHealthTotal => health;
  get getTransportationTotal => transportation;
  get getClothingTotal => clothing;
  get getFoodsTotal => foods;
  get getOtherTotal => other;
  get getTotalExpense => totalExpense;

  ///setter
  set setKitchenTotal(double height) {
    this.kitchen = height;
    notifyListeners();
  }

  set setHealthTotal(double height) {
    this.health = height;
    notifyListeners();
  }

  set setTransportationTotal(double height) {
    this.transportation = height;
    notifyListeners();
  }

  set setClothingTotal(double height) {
    this.clothing = height;
    notifyListeners();
  }

  set setFoodsTotal(double height) {
    this.foods = height;
    notifyListeners();
  }

  set setOtherTotal(double height) {
    this.other = height;
    notifyListeners();
  }

  set setTotalExpense(double total) {
    this.totalExpense = total;
    notifyListeners();
  }
}
