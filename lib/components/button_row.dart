
import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';

class CalculatorButtonRow extends StatelessWidget {
  final List<String> values;
  String calculatorText;
  void Function(BuildContext, String) handleInput;
  // Remove 'const' since values is not a constant expression
  CalculatorButtonRow(this.values, this.calculatorText, this.handleInput, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CalculatorButton(values[0], calculatorText, handleInput),
        CalculatorButton(values[1], calculatorText, handleInput),
        CalculatorButton(values[2], calculatorText, handleInput),
        CalculatorButton(values[3], calculatorText, handleInput),
      ],
    );
  }
}