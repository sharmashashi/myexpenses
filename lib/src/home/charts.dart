import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;
import 'package:myexpenses/src/utils/dimention_in_percent.dart';

class Charts extends StatefulWidget {
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: percent(MediaQuery.of(context).size.height, 10),
      left: percent(MediaQuery.of(context).size.width, 5),
      child: Container(
        color: Colors.blue,
        height: percent(MediaQuery.of(context).size.height, 60),
        width: percent(MediaQuery.of(context).size.width, 90),

        ///for chart
        
      ),
    );
  }
}
