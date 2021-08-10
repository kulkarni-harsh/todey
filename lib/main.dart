import 'package:flutter/material.dart';
import 'package:todey/screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF272732),
        backgroundColor: Color(0xFF181820),
        scaffoldBackgroundColor: Color(0xFF181820),
        splashColor: Color(0xFFAC6DDE),
        cardColor: Color(0xFF505063),
        iconTheme: IconThemeData(
          color: Colors.white70,
        ),
      ),
      home: HomePage(),
    );
  }
}
