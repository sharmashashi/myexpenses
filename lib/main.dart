import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myexpenses/src/home/home.dart';
import 'package:myexpenses/src/utils/colors.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: primaryColor
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
