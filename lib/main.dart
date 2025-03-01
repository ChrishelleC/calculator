import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home: CalculatorMain(), //main screen of calculator
    );
  }
}

class CalculatorMain extends StatefulWidget {
  @override
  _CalcualtorMainState createState() => _CalculatorMainState();
}

class _CalculatorMainState extends State<CalculatorMain> {
  String input = ""; //variable for user input
  String output = ""; //variable for result
  double num1 = 0;
  double num2 = 0;
  String operator = "";
}