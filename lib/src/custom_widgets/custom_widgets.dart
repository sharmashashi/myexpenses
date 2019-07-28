import 'package:flutter/material.dart';
import 'package:myexpenses/src/utils/colors.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';

///widget that returns circular shape with remaining days
Widget widgetSalaryDay(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    height: percent(MediaQuery.of(context).size.height, 7),
    width: percent(MediaQuery.of(context).size.height, 7),
    decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
    child: Container(
      alignment: Alignment.center,
      height: percent(MediaQuery.of(context).size.height, 6),
      width: percent(MediaQuery.of(context).size.height, 6),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Text(
        '19 days',
        style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 10),
      ),
    ),
  );
}
