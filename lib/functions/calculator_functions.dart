import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

class CalculatorLogic {
  static const String errorMessage = "Invalid Operation";

  static dynamic evaluteInput = (String calculatorVal) {
    var expression = Expression.parse(calculatorVal);
    final evaluator = const ExpressionEvaluator();
  
    var r = evaluator.eval(expression, {});
    return r;
  };

  static String handleInput(
    BuildContext context, String value, String calculatorVal) {
    final snackBar = SnackBar(
      content: const Text(errorMessage),
      backgroundColor: Colors.black12,
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {},
      ),
    );

    final List<String> ignoreValues = ["AC", "=", "DEL", ""];
    final List<String> operators = ["-", "+", "X", "%", "÷", "*", '.', '/', '&'];

    if (!ignoreValues.contains(value)) {
      bool addedOperator = false;
      if(value == "X") {
        value = "*";
      } else if(value == "÷"){
        value = "/";
      }

      if(operators.contains(value)){
        addedOperator = true;
      }
      
      if (operators.contains(value) && calculatorVal.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      else {
        if(calculatorVal.isNotEmpty) {
           if(operators.contains(calculatorVal[calculatorVal.length-1]) && operators.contains(value)){
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              calculatorVal += value;
            }
        } else {
          calculatorVal += value;
        }
      }

    print(calculatorVal);

      if(!addedOperator){
        try {
          dynamic r = evaluteInput(calculatorVal);
        } on Exception catch (e){
          print(e);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          calculatorVal = calculatorVal.substring(0, calculatorVal.length -1);
        }
      }
    } else {
      if (value == "AC") {
        calculatorVal = "";
      } else if (value == "DEL") {
          if(calculatorVal.isEmpty){
            ;
          } else {
            calculatorVal = calculatorVal.substring(0, calculatorVal.length -1);
          }
      } else if (value == "=") {
        dynamic r = evaluteInput(calculatorVal);
        calculatorVal = "$r";
      }
    }
    return calculatorVal;
  }
}
