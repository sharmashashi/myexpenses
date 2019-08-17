import 'package:flutter/material.dart';
import 'package:myexpenses/src/detailed_categories/clothing.dart';
import 'package:myexpenses/src/detailed_categories/foods.dart';
import 'package:myexpenses/src/detailed_categories/health.dart';
import 'package:myexpenses/src/detailed_categories/kitchen.dart';
import 'package:myexpenses/src/detailed_categories/other.dart';
import 'package:myexpenses/src/detailed_categories/transportation.dart';

class CategoryRouter extends StatelessWidget {
  final String categoryKey;
  final Color color;
  CategoryRouter({this.categoryKey, this.color});

  @override
  Widget build(BuildContext context) {
    return categoryKey == 'Kitchen'
        ? Kitchen(color:color)
        : categoryKey == 'Health'
            ? Health(color:color)
            : categoryKey == 'Transportation'
                ? Transportation(color:color)
                : categoryKey == 'Clothing'
                    ? Clothing(color:color)
                    : categoryKey == 'Foods'
                        ? Foods(color:color)
                        : categoryKey == 'Other'
                            ? Other(color:color)
                            : Container(
                                color: Colors.white,
                              );
  }
}
