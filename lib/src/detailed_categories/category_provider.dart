import 'package:flutter/material.dart';
import 'package:myexpenses/src/detailed_categories/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class CategoryProvider extends ChangeNotifier {
  Map expenseInKitchen = {},
      expenseInHealth = {},
      expenseInTransportation = {},
      expenseInClothing = {},
      expenseInFoods = {},
      expenseInOther = {};
  List<Widget> _kitchenList = [],
      _healthList = [],
      _transportationList = [],
      _clothingList = [],
      _foodsList = [],
      _otherList = [];

  init(
      {@required var provider,
      @required categoryKey,
      @required BuildContext context,Gradient gradient}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    ///call function which returns a list of widget with filled data

    ///for kitchen
    if (categoryKey == 'expenseInKitchen') {
      if (pref.getString(categoryKey) != null) {
        setKitchenList = fillWithDetailedWidgets(
            detail: convert.jsonDecode(pref.getString(categoryKey)),
            context: context,gradient: gradient);
      } else
        setKitchenList = [
          Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text('No expenses'),
            ),
          )
        ];
    }

    ///for health
    else if (categoryKey == 'expenseInHealth') {
      if (pref.getString(categoryKey) != null) {
        setHealthList = fillWithDetailedWidgets(
            detail: convert.jsonDecode(pref.getString(categoryKey)),
            context: context,gradient: gradient);
      } else
        setHealthList = [
          Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text('No expenses'),
            ),
          )
        ];
    }

    ///for transportation
    else if (categoryKey == 'expenseInTransportation') {
      if (pref.getString(categoryKey) != null) {
        setTransportationList = fillWithDetailedWidgets(
            detail: convert.jsonDecode(pref.getString(categoryKey)),
            context: context,gradient: gradient);
      } else
        setTransportationList = [
          Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text('No expenses'),
            ),
          )
        ];
    }

    ///for clothing
    else if (categoryKey == 'expenseInClothing') {
      if (pref.getString(categoryKey) != null) {
        setClothingList = fillWithDetailedWidgets(
            detail: convert.jsonDecode(pref.getString(categoryKey)),
            context: context,gradient: gradient);
      } else
        setClothingList = [
          Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text('No expenses'),
            ),
          )
        ];
    }

    ///for food
    else if (categoryKey == 'expenseInFood') {
      if (pref.getString(categoryKey) != null) {
        setFoodsList = fillWithDetailedWidgets(
            detail: convert.jsonDecode(pref.getString(categoryKey)),
            context: context,gradient: gradient);
      } else
        setFoodsList = [
          Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text('No expenses'),
            ),
          )
        ];
    }

    ///for other

    else if (categoryKey == 'expenseInother') {
      if (pref.getString(categoryKey) != null) {
        setOtherList = fillWithDetailedWidgets(
            detail: convert.jsonDecode(pref.getString(categoryKey)),
            context: context,gradient: gradient);
      } else
        setOtherList = [
          Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text('No expenses'),
            ),
          )
        ];
    } else
      print('error in categoryKey passed to provider');
  }

  ///this function fills a list with widgets
  ///which contains detail expenses in relative category
  List<Widget> fillWithDetailedWidgets({Map detail, BuildContext context,Gradient gradient}) {
    List<Widget> tempList = [];
    for (int i = 1; i <= detail.length; i++) {
      List temp = detail['$i'];
      tempList.add(commonWidget(
        gradient: gradient,
          context: context,
          date: temp[2],
          expense: double.parse(temp[0]),
          description: temp[1]));
    }
    return tempList;
  }

  ///getters
  get getKitchenList => _kitchenList;
  get getHealthList => _healthList;
  get getTransportationList => _transportationList;
  get getClothingList => _clothingList;
  get getFoodsList => _foodsList;
  get getOtherList => _otherList;

  ///setters
  set setKitchenList(List<Widget> list) {
    this._kitchenList = list;
    notifyListeners();
  }

  set setTransportationList(List<Widget> list) {
    this._transportationList = list;
    notifyListeners();
  }

  set setHealthList(List<Widget> list) {
    this._healthList = list;
    notifyListeners();
  }

  set setClothingList(List<Widget> list) {
    this._clothingList = list;
    notifyListeners();
  }

  set setFoodsList(List<Widget> list) {
    this._foodsList = list;
    notifyListeners();
  }

  set setOtherList(List<Widget> list) {
    this._otherList = list;
    notifyListeners();
  }
}
