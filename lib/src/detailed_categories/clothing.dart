import 'package:flutter/material.dart';
import 'package:myexpenses/src/detailed_categories/category_provider.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';
import 'package:provider/provider.dart';

class Clothing extends StatefulWidget {
  final Color color;
  Clothing({this.color});
  @override
  _ClothingState createState() => _ClothingState();
}

class _ClothingState extends State<Clothing> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryProvider>(
      builder: (context) => CategoryProvider(),
      child: Builder(builder: (BuildContext context) {
        ///instantiate provider
        var _categoryProvider = Provider.of<CategoryProvider>(context);
        _categoryProvider.init(
          gradient:LinearGradient(colors: [
                    Colors.indigo[300],
                    Colors.indigo[200],
                    Colors.indigo[100],
                    Colors.white
                  ], stops: [
                    0.1,
                    0.2,
                    0.5,
                    1
                  ], begin: Alignment.topLeft, end: Alignment.topCenter),
            provider: _categoryProvider,
            categoryKey: 'expenseInClothing',
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
              children: _categoryProvider.getClothingList,
            ),
          ),
        );
      }),
    );
  }
}
