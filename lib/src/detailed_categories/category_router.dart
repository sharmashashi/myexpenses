import 'package:flutter/material.dart';
import 'package:myexpenses/src/detailed_categories/clothing.dart';
import 'package:myexpenses/src/detailed_categories/foods.dart';
import 'package:myexpenses/src/detailed_categories/health.dart';
import 'package:myexpenses/src/detailed_categories/kitchen.dart';
import 'package:myexpenses/src/detailed_categories/other.dart';
import 'package:myexpenses/src/detailed_categories/transportation.dart';

class CategoryRouter extends StatelessWidget {
  final categoryKey;
  CategoryRouter({this.categoryKey});
 
  @override
  Widget build(BuildContext context) {
    return categoryKey == 'Kitchen'
            ? Kitchen()
            : categoryKey == 'Health'
                ? Health()
                : categoryKey == 'Transportation'
                    ? Transportation()
                    : categoryKey == 'Clothing'
                        ? Clothing()
                        : categoryKey == 'Foods'
                            ? Foods()
                            : categoryKey == 'Other'
                                ? Other()
                                : Container(
                                    color: Colors.white,
                                  );
  }
}
