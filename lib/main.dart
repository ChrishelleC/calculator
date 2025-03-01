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
  _CalculatorMainState createState() => _CalculatorMainState();
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
      } else {
        input +=value;
      }
    });
  }
  Widget buildButton(String text){
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(text),
        child: Text(text, style: TextStyle(fontSize: 24)),
      ),
      );
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Calculator")), 
      body: Column(
        children: [
          Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(20),
            child: Text(
              input.isEmpty ? output : input,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          ),
          //buttons for calculator
          Column(
            children: [
              for (var row in [["7", "8", "9", "/"], ["4", "5", "6", "*"], ["1", "2", "3", "-"], ["C", "0", "=", "+"]])
              Row(
                children: row.map((text) => buildButton(text)).toList(),
                )
            ],)
        ],
        ),
        );
  }
}