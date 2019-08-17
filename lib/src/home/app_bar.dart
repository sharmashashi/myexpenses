import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myexpenses/src/custom_widgets/custom_widgets.dart';
import 'package:myexpenses/src/local_storage/sharedPreferences.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';

Widget appBar(var homeProvider, {double fullHeight, double fullWidth}) {
  return Positioned(
    left: percent(fullWidth, 5),
    right: percent(fullWidth, 5),
    top: 0,
    child: Container(
      height: percent(fullHeight, 8),
      width: percent(fullWidth, 90),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 2.5,
              spreadRadius: 1,
              color: Colors.grey)
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ///a container to fill upto 80 percent of width
          Container(
            width: percent(fullWidth, 75),

            /// to add three bars
            child: Row(
              children: <Widget>[
                ///for remaining balance and expenses
                Padding(
                  padding: EdgeInsets.only(left: percent(fullWidth, 2.5)),
                  child: Container(
                    width: percent(fullWidth, 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Income',
                          style:
                              TextStyle(color: Colors.green[900], fontSize: 12),
                        ),
                        Text(
                          'Expenses',
                          style:
                              TextStyle(color: Colors.red[900], fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),

                ///vertical bar
                Padding(
                  padding: EdgeInsets.only(left: percent(fullWidth, 1.0)),
                  child: Container(
                    height: percent(fullHeight, 7),
                    width: percent(fullWidth, 1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.amber),
                  ),
                ),

                ///for two bars

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ///for income
                    incomeBar(homeProvider, fullWidth),

                    ///for expenses
                    expenseBar(homeProvider, fullWidth)
                  ],
                )
              ],
            ),
          ),

          /// remaining days to get salary Widget
          Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: Builder(
              builder: (BuildContext context) => widgetSalaryDay(
                  homeProvider.getRemainingDays, context, () async {
                final DateTime date = await showDatePicker(
                    context: context,
                    initialDatePickerMode: DatePickerMode.day,
                    firstDate: DateTime.now(),
                    initialDate: DateTime.now(),
                    lastDate: DateTime(2020),
                    builder: (context, widget) {
                      return Theme(data: ThemeData.light(),child: widget,);
                    });

                ///update local storage with remaining days to get salary
                if (date != null)
                  updateSharedPreferences(salaryDayDate: date.toString());
              }),
            ),
          )
        ],
      ),
    ),
  );
}
