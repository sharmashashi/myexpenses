import 'package:shared_preferences/shared_preferences.dart';

void updateSharedPreferences(
    {double totalIncome, double totalExpense, String salaryDayDate}) async {
  SharedPreferences myprefs = await SharedPreferences.getInstance();
  totalIncome != null ? myprefs.setDouble('totalIncome', totalIncome) : null;
  totalExpense != null ? myprefs.setDouble('totalExpense', totalExpense) : null;
  salaryDayDate != null ? myprefs.setString('salaryDayDate', salaryDayDate) : null;
}
