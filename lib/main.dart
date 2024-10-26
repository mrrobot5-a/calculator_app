import 'package:calculator_app/Screens/calculator.dart';
import 'package:calculator_app/classes/appTheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: Calculator(),
      ),
    );
  }
}
