import 'package:flutter/material.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';

Widget commonWidget({BuildContext context}) {
  return Center(
    child: Container(
      height: percent(MediaQuery.of(context).size.height, 10),
      width: percent(MediaQuery.of(context).size.width, 90),
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          ///for description
          Positioned(
            right: 0,
                      child: Container(
              height: percent(MediaQuery.of(context).size.height, 10),
              width: percent(MediaQuery.of(context).size.width, 85),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ],
                  borderRadius: BorderRadius.circular(
                      percent(MediaQuery.of(context).size.width, 3))),
            ),
          ),

          ///for Expense ammount
          Positioned(
            top:percent( MediaQuery.of(context).size.height,1),
            left: 0,
            child: Container(
              
              width: percent(MediaQuery.of(context).size.height, 8),
              height: percent(MediaQuery.of(context).size.height, 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 2,offset: Offset(1,1),spreadRadius: 1,color: Colors.grey)
                ],
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
