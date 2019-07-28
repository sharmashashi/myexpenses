import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:myexpenses/src/home/app_bar.dart';
import 'package:myexpenses/src/home/home_body.dart';
import 'package:myexpenses/src/home/home_provider.dart';
import 'package:myexpenses/src/utils/colors.dart';
import 'package:myexpenses/src/utils/dimention_in_percent.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      builder: (context) => HomeProvider(),
      child: Builder(builder: (BuildContext context) {
        ///full height and width of screen
        double _fullHeight = MediaQuery.of(context).size.height,
            _fullWidth = MediaQuery.of(context).size.width;

        ///home provider to set and get
        var _homeProvider = Provider.of<HomeProvider>(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.zero,
            child: Container(
              color: primaryColor,
            ),
          ),
          body: Stack(
            children: <Widget>[
              ///app bar
              appBar(
                fullHeight: _fullHeight,
                fullWidth: _fullWidth,
              ),
              homeBody(height: _fullHeight, width: _fullWidth),

              ///bottom of home
              Positioned(
                top: percent(_fullHeight, 77),
                bottom: 0,
                child: Container(
                    height: percent(_fullHeight, 23),
                    width: _fullWidth,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      gradient:LinearGradient(colors: [
                        Colors.white,
                       Colors.green[100],
                       Colors.green[200],
                       Colors.green[300],
                       Colors.green[400],
                       Colors.green[500],
                        primaryColor
                      ],begin: Alignment.topCenter,end: Alignment.bottomCenter),
                    )),
              )
            ],
          ),
        );
      }),
    );
  }
}
