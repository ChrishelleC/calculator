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
  String input = ""; //stores user input
  String output = ""; //stores result for result
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  void buttonPressed(String value) {
    setState(() {
      //clear values if C is pressed
      if (value == "C") {
        input = "";
        output = "";
        num1 = 0;
        num2 = 0;
        operator = "";
      }
      //calculate numbers after "=" is pressed
      else if (value == "=" && operator.isNotEmpty) {
      num2 = double.parse(input);
      if (operator == "+") {
        output = (num1 + num2).toString();
        }else if (operator == "-") {
          output = (num1 - num2).toString();
        }else if (operator == "*") {
          output = (num1 * num2).toString();
        }else if (operator == "/") {
          output = (num1 / num2).toString();
        }else {
          output = "Error";
        }
        input = "";
        operator = "";
      } else if (["+", "-", "*", "/"].contains(value)) {
        if (input.isNotEmpty) {
          num1 = double.parse(input);
          operator = value;
          input = "";
        }
      }
    });
  }
}