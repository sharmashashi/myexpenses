import 'package:flutter/material.dart';

class BarChartProvider extends ChangeNotifier {
  double chartWidth = 0, chartHeight = 0;
  double kitchen = 0,
      health = 0,
      transportation = 0,
      clothing = 0,
      foods = 0,
      other = 0;

  ///getter
  get getKitchenHeight => kitchen;
  get getHealthHeight => health;
  get getTransportationHeight => transportation;
  get getClothingHeight => clothing;
  get getFoodsHeight => foods;
  get getOtherHeight => other;

  ///setter
  set setKitchenHeight(double height) {
    this.kitchen = height;
    notifyListeners();
  }

  set setHealthHeight(double height) {
    this.health = height;
    notifyListeners();
  }

  set setTransportationHeight(double height) {
    this.transportation = height;
    notifyListeners();
  }

  set setClothingHeight(double height) {
    this.clothing = height;
    notifyListeners();
  }

  set setFoodsHeight(double height) {
    this.foods = height;
    notifyListeners();
  }

  set setOtherHeight(double height) {
    this.other = height;
    notifyListeners();
  }
}
