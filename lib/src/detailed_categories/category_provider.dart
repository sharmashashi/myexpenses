import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class CategoryProvider extends ChangeNotifier {
  Map expenseInKitchen = {},
      expenseInHealth = {},
      expenseInTransportation = {},
      expenseInClothing = {},
      expenseInFoods = {},
      expenseInOther = {};

  initKitchen() async {
    SharedPreferences kitchenPref = await SharedPreferences.getInstance();
    print(convert.jsonDecode(kitchenPref.getString('expenseInKitchen')));
  }

  ///getters

  ///setters
}
