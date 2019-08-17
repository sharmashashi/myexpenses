import 'package:flutter/material.dart';
import 'package:myexpenses/src/detailed_categories/category_provider.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';
import 'package:provider/provider.dart';

class Transportation extends StatefulWidget {
  final Color color;
  Transportation({this.color});
  @override
  _TransportationState createState() => _TransportationState();
}

class _TransportationState extends State<Transportation> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryProvider>(
      builder: (context) => CategoryProvider(),
      child: Builder(builder: (BuildContext context) {
        ///instantiate provider
        var _categoryProvider = Provider.of<CategoryProvider>(context);
        _categoryProvider.init(gradient: LinearGradient(colors: [
                    Colors.cyan[300],
                    Colors.cyan[200],
                    Colors.cyan[100],
                    Colors.white
                  ], stops: [
                    0.1,
                    0.2,
                    0.5,
                    1
                  ], begin: Alignment.topLeft, end: Alignment.topCenter),
            provider: _categoryProvider,
            categoryKey: 'expenseInTransportation',
            context: context);
        return Scaffold(
          appBar: PreferredSize(
            child: Container(
              color: widget.color,
            ),
            preferredSize: Size.zero,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              itemExtent: percent(MediaQuery.of(context).size.height, 16),
              children: _categoryProvider.getTransportationList,
            ),
          ),
        );
      }),
    );
  }
}
