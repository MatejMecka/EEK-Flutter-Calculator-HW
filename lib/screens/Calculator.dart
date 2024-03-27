import 'package:calculator/components/button_row.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _val = "10 + 10";

  final List <String> row_1 = ["AC", "()", "%", "÷"];
  final List <String> row_2 = ["7", "8", "9", "X"];
  final List <String> row_3 = ["6", "5", "4", "-"];
  final List <String> row_4 = ["3", "2", "1", "+"];
  final List <String> row_5 = ["0", ".", "DEL", "="];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme!.inversePrimary,
        title: Text(widget.title),
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
                      _val,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                    ),
                  ),
                )
              ],
            ),
          CalculatorButtonRow(row_1),
          CalculatorButtonRow(row_2),
          CalculatorButtonRow(row_3),
          CalculatorButtonRow(row_4),
          CalculatorButtonRow(row_5),
        ],
      ),
    );
  }
}
