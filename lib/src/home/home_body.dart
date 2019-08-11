import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:myexpenses/src/custom_widgets/custom_widgets.dart';
import 'package:myexpenses/src/home/detailed_expense_list_builder.dart';
import 'package:myexpenses/src/utils/colors.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';

///shows horizontal listview with cards
Widget homeBody({double height, double width}) {
  return Positioned(
      top: percent(height, 10),
      bottom: percent(height, 30),
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
                ///items that scrolls horizontally 
            children: <Widget>[
              ///for kitchen
              Stack(
                children: <Widget>[
                  Opacity(opacity: 0.2,child: mainBox(height, width, imagePath: 'assets/images/vegetables.jpg')),
                 DetailedExpenseListBuilder()
                ],
              ),
              Container(
                width: percent(width, 2.5),
              ),
             
            ],
          ),
        ),
      ));
}

