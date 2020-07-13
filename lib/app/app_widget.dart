import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'utils/colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            caption: TextStyle(
              fontFamily: "NunitoSans",
              color: Colors.white,
              fontSize: 14,
            ),
            headline5: TextStyle(
              fontFamily: "NunitoSans",
              color: red,
              fontSize: 36,
              letterSpacing: 1.1,
            ),
            headline6: TextStyle(
              fontFamily: "NunitoSans",
              color: Color(0xFF767676),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            bodyText1: TextStyle(
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            bodyText2: TextStyle(
              fontFamily: "NunitoSans",
              fontSize: 14,
              color: Color(0xFF999999),
            ),
            subtitle2: TextStyle(
              fontFamily: "NunitoSans",
              color: Color(0xFF767676),
            ),
            button: TextStyle(
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.bold,
              fontSize: 12,
            )),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
