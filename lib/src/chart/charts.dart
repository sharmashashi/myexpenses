import 'package:flutter/material.dart';
import 'package:myexpenses/src/chart/chart_provider.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';

import 'package:provider/provider.dart';

class Charts extends StatefulWidget {
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          ///for left percentages
          Positioned(
            left: -percent(MediaQuery.of(context).size.width, 5),
            child: Container(
              height: percent(MediaQuery.of(context).size.height, 50),
              width: percent(MediaQuery.of(context).size.width, 95),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  createPercent(
                      '100', percent(MediaQuery.of(context).size.width, 90)),
                  createPercent(
                      '90', percent(MediaQuery.of(context).size.width, 90)),
                  createPercent(
                      '80', percent(MediaQuery.of(context).size.width, 90)),
                  createPercent(
                      '70', percent(MediaQuery.of(context).size.width, 90)),
                  createPercent(
                      '60', percent(MediaQuery.of(context).size.width, 90)),
                  createPercent(
                      '50', percent(MediaQuery.of(context).size.width, 90)),
                  createPercent(
                      '40', percent(MediaQuery.of(context).size.width, 90)),
                  createPercent(
                      '30', percent(MediaQuery.of(context).size.width, 90)),
                  createPercent(
                      '20', percent(MediaQuery.of(context).size.width, 90)),
                  createPercent(
                      '10', percent(MediaQuery.of(context).size.width, 90)),
                  createPercent(
                      '0', percent(MediaQuery.of(context).size.width, 90)),
                ],
              ),
            ),
          ),

          ///for percent horizontal bars
          Positioned(
            left: 0,
            child: Container(
              height: percent(MediaQuery.of(context).size.height, 50),
              width: percent(MediaQuery.of(context).size.width, 95),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  createColumnItem(
                      percent(MediaQuery.of(context).size.width, 90)),
                  createColumnItem(
                      percent(MediaQuery.of(context).size.width, 90)),
                  createColumnItem(
                      percent(MediaQuery.of(context).size.width, 90)),
                  createColumnItem(
                      percent(MediaQuery.of(context).size.width, 90)),
                  createColumnItem(
                      percent(MediaQuery.of(context).size.width, 90)),
                  createColumnItem(
                      percent(MediaQuery.of(context).size.width, 90)),
                  createColumnItem(
                      percent(MediaQuery.of(context).size.width, 90)),
                  createColumnItem(
                      percent(MediaQuery.of(context).size.width, 90)),
                  createColumnItem(
                      percent(MediaQuery.of(context).size.width, 90)),
                  createColumnItem(
                      percent(MediaQuery.of(context).size.width, 90)),
                  createColumnItem(
                      percent(MediaQuery.of(context).size.width, 90)),
                ],
              ),
            ),
          ),

          ///for bars

          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: BorderDirectional(
                    start: BorderSide(color: Colors.grey),
                    bottom: BorderSide(color: Colors.grey))),
            height: percent(MediaQuery.of(context).size.height, 50),
            width: percent(MediaQuery.of(context).size.width, 90),
            alignment: Alignment.bottomLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ///for kitchen
                CategoryItem(
                  regionHeight: percent(MediaQuery.of(context).size.height, 50),
                  regionWidth: percent(MediaQuery.of(context).size.width, 90),
                  itemKey: 'Kitchen',
                ),

                ///for health
                CategoryItem(
                  regionHeight: percent(MediaQuery.of(context).size.height, 50),
                  regionWidth: percent(MediaQuery.of(context).size.width, 90),
                  itemKey: 'Health',
                ),

                ///for transportation
                CategoryItem(
                  regionHeight: percent(MediaQuery.of(context).size.height, 50),
                  regionWidth: percent(MediaQuery.of(context).size.width, 90),
                  itemKey: 'Transportation',
                ),

                ///for clothing
                CategoryItem(
                  regionHeight: percent(MediaQuery.of(context).size.height, 50),
                  regionWidth: percent(MediaQuery.of(context).size.width, 90),
                  itemKey: 'Clothing',
                ),

                ///for foods
                CategoryItem(
                  regionHeight: percent(MediaQuery.of(context).size.height, 50),
                  regionWidth: percent(MediaQuery.of(context).size.width, 90),
                  itemKey: 'Foods',
                ),

                ///for other
                CategoryItem(
                  regionHeight: percent(MediaQuery.of(context).size.height, 50),
                  regionWidth: percent(MediaQuery.of(context).size.width, 90),
                  itemKey: 'Other',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///returns a column to represent horizontal line
  ///to show in left of chart
  Widget createColumnItem(double regionWidth) {
    return

        ///for horizontal line
        Container(
      height: 1,
      color: Colors.grey[300],
      width: regionWidth,
    );
  }

  ///returns percent
  Widget createPercent(String percentage, double regionWidth) {
    return Container(
        alignment: Alignment.center,
        width: percent(regionWidth, 4.5),
        child: Text(percentage,
            style: TextStyle(color: Colors.black, fontSize: 8)));
  }
}

class CategoryItem extends StatefulWidget {
  final regionHeight, regionWidth, provider, itemKey;
  CategoryItem(
      {this.regionHeight, this.regionWidth, this.provider, this.itemKey});
  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  final Map<String, Color> barColors = {
    "Kitchen": Colors.green,
    "Health": Colors.deepPurple,
    "Transportation": Colors.cyan,
    "Clothing": Colors.indigo,
    "Foods": Colors.deepOrange,
    "Other": Colors.black
  };

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BarChartProvider>(
      builder: (context) => BarChartProvider(),
      child: Builder(builder: (BuildContext context) {
        ///initialize provider
        var _barChartProvider = Provider.of<BarChartProvider>(context);
        _barChartProvider.initialize();
        final Map providerGetters = {
          "Kitchen": _barChartProvider.getKitchenTotal,
          "Health": _barChartProvider.getHealthTotal,
          "Transportation": _barChartProvider.getTransportationTotal,
          "Clothing": _barChartProvider.getClothingTotal,
          "Foods": _barChartProvider.getFoodsTotal,
          "Other": _barChartProvider.getOtherTotal
        };
        return

            ///for graphical bar
            Container(
          alignment: Alignment.center,
          height: _barChartProvider.getTotalExpense != 0
              ? (percent(widget.regionHeight, 100) /
                          _barChartProvider.getTotalExpense) *
                      providerGetters[widget.itemKey] 
                  
              : 0,
          width: percent(widget.regionWidth, 10),
          color: barColors[widget.itemKey],
          child: Text(
            '${_barChartProvider.getTotalExpense != 0 ? (providerGetters[widget.itemKey] * 100 / (_barChartProvider.totalExpense)).round() : 0}%',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 8),
          ),
        );
      }),
    );
  }
}

///widget for chart item info
class ChartItemText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                createChartItemText('Kitchen', Colors.green),
                createChartItemText('Health', Colors.deepPurple),
                createChartItemText('Transportation', Colors.cyan),
                createChartItemText('Clothing', Colors.indigo),
                createChartItemText('Foods', Colors.deepOrange),
                createChartItemText('Other', Colors.black),
              ],
            ),
          ],
        ));
  }

  ///returns chartItemtext
  Widget createChartItemText(String itemName, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        itemName,
        style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
