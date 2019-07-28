import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:myexpenses/src/custom_widgets/custom_widgets.dart';
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
        child: GlowingOverscrollIndicator(
          color: primaryColor,
          axisDirection: AxisDirection.right,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
                left: percent(width, 5), right: percent(width, 5)),
            children: <Widget>[
              mainBox(height, width, imagePath: 'assets/images/vegetables.jpg'),
              Container(
                width: percent(width, 2.5),
              ),
              mainBox(height, width, imagePath: 'assets/images/healthcare.jpg'),
              Container(
                width: percent(width, 2.5),
              ),
              mainBox(height, width,imagePath: '')
            ],
          ),
        ),
      ));
}

