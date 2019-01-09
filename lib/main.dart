import 'package:flutter/material.dart';
import './home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel UI',
      theme: appTheme,
      home: new HomePage(),
    );
  }
}

ThemeData appTheme = ThemeData(
  // primaryColor: Color(0xFF3791A),
  fontFamily: 'Oxygen',
);
