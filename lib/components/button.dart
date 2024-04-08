import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
    final String value;
    String calculatorText;
    void Function(BuildContext, String) handleInput;

    CalculatorButton(this.value, this.calculatorText, this.handleInput, {Key? key}) : super(key: key);

    @override
    State<CalculatorButton> createState() => _CalculatorButtonState();

}

class _CalculatorButtonState extends State<CalculatorButton> {

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        widget.handleInput(context, widget.value);
      },
      elevation: 2.0,
      fillColor: Colors.blue,
      padding: const EdgeInsets.all(30.0),
      shape: const CircleBorder(),
       child: Text(
        widget.value,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15
        ),
      ),
    );
  }
}