// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../classes/appTheme.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;
  CalculatorButton({
    required this.text,
    required this.color,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(text),
      child: Container(
        width: 71,
        height: 72,
        alignment: Alignment.center, // Centers the child within the Container
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: "worksans",
          ),
        ),
      ),
    );
  }
}
