import 'package:flutter/material.dart';
import 'package:myexpenses/src/custom_widgets/custom_widgets.dart';
import 'package:myexpenses/src/home/app_bar.dart';
import 'package:myexpenses/src/home/home_body.dart';
import 'package:myexpenses/src/home/home_provider.dart';
import 'package:myexpenses/src/local_storage/sharedPreferences.dart';
import 'package:myexpenses/src/utils/colors.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget textFieldButton = Container(
    height: 0,
  );
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = '0';
    return ChangeNotifierProvider<HomeProvider>(
      builder: (context) => HomeProvider(),
      child: Builder(builder: (BuildContext context) {
        ///full height and width of screen
        double _fullHeight = MediaQuery.of(context).size.height,
            _fullWidth = MediaQuery.of(context).size.width;

        ///home provider to set and get
        var _homeProvider = Provider.of<HomeProvider>(context);
        _homeProvider.initialize();
        print(_homeProvider.getTotalIncome);
        print(_homeProvider.getTotalExpense);
        Widget _incomeExpenseBody =
            createIncomeEXpenseBody(_homeProvider, _fullHeight, _fullWidth);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.zero,
            child: Container(
              color: primaryColor,
            ),
          ),
          body: Stack(
            children: <Widget>[
              ///app bar
              appBar(
                fullHeight: _fullHeight,
                fullWidth: _fullWidth,
              ),
              homeBody(height: _fullHeight, width: _fullWidth),

              ///bottom of home
              Positioned(
                top: percent(_fullHeight, 77),
                bottom: 0,
                child: Container(
                    height: percent(_fullHeight, 23),
                    width: _fullWidth,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.green[100],
                            Colors.green[200],
                            Colors.green[300],
                            Colors.green[400],
                            Colors.green[500],
                            primaryColor
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    )),
              ),

              ///for input expense button
              Positioned(
                  bottom: percent(_fullHeight, 20),
                  child: Container(
                      width: percent(_fullWidth, 100),
                      child: _incomeExpenseBody)),

              ///for text input
              Positioned(
                left: percent(_fullWidth, 15),
                right: percent(_fullWidth, 0),
                bottom: percent(_fullHeight, 5),
                child: textFieldButton,
              )
            ],
          ),
        );
      }),
    );
  }

  ///returns incomeExpenseBody
  Widget createIncomeEXpenseBody(
      var homeProvider, double _fullHeight, double _fullWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ///for income button
        selectIncomeExpenseButton(
            type: 'income',
            iconData: Icons.add,
            fullHeight: _fullHeight,
            fullWidth: _fullWidth,
            onPressed: onIncomeExpensePressed(
                homeProvider, 'Todays Income', _fullWidth, _fullHeight)),

        ///for expense button
        selectIncomeExpenseButton(
            type: 'expense',
            iconData: Icons.remove,
            fullHeight: _fullHeight,
            fullWidth: _fullWidth,
            onPressed: onIncomeExpensePressed(
                homeProvider, 'Todays Expense', _fullWidth, _fullHeight)),
      ],
    );
  }

  ///returns textfield and button to add income or expense
  Widget createTextFieldButton(var homeProvider,
      {String type, double fullWidth, double fullHeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ///for textField
        Flexible(
          flex: 1,
          child: TextField(
            keyboardType: TextInputType.number,
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                hintText: type,
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(percent(fullHeight, 100)))),
          ),
        ),

        ///for done button
        MaterialButton(
          color: Colors.blue,
          shape: CircleBorder(),
          child: Icon(
            Icons.done,
            color: Colors.white,
          ),
          onPressed: () {
            print(type);

            ///save income or expense data and remove textField
            ///for total income
            homeProvider.getTotalIncome != null
                ? updateSharedPreferences(
                    totalIncome: type == 'Todays Income'
                        ? double.parse(controller.text) +
                            homeProvider.getTotalIncome
                        : homeProvider.getTotalIncome,
                    totalExpense: type == 'Todays Expense'
                        ? double.parse(controller.text) +
                            homeProvider.getTotalExpense
                        : homeProvider.getTotalExpense)
                : updateSharedPreferences(totalIncome: 0);

            ///for total expense
            homeProvider.getTotalExpense != null
                ? updateSharedPreferences(
                    totalIncome: type == 'Todays Income'
                        ? double.parse(controller.text) +
                            homeProvider.getTotalIncome
                        : homeProvider.getTotalIncome,
                    totalExpense: type == 'Todays Expense'
                        ? double.parse(controller.text) +
                            homeProvider.getTotalExpense
                        : homeProvider.getTotalExpense)
                : updateSharedPreferences(totalExpense: 0);
            setState(() {
              textFieldButton = Container(
                height: 0,
              );
            });
          },
        )
      ],
    );
  }

  ///onpressed for incomeExpensebutton
  Function onIncomeExpensePressed(
      var homeProvider, String type, double fullWidth, double fullHeight) {
    return () {
      setState(() {
        textFieldButton = createTextFieldButton(homeProvider,
            type: type, fullHeight: fullHeight, fullWidth: fullWidth);
      });
    };
  }
}
