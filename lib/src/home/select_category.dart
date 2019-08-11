import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myexpenses/src/home/add_expense_descprition.dart';
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
              imagePath: 'assets/images/vegetables.jpg',
              categoryName: 'Kitchen'),

          ///for health
          createRowCategory(
              imagePath: 'assets/images/healthcare.jpg',
              categoryName: 'Health'),

          ///for health
          createRowCategory(
              imagePath: 'assets/images/transportation.jpg',
              categoryName: 'Transportation'),

          ///for health
          createRowCategory(
              imagePath: 'assets/images/clothing.jpg',
              categoryName: 'Clothing'),

          ///for health
          createRowCategory(
              imagePath: 'assets/images/food.jpg', categoryName: 'Foods'),

          ///for health
          createRowCategory(
              imagePath: 'assets/images/interior.jpg',
              categoryName: 'Interior'),
        ],
      ),
    );
  }

  ///returns row with image and categories
  Widget createRowCategory(
      {@required String imagePath, @required String categoryName}) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ///for Image
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent),
            height: percent(MediaQuery.of(context).size.width, 20),
            width: percent(MediaQuery.of(context).size.width, 30),
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
      ),

      ///apply ontap to save expense and
      ///give space to fill description
      onTap: () {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => SimpleDialog(
                  // contentPadding: EdgeInsets.all(10),
                  backgroundColor: Colors.transparent,
                  elevation: 100,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  children: [
                    ExpenseDescription(
                      categoryName: categoryName,
                      totalExpense: widget.totalExpense,
                      expense: widget.expense,
                      imagePath: imagePath,
                    )
                  ],
                ));
       
      },
    );
  }
}
