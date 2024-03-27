import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String value;
  final List<String> ignoreValues = ["AC", "=", "DEL", ""];

  CalculatorButton(this.value, {Key? key}) : super(key: key);

   void HandleInput() {
    if(!ignoreValues.contains(value)){

    }
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {}, // Add your onPressed logic here
      elevation: 2.0,
      fillColor: Colors.blue,
      padding: const EdgeInsets.all(30.0),
      shape: const CircleBorder(),
       child: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15
        ),
      ),
    );
  }
}