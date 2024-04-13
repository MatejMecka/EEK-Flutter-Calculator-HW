import 'package:calculator/components/button_row.dart';
import 'package:flutter/material.dart';
import 'package:calculator/functions/calculator_functions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String calculatorVal = "";

  final List <String> row_1 = ["AC", "&", "%", "÷"];
  final List <String> row_2 = ["7", "8", "9", "X"];
  final List <String> row_3 = ["6", "5", "4", "-"];
  final List <String> row_4 = ["3", "2", "1", "+"];
  final List <String> row_5 = ["0", ".", "DEL", "="];

  void handleInput(BuildContext context, String value) {
    setState(() {
      calculatorVal = CalculatorLogic.handleInput(context, value, calculatorVal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme!.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/convert');
            }, 
            icon: const Icon(Icons.straighten),
            tooltip: "Convert from Miles to Kilometers",
            )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: Text(
                      calculatorVal,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                    ),
                  ),
                )
              ],
            ),
          CalculatorButtonRow(row_1, calculatorVal, handleInput),
          CalculatorButtonRow(row_2, calculatorVal, handleInput),
          CalculatorButtonRow(row_3, calculatorVal, handleInput),
          CalculatorButtonRow(row_4, calculatorVal, handleInput),
          CalculatorButtonRow(row_5, calculatorVal, handleInput),
        ],
      ),
    );
  }

  
}
