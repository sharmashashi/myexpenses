import 'package:flutter/material.dart';
import 'package:myexpenses/src/detailed_categories/category_provider.dart';
import 'package:myexpenses/src/detailed_categories/common_widgets.dart';
import 'package:myexpenses/src/home/app_bar.dart';
import 'package:provider/provider.dart';

class Kitchen extends StatefulWidget {
  @override
  _KitchenState createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryProvider>(
      builder: (context) => CategoryProvider(),
      child: Builder(builder: (BuildContext context) {
        ///instantiate provider
        var _categoryProvider = Provider.of<CategoryProvider>(context);
        _categoryProvider.initKitchen();
        return Scaffold(
          appBar: PreferredSize(
            child: Container(),
            preferredSize: Size.zero,
          ),
          body: commonWidget(context: context),
        );
      }),
    );
  }
}
