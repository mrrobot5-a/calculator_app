// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:math';

import 'package:calculator_app/classes/appTheme.dart';
import 'package:flutter/material.dart';

import '../widgets/calculator_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //* variables
  int firstNumber = 1;
  int secondNumber = 1;
  String history = "";
  String textToDisplay = "";
  String operation = "";
  String result = "";

  //*button on click function
  void buttonOnClick(String button) {
    print(button);

    //*logic to clear
    if (button == "C" || button == "c") {
      firstNumber = 0;
      secondNumber = 0;
      textToDisplay = "";
      result = "";
      history = "";
    } else if (button == "delete") {
      try {
        final int length = textToDisplay.length - 1;
        result = textToDisplay.substring(0, length);
      } catch (e) {
        history = "Undefined";
      }
    } else if (button == "+/-") {
      if (textToDisplay[0] != '-') {
        result = "-" + textToDisplay;
      } else {
        result = textToDisplay.substring(1);
      }
    } else if (button == "+" ||
        button == "-" ||
        button == "*" ||
        button == "/" ||
        button == "x" ||
        button == "÷" ||
        button == "%") {
      firstNumber = int.parse(textToDisplay);
      result = "";
      operation = button;
    } else if (button == "=") {
      secondNumber = int.parse(textToDisplay);
      if (operation == "+") {
        result = (firstNumber + secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == "-") {
        result = (firstNumber - secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == "x") {
        result = (firstNumber * secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == "%") {
        result = (firstNumber % secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == "÷") {
        result = (firstNumber / secondNumber).toStringAsFixed(3);
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
    } else {
      result = int.parse(textToDisplay + button).toString();
    }
    setState(() {
      textToDisplay = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        history,
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
                  //to show result of operation
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        textToDisplay,
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
                      CalculatorButton(
                        color: AppTheme.secondaryButtonColorOperation,
                        text: 'C',
                        onPressed: buttonOnClick,
                      ),
                      GestureDetector(
                        onTap: () {
                          buttonOnClick("+/-");
                        },
                        child: Container(
                          width: 71,
                          height: 72,
                          alignment: Alignment
                              .center, // Centers the child within the Container
                          decoration: BoxDecoration(
                            color: AppTheme.secondaryButtonColorOperation,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // + Symbol
                              Text(
                                "+",
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "worksans",
                                ),
                              ),

                              // / Symbol
                              Text(
                                "/",
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "worksans",
                                ),
                              ),

                              // - Symbol
                              Text(
                                "-",
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "worksans",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CalculatorButton(
                        color: AppTheme.secondaryButtonColorOperation,
                        text: '%',
                        onPressed: buttonOnClick,
                      ),
                      CalculatorButton(
                        color: AppTheme.primaryColorOperation,
                        text: '÷',
                        onPressed: buttonOnClick,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalculatorButton(
                          text: "7",
                          onPressed: buttonOnClick,
                          color: AppTheme.numberButtonColor,
                        ),
                        CalculatorButton(
                          text: "8",
                          onPressed: buttonOnClick,
                          color: AppTheme.numberButtonColor,
                        ),
                        CalculatorButton(
                          text: "9",
                          onPressed: buttonOnClick,
                          color: AppTheme.numberButtonColor,
                        ),
                        CalculatorButton(
                          text: "x",
                          onPressed: buttonOnClick,
                          color: AppTheme.primaryColorOperation,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalculatorButton(
                          text: "4",
                          onPressed: buttonOnClick,
                          color: AppTheme.numberButtonColor,
                        ),
                        CalculatorButton(
                          text: "5",
                          onPressed: buttonOnClick,
                          color: AppTheme.numberButtonColor,
                        ),
                        CalculatorButton(
                          text: "6",
                          onPressed: buttonOnClick,
                          color: AppTheme.numberButtonColor,
                        ),
                        CalculatorButton(
                          text: "-",
                          onPressed: buttonOnClick,
                          color: AppTheme.primaryColorOperation,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalculatorButton(
                          text: "1",
                          onPressed: buttonOnClick,
                          color: AppTheme.numberButtonColor,
                        ),
                        CalculatorButton(
                          text: "2",
                          onPressed: buttonOnClick,
                          color: AppTheme.numberButtonColor,
                        ),
                        CalculatorButton(
                          text: "3",
                          onPressed: buttonOnClick,
                          color: AppTheme.numberButtonColor,
                        ),
                        CalculatorButton(
                          text: "+",
                          onPressed: buttonOnClick,
                          color: AppTheme.primaryColorOperation,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalculatorButton(
                          text: ".",
                          onPressed: buttonOnClick,
                          color: AppTheme.numberButtonColor,
                        ),
                        CalculatorButton(
                          text: "0",
                          onPressed: buttonOnClick,
                          color: AppTheme.numberButtonColor,
                        ),

                        //*for AC button
                        GestureDetector(
                          onTap: () {
                            buttonOnClick("delete");
                          },
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
                              fit: BoxFit.fitWidth,
                              width: 40,
                              height: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        //* = Button
                        CalculatorButton(
                          text: "=",
                          onPressed: buttonOnClick,
                          color: AppTheme.primaryColorOperation,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
