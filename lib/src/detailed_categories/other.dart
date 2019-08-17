import 'package:flutter/material.dart';
import 'package:myexpenses/src/detailed_categories/category_provider.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';
import 'package:provider/provider.dart';

class Other extends StatefulWidget {
  final Color color;
  Other({this.color});
  @override
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryProvider>(
      builder: (context) => CategoryProvider(),
      child: Builder(builder: (BuildContext context) {
        ///instantiate provider
        var _categoryProvider = Provider.of<CategoryProvider>(context);
        _categoryProvider.init(
          gradient: LinearGradient(colors: [
                    Colors.teal[300],
                    Colors.teal[200],
                    Colors.teal[100],
                    Colors.white
                  ], stops: [
                    0.1,
                    0.2,
                    0.5,
                    1
                  ], begin: Alignment.topLeft, end: Alignment.topCenter),
            provider: _categoryProvider,
            categoryKey: 'expenseInother',
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
              children: _categoryProvider.getOtherList,
            ),
          ),
        );
      }),
    );
  }
}
