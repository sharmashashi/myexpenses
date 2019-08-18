import 'package:shared_preferences/shared_preferences.dart';

void updateSharedPreferences(
    {double totalIncome,
    double totalExpense,
    String salaryDayDate,
    String expenseInHealth,
    expenseInFood,
    expenseInTransportation,
    expenseInClothing,
    expenseInKitchen,
    expenseInother}) async {
  SharedPreferences myprefs = await SharedPreferences.getInstance();
  totalIncome != null ? myprefs.setDouble('totalIncome', totalIncome) : null;
  totalExpense != null ? myprefs.setDouble('totalExpense', totalExpense) : null;
  salaryDayDate != null
      ? myprefs.setString('salaryDayDate', salaryDayDate)
      : null;

  ///expense categories
  expenseInHealth != null
      ? myprefs.setString('expenseInHealth', expenseInHealth)
      : null;
  expenseInKitchen != null
      ? myprefs.setString('expenseInKitchen', expenseInKitchen)
      : null;
  expenseInClothing != null
      ? myprefs.setString('expenseInClothing', expenseInClothing)
      : null;
  expenseInFood != null
      ? myprefs.setString('expenseInFood', expenseInFood)
      : null;
  expenseInother != null
      ? myprefs.setString('expenseInother', expenseInother)
      : null;
  expenseInTransportation != null
      ? myprefs.setString('expenseInTransportation', expenseInTransportation)
      : null;
}
