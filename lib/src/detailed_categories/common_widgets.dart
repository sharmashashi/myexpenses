import 'package:flutter/material.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';
import 'package:myexpenses/src/utils/month.dart' as prefix0;

Widget commonWidget(
    {BuildContext context, double expense, String date, String description,Gradient gradient}) {
  int year = DateTime.parse(date).year;
  String month = prefix0.month[DateTime.parse(date).month];
  int day = DateTime.parse(date).day;


  return Center(
    child: Container(
      height: percent(MediaQuery.of(context).size.height, 15),
      width: percent(MediaQuery.of(context).size.width, 90),
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          ///for description
          Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: percent(MediaQuery.of(context).size.height, 0)),
              alignment: Alignment.centerLeft,
              height: percent(MediaQuery.of(context).size.height, 15),
              width: percent(MediaQuery.of(context).size.width, 85),
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: gradient,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ],
                  borderRadius: BorderRadius.circular(
                      percent(MediaQuery.of(context).size.width, 3))),

              ///description
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ///for cancel icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          child: Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.red,
                          ),
                          onTap: () {
                            ///perform actions here after clicking cancel button
                          },
                        ),
                      )
                    ],
                  ),

                  ///for description
                  Padding(
                    padding: EdgeInsets.only(
                        left: percent(MediaQuery.of(context).size.height, 6)),
                    child: Text(
                      '$description',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ///for date
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '$month $day $year',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          ///for Expense ammount
          Positioned(
            top: percent(MediaQuery.of(context).size.height, 3.5),
            left: 0,
            child: Container(
                alignment: Alignment.center,
                width: percent(MediaQuery.of(context).size.height, 8),
                height: percent(MediaQuery.of(context).size.height, 8),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        offset: Offset(1, 1),
                        spreadRadius: 1,
                        color: Colors.grey)
                  ],
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Text(
                  '-${expense.round()}',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    ),
  );
}
