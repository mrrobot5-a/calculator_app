// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:calculator_app/classes/appTheme.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '6,291÷5',
                      style: TextStyle(
                        color: AppTheme.secondaryButtonColorOperation,
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                        fontFamily: "worksans",
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '1,258.2',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 90,
                        fontWeight: FontWeight.normal,
                        fontFamily: "worksans",
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonOperation(
                      colorOfbutton: AppTheme.secondaryButtonColorOperation,
                      text: 'C',
                      onPressed: () {},
                    ),
                    ButtonOperation(
                      colorOfbutton: AppTheme.secondaryButtonColorOperation,
                      text: '/',
                      onPressed: () {},
                    ),
                    ButtonOperation(
                      colorOfbutton: AppTheme.secondaryButtonColorOperation,
                      text: '%',
                      onPressed: () {},
                    ),
                    ButtonOperation(
                      colorOfbutton: AppTheme.primaryColorOperation,
                      text: '÷',
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonOperation(
                        colorOfbutton: AppTheme.numberButtonColor,
                        text: '7',
                        onPressed: () {},
                      ),
                      ButtonOperation(
                        colorOfbutton: AppTheme.numberButtonColor,
                        text: '8',
                        onPressed: () {},
                      ),
                      ButtonOperation(
                        colorOfbutton: AppTheme.numberButtonColor,
                        text: '9',
                        onPressed: () {},
                      ),
                      ButtonOperation(
                        colorOfbutton: AppTheme.primaryColorOperation,
                        text: '×',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonOperation(
                        colorOfbutton: AppTheme.numberButtonColor,
                        text: '4',
                        onPressed: () {},
                      ),
                      ButtonOperation(
                        colorOfbutton: AppTheme.numberButtonColor,
                        text: '5',
                        onPressed: () {},
                      ),
                      ButtonOperation(
                        colorOfbutton: AppTheme.numberButtonColor,
                        text: '6',
                        onPressed: () {},
                      ),
                      ButtonOperation(
                        colorOfbutton: AppTheme.primaryColorOperation,
                        text: '–',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonOperation(
                        colorOfbutton: AppTheme.numberButtonColor,
                        text: '1',
                        onPressed: () {},
                      ),
                      ButtonOperation(
                        colorOfbutton: AppTheme.numberButtonColor,
                        text: '2',
                        onPressed: () {},
                      ),
                      ButtonOperation(
                        colorOfbutton: AppTheme.numberButtonColor,
                        text: '3',
                        onPressed: () {},
                      ),
                      ButtonOperation(
                        colorOfbutton: AppTheme.primaryColorOperation,
                        text: '+',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonOperation(
                        colorOfbutton: AppTheme.numberButtonColor,
                        text: '.',
                        onPressed: () {},
                      ),
                      ButtonOperation(
                        colorOfbutton: AppTheme.numberButtonColor,
                        text: '0',
                        onPressed: () {},
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 71,
                          height: 72,
                          alignment: Alignment
                              .center, // Centers the child within the Container
                          decoration: BoxDecoration(
                            color: AppTheme.numberButtonColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                          ),
                          child: Image.asset(
                            "assets/image/delete.png",
                          ),
                        ),
                      ),
                      ButtonOperation(
                        colorOfbutton: AppTheme.primaryColorOperation,
                        text: '=',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonOperation extends StatelessWidget {
  final Color colorOfbutton;
  String text;
  void Function() onPressed;
  ButtonOperation({
    required this.colorOfbutton,
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // margin: EdgeInsets.only(left: 15), // Adds space between each button

        width: 71,
        height: 72,
        alignment: Alignment.center, // Centers the child within the Container
        decoration: BoxDecoration(
          color: colorOfbutton,
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
