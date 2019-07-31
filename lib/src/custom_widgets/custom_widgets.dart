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

///returns main box as a child of listview
///to show different information about expenses
Widget mainBox(double height, double width, {String imagePath, Widget child}) {
  return Container(
    width: percent(width, 90),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryColor,
        image: DecorationImage(
            image: imagePath != null
                ? AssetImage(imagePath)
                : NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/White_dot.svg/768px-White_dot.svg.png'),
            fit: BoxFit.cover)),
    child: Center(
      child: child,
    ),
  );
}

///returns horizontal income bar
///
///

///returns button to add income or expense
Widget selectIncomeExpenseButton({String type, IconData iconData,double fullWidth,double fullHeight,Function onPressed}) {
  return MaterialButton(
   padding: EdgeInsets.all(percent(fullWidth,5)),
    highlightColor: Colors.black12,
    animationDuration: Duration(microseconds: 500),
  shape: CircleBorder(),
  child: Icon(iconData,color: Colors.white,),
  color: type=='income'?incomeBarColor:expenseBarColor,
  onPressed: onPressed,
  );
}
