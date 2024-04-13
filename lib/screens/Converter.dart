import 'package:flutter/material.dart';

class Converter extends StatelessWidget {

  Converter({Key? key}) : super(key: key);

  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _milesController = TextEditingController();

  void calculateConversion(String value, bool toKm, BuildContext context) {
    double calc = 0.0;

    if(value == ""){
      value = "0";
    }

    try {
      if(toKm) {
        calc = double.parse(value) * 1.60934;
        _kmController.text = "$calc";
      } else {
        calc = double.parse(value) / 1.60934;
        _milesController.text = "$calc";
      }
    } catch(e) {
      const snackBar = SnackBar(
        content: Text('You have not inputted a Decimal value!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme!.inversePrimary,
        title: const Text("Distance Converter"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Miles: ", 
                contentPadding: EdgeInsets.all(20.0),
              ),
              controller: _milesController,
              onChanged: (value) => {
                calculateConversion(value, true, context)
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Kilometers: "
              ),
              controller: _kmController,
              onChanged: (value) => {
                calculateConversion(value, false, context)
              },
            ),
          )
        ]
      ),
    );
  }
  
}
