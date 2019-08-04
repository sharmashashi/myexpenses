import 'package:shared_preferences/shared_preferences.dart';

void updateSharedPreferences(
    {double totalIncome,
    double totalExpense,
    String salaryDayDate,
    List<String> expenseInHealth,expenseInFood,expenseInTransportation,expenseInClothing,expenseInKitchen,expenseInterior}) async {
  SharedPreferences myprefs = await SharedPreferences.getInstance();
  totalIncome != null ? myprefs.setDouble('totalIncome', totalIncome) : null;
  totalExpense != null ? myprefs.setDouble('totalExpense', totalExpense) : null;
  salaryDayDate != null
      ? myprefs.setString('salaryDayDate', salaryDayDate)
      : null;

  ///expense categories
  expenseInHealth != null
      ? myprefs.setStringList('expenseInHealth', expenseInHealth)
      : null;
       expenseInKitchen != null
      ? myprefs.setStringList('expenseInKitchen', expenseInKitchen)
      : null;
}
