import 'package:flutter/material.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';

class DetailedExpenseListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: percent(MediaQuery.of(context).size.height, 100),
      width: percent(MediaQuery.of(context).size.width, 100),
      child: ListView.builder(
        padding: EdgeInsets.all(25),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Text('one');
        },
      ),
    );
  }
}
