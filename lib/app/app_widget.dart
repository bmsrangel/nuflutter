import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'utils/colors.dart' as colors;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        accentColor: colors.nuPurple,
        fontFamily: "NunitoSans",
        textTheme: TextTheme(
            caption: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            headline5: TextStyle(
              color: colors.red,
              fontSize: 36,
              letterSpacing: 1.1,
            ),
            headline6: TextStyle(
              color: Color(0xFF767676),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            bodyText1: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            bodyText2: TextStyle(
              fontSize: 14,
              color: Color(0xFF999999),
            ),
            subtitle2: TextStyle(
              color: Color(0xFF767676),
            ),
            button: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            )),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
