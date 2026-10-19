import 'package:calculator/calcButtom.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  homeScreen();

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String txtView = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text(
          "Calc As U Want",
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Expanded(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Expanded(
                    child: Text(txtView, style: TextStyle(fontSize: 30)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Calcbuttom("7", bottomClick)),
                  Expanded(child: Calcbuttom("8", bottomClick)),
                  Expanded(child: Calcbuttom("9", bottomClick)),
                  Expanded(child: Calcbuttom("/", operatorClick)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Calcbuttom("4", bottomClick)),
                  Expanded(child: Calcbuttom("5", bottomClick)),
                  Expanded(child: Calcbuttom("6", bottomClick)),
                  Expanded(child: Calcbuttom("*", operatorClick)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Calcbuttom("1", bottomClick)),
                  Expanded(child: Calcbuttom("2", bottomClick)),
                  Expanded(child: Calcbuttom("3", bottomClick)),
                  Expanded(child: Calcbuttom("-", operatorClick)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Calcbuttom(".", bottomClick)),
                  Expanded(child: Calcbuttom("0", bottomClick)),
                  Expanded(child: Calcbuttom("=", equalClick)),
                  Expanded(child: Calcbuttom("+", operatorClick)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void bottomClick(String nClick) {
    if (txtView.contains(".") && nClick == ".") {
      return;
    }
    setState(() {
      txtView += nClick;
    });
  }

  String savedNum = " ";
  String savedOperator = " ";
  String newNum = " ";

  void operatorClick(String operator) {
    if (savedNum == " ") {
      savedNum = txtView;
      savedOperator = operator;
      setState(() {
        txtView = " ";
      });
    } else {
      newNum = txtView;
      String result = calculate(savedNum, savedOperator, newNum);
      savedNum = result;
      savedOperator = operator;
      setState(() {
        txtView = " ";
      });
    }
  }

  void equalClick(String _) {
    setState(() {
      txtView = calculate(savedNum, savedOperator, txtView);
    });
    savedNum = " ";
    savedOperator = " ";
  }
}

String calculate(String lhs, String operator, String rhs) {
  double num1 = double.parse(lhs);
  double num2 = double.parse(rhs);
  double result = 0.0;
  if (operator == "+") {
    result = num1 + num2;
  } else if (operator == "-") {
    result = num1 - num2;
  } else if (operator == "*") {
    result = num1 * num2;
  } else if (operator == "/") {
    result = num1 / num2;
  }
  return result.toString();
}
