
import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';

class CalculatorButtonRow extends StatelessWidget {
  final List<String> values;
  // Remove 'const' since values is not a constant expression
  const CalculatorButtonRow(this.values, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CalculatorButton(values[0]),
        CalculatorButton(values[1]),
        CalculatorButton(values[2]),
        CalculatorButton(values[3]),
      ],
    );
  }
}