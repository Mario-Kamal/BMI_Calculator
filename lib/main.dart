import 'package:bmi_calculator/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              headline2: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
