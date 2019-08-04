import 'package:flutter/material.dart';
import 'package:myexpenses/src/utils/colors.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';

class SelectCategory extends StatefulWidget {
  final double totalExpense, expense;
  SelectCategory({this.totalExpense, this.expense});
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: percent(MediaQuery.of(context).size.height, 50),
      child: ListView(
        padding: EdgeInsets.only(
          left: 30,
        ),
        itemExtent: percent(MediaQuery.of(context).size.width, 25),
        children: <Widget>[
          ///for Kitchen
          createRowCategory(
              image: AssetImage('assets/images/vegetables.jpg'),
              categoryName: 'Kitchen'),

          ///for health
          createRowCategory(
              image: AssetImage('assets/images/healthcare.jpg'),
              categoryName: 'Health Care'),

          ///for health
          createRowCategory(
              image: AssetImage('assets/images/transportation.jpg'),
              categoryName: 'Transportation'),

          ///for health
          createRowCategory(
              image: AssetImage('assets/images/clothing.jpg'),
              categoryName: 'Clothing'),

          ///for health
          createRowCategory(
              image: AssetImage('assets/images/food.jpg'),
              categoryName: 'Foods'),

          ///for health
          createRowCategory(
              image: AssetImage('assets/images/interior.jpg'),
              categoryName: 'Interior'),

        
        ],
      ),
    );
  }

  ///returns row with image and categories
  Widget createRowCategory(
      {@required AssetImage image, @required String categoryName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ///for Image
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: image, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue),
          height: percent(MediaQuery.of(context).size.width, 20),
          width: percent(MediaQuery.of(context).size.width, 30),
          // child: image,
        ),
        Container(
          width: 10,
        ),

        ///for categoryname
        Text(
          categoryName,
          style: TextStyle(
              color: primaryColor, fontWeight: FontWeight.w300, fontSize: 18),
        ),
      ],
    );
  }
}
