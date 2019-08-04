import 'package:flutter/material.dart';
import 'package:myexpenses/src/utils/colors.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';

///widget that returns circular shape with remaining days
Widget widgetSalaryDay(int remainingDays,BuildContext context,Function onTap) {
  return InkWell(
    onTap: onTap,
      child: Container(
      alignment: Alignment.center,
      height: percent(MediaQuery.of(context).size.height, 7),
      width: percent(MediaQuery.of(context).size.height, 7),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: primaryColor, boxShadow: [
        BoxShadow(
            color: Colors.grey,
            blurRadius: 1.5,
            offset: Offset(1, 1),
            spreadRadius: (0.5))
      ]),
      child: Container(
        alignment: Alignment.center,
        height: percent(MediaQuery.of(context).size.height, 6),
        width: percent(MediaQuery.of(context).size.height, 6),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Text(
          '$remainingDays days',
          style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 10),
        ),
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
Widget incomeBar(var homeProvider, double fullWidth) {
  double width;
  // double income, expense;
  // if (homeProvider.getTotalIncome == null)
  //   income = 0.1;
  // else
  //   income = homeProvider.getTotalIncome;
  // if (homeProvider.getTotalExpense == null)
  //   expense = 0.1;
  // else
  //   expense = homeProvider.getTotalExpense;

  width = percent(fullWidth, 55) -
      (homeProvider.getTotalExpense *
          percent(fullWidth, 55) /
          homeProvider.getTotalIncome);

  if (width <= 0) width = 1;
  return Container(
    alignment: Alignment.center,
    child: Text(
      homeProvider.getTotalIncome.truncate().toString(),
      style: TextStyle(
          color: Colors.white,
          fontSize: percent(fullWidth, 2),
          fontWeight: FontWeight.bold),
    ),
    height: 10,
    width: width,
    decoration: BoxDecoration(
        color: incomeBarColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
  );
}

//returns horizontal income bar
Widget expenseBar(var homeProvider, double fullWidth) {
  double width;
  // double income, expense;

  // if (homeProvider.getTotalIncome == null)
  //   income = 0.1;
  // else
  //   income = homeProvider.getTotalIncome;
  // if (homeProvider.getTotalExpense == null)
  //   expense = 0.1;
  // else
  //   expense = homeProvider.getTotalExpense;
  width = (homeProvider.getTotalExpense *
      percent(fullWidth, 55) /
      homeProvider.getTotalIncome);

  if (width <= 0) width = 1;
  if (width > percent(fullWidth, 55)) width = percent(fullWidth, 55);
  return Container(
    alignment: Alignment.center,
    child: Text(
      homeProvider.getTotalExpense.truncate().toString(),
      style: TextStyle(
          color: Colors.white,
          fontSize: percent(fullWidth, 2),
          fontWeight: FontWeight.bold),
    ),
    height: 10,
    width: width,
    decoration: BoxDecoration(
        color: expenseBarColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
  );
}

///returns button to add income or expense
Widget selectIncomeExpenseButton(
    {String type,
    IconData iconData,
    double fullWidth,
    double fullHeight,
    Function onPressed}) {
  return MaterialButton(
    padding: EdgeInsets.all(percent(fullWidth, 5)),
    highlightColor: Colors.black12,
    animationDuration: Duration(microseconds: 500),
    shape: CircleBorder(),
    child: Icon(
      iconData,
      color: Colors.white,
    ),
    color: type == 'income' ? incomeBarColor : expenseBarColor,
    onPressed: onPressed,
  );
}
