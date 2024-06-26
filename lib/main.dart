import 'package:calculator/screens/Calculator.dart';
import 'package:calculator/screens/Converter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes : {
        '/': (context) =>  const MyHomePage(title: 'Calculator'),
        '/convert': (context) => Converter(),
      }
    );
  }
}
