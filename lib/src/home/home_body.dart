import 'package:flutter/material.dart';
import 'package:myexpenses/src/utils/colors.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';

///shows horizontal listview with cards
Widget homeBody({double height, double width}) {
  return Positioned(
      top: percent(height, 20),
      bottom: percent(height, 20),
      child: Container(
        height: percent(height, 60),
        width: width,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(
              left: percent(width, 5), right: percent(width, 5)),
          children: <Widget>[
            mainBox(height, width),
            Container(
              width: percent(width, 2.5),
            ),
            mainBox(height, width)
          ],
        ),
      ));
}

///returns main box as a child of listview
///to show different information about expenses
Widget mainBox(double height, double width) {
  return Container(
    width: percent(width, 90),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryColor,
        image: DecorationImage(
            image: AssetImage('assets/images/vegetables.jpg'),
            fit: BoxFit.cover)),
  );
}
