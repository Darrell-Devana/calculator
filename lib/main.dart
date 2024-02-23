import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/Button.dart';
import 'Button2.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final numberFormat = NumberFormat.decimalPattern();
  final _numberController = TextEditingController(text: '0');
  String clearButtonText = '';
  double firstNumber = 0;
  double secondNumber = 0;
  String currentOperator = "";
  String tempResult = "";
  String tempReplace = "";
  String tempNumber = "";
  String formattedResult = "0";
  String formattedNumber = "";
  bool indicator = false;

  @override
  void initState() {
    super.initState();
    clearButtonText = 'AC';
  }

  @override
  Widget build(BuildContext context) {
    _numberController.addListener(() {
      setState(() {
        clearButtonText =
            _numberController.text != "0" && _numberController.text != "-0"
                ? "C"
                : "AC";
      });
    });

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 40,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerRight,
                            child: AutoSizeText(
                              _numberController.text,
                              style: const TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.w300,
                              ),
                              maxLines: 1, // Prevent multiple lines
                              minFontSize: 50, // Set a minimum if you want
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(
                              tap: _numberController.text == "0"
                                  ? allClear
                                  : clear,
                              operator: clearButtonText,
                              color: 0xffa5a5a5,
                              fontColor: 0xff000000,
                            ),
                            Button(
                              tap: plusMinus,
                              operator: "+/-",
                              color: 0xffa5a5a5,
                              fontColor: 0xff000000,
                            ),
                            Button(
                              tap: percent,
                              operator: "%",
                              color: 0xffa5a5a5,
                              fontColor: 0xff000000,
                            ),
                            Button(
                              tap: divide,
                              operator: "/",
                              color: 0xfff2a33c,
                              fontColor: 0xffffffff,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(
                              tap: numberSeven,
                              operator: "7",
                              color: 0xff333333,
                              fontColor: 0xffffffff,
                            ),
                            Button(
                              tap: numberEight,
                              operator: "8",
                              color: 0xff333333,
                              fontColor: 0xffffffff,
                            ),
                            Button(
                              tap: numberNine,
                              operator: "9",
                              color: 0xff333333,
                              fontColor: 0xffffffff,
                            ),
                            Button(
                              tap: multiply,
                              operator: "x",
                              color: 0xfff2a33c,
                              fontColor: 0xffffffff,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(
                              tap: numberFour,
                              operator: "4",
                              color: 0xff333333,
                              fontColor: 0xffffffff,
                            ),
                            Button(
                              tap: numberFive,
                              operator: "5",
                              color: 0xff333333,
                              fontColor: 0xffffffff,
                            ),
                            Button(
                              tap: numberSix,
                              operator: "6",
                              color: 0xff333333,
                              fontColor: 0xffffffff,
                            ),
                            Button(
                              tap: minus,
                              operator: "-",
                              color: 0xfff2a33c,
                              fontColor: 0xffffffff,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(
                              tap: numberOne,
                              operator: "1",
                              color: 0xff333333,
                              fontColor: 0xffffffff,
                            ),
                            Button(
                              tap: numberTwo,
                              operator: "2",
                              color: 0xff333333,
                              fontColor: 0xffffffff,
                            ),
                            Button(
                              tap: numberThree,
                              operator: "3",
                              color: 0xff333333,
                              fontColor: 0xffffffff,
                            ),
                            Button(
                              tap: plus,
                              operator: "+",
                              color: 0xfff2a33c,
                              fontColor: 0xffffffff,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button2(
                              tap: numberZero,
                              operator: "0",
                              color: 0xff333333,
                            ),
                            Button(
                              tap: comma,
                              operator: ".",
                              color: 0xff333333,
                              fontColor: 0xffffffff,
                            ),
                            Button(
                              tap: equal,
                              operator: "=",
                              color: 0xfff2a33c,
                              fontColor: 0xffffffff,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void numberZero() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
      tempNumber = "";
    }
    if (_numberController.text.length < 11) {
      tempNumber += "0";
      if (_numberController.text.contains(".")) {
        _numberController.text += "0";
      } else {
        formattedNumber = numberFormat.format(double.parse(tempNumber));
        _numberController.text = formattedNumber;
      }
    }
  }

  void numberOne() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
      tempNumber = "";
    }
    if (_numberController.text.length < 11) {
      tempNumber += "1";
      if (_numberController.text.contains(".")) {
        _numberController.text += "1";
      } else {
        formattedNumber = numberFormat.format(double.parse(tempNumber));
        _numberController.text = formattedNumber;
      }
    }
  }

  void numberTwo() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
      tempNumber = "";
    }
    if (_numberController.text.length < 11) {
      tempNumber += "2";
      if (_numberController.text.contains(".")) {
        _numberController.text += "2";
      } else {
        formattedNumber = numberFormat.format(double.parse(tempNumber));
        _numberController.text = formattedNumber;
      }
    }
  }

  void numberThree() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
      tempNumber = "";
    }
    if (_numberController.text.length < 11) {
      tempNumber += "3";
      if (_numberController.text.contains(".")) {
        _numberController.text += "3";
      } else {
        formattedNumber = numberFormat.format(double.parse(tempNumber));
        _numberController.text = formattedNumber;
      }
    }
  }

  void numberFour() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
      tempNumber = "";
    }
    if (_numberController.text.length < 11) {
      tempNumber += "4";
      if (_numberController.text.contains(".")) {
        _numberController.text += "4";
      } else {
        formattedNumber = numberFormat.format(double.parse(tempNumber));
        _numberController.text = formattedNumber;
      }
    }
  }

  void numberFive() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
      tempNumber = "";
    }
    if (_numberController.text.length < 11) {
      tempNumber += "5";
      if (_numberController.text.contains(".")) {
        _numberController.text += "5";
      } else {
        formattedNumber = numberFormat.format(double.parse(tempNumber));
        _numberController.text = formattedNumber;
      }
    }
  }

  void numberSix() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
      tempNumber = "";
    }
    if (_numberController.text.length < 11) {
      tempNumber += "6";
      if (_numberController.text.contains(".")) {
        _numberController.text += "6";
      } else {
        formattedNumber = numberFormat.format(double.parse(tempNumber));
        _numberController.text = formattedNumber;
      }
    }
  }

  void numberSeven() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
      tempNumber = "";
    }
    if (_numberController.text.length < 11) {
      tempNumber += "7";
      if (_numberController.text.contains(".")) {
        _numberController.text += "7";
      } else {
        formattedNumber = numberFormat.format(double.parse(tempNumber));
        _numberController.text = formattedNumber;
      }
    }
  }

  void numberEight() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
      tempNumber = "";
    }
    if (_numberController.text.length < 11) {
      tempNumber += "8";
      if (_numberController.text.contains(".")) {
        _numberController.text += "8";
      } else {
        formattedNumber = numberFormat.format(double.parse(tempNumber));
        _numberController.text = formattedNumber;
      }
    }
  }

  void numberNine() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
      tempNumber = "";
    }
    if (_numberController.text.length < 11) {
      tempNumber += "9";
      if (_numberController.text.contains(".")) {
        _numberController.text += "9";
      } else {
        formattedNumber = numberFormat.format(double.parse(tempNumber));
        _numberController.text = formattedNumber;
      }
    }
  }

  void equal() {
    final double check;
    tempReplace = _numberController.text;
    tempReplace = tempReplace.replaceAll(",", "");
    secondNumber = double.parse(tempReplace);
    switch (currentOperator) {
      case "+":
        tempResult = (firstNumber + (secondNumber)).toString();
        break;
      case "-":
        tempResult = (firstNumber - (secondNumber)).toString();
        break;
      case "*":
        tempResult = (firstNumber * (secondNumber)).toString();
        break;
      case "/":
        tempResult = (firstNumber / (secondNumber)).toString();
        break;
    }
    firstNumber = 0;
    secondNumber = 0;
    currentOperator = "";
    indicator = true;
    check = double.parse(tempResult);
    if (check >= 1000000000) {
      final value = double.parse(tempResult);
      if (value.toString().indexOf('0') == 1) {
        formattedResult = value.toStringAsExponential(0);
        formattedResult = formattedResult.replaceAll("+", "");
        _numberController.text = formattedResult;
      } else {
        formattedResult = value.toStringAsExponential(4);
        formattedResult = formattedResult.replaceAll("+", "");
        _numberController.text = formattedResult;
      }
    } else {
      formattedResult = numberFormat.format(double.parse(tempResult));
      _numberController.text = formattedResult;
    }
  }

  void plus() {
    final double check;
    tempReplace = _numberController.text;
    tempReplace = tempReplace.replaceAll(",", "");
    if (currentOperator == "+" && indicator == false) {
      secondNumber = double.parse(tempReplace);
      tempResult = (firstNumber + secondNumber).toString();
      check = double.parse(tempResult);
      if (check >= 1000000000) {
        final value = double.parse(tempResult);
        if (value.toString().indexOf('0') == 1) {
          formattedResult = value.toStringAsExponential(0);
          formattedResult = formattedResult.replaceAll("+", "");
          _numberController.text = formattedResult;
        } else {
          formattedResult = value.toStringAsExponential(4);
          formattedResult = formattedResult.replaceAll("+", "");
          _numberController.text = formattedResult;
        }
      } else {
        formattedResult = numberFormat.format(double.parse(tempResult));
        _numberController.text = formattedResult;
      }
      firstNumber = double.parse(tempResult);
      secondNumber = 0;
      indicator = true;
    } else {
      firstNumber = double.parse(tempReplace);
      currentOperator = "+";
      indicator = true;
    }
  }

  void minus() {
    final double check;
    tempReplace = _numberController.text;
    tempReplace = tempReplace.replaceAll(",", "");
    if (currentOperator == "-" && indicator == false) {
      secondNumber = double.parse(tempReplace);
      tempResult = (firstNumber - secondNumber).toString();
      check = double.parse(tempResult);
      if (check >= 1000000000) {
        final value = double.parse(tempResult);
        if (value.toString().indexOf('0') == 1) {
          formattedResult = value.toStringAsExponential(0);
          formattedResult = formattedResult.replaceAll("+", "");
          _numberController.text = formattedResult;
        } else {
          formattedResult = value.toStringAsExponential(4);
          formattedResult = formattedResult.replaceAll("+", "");
          _numberController.text = formattedResult;
        }
      } else {
        formattedResult = numberFormat.format(double.parse(tempResult));
        _numberController.text = formattedResult;
      }
      firstNumber = double.parse(tempResult);
      secondNumber = 0;
      indicator = true;
    } else {
      firstNumber = double.parse(tempReplace);
      currentOperator = "-";
      indicator = true;
    }
  }

  void multiply() {
    final double check;
    tempReplace = _numberController.text;
    tempReplace = tempReplace.replaceAll(",", "");
    if (currentOperator == "*" && indicator == false) {
      secondNumber = double.parse(tempReplace);
      tempResult = (firstNumber * secondNumber).toString();
      check = double.parse(tempResult);
      if (check >= 1000000000) {
        final value = double.parse(tempResult);
        if (value.toString().indexOf('0') == 1) {
          formattedResult = value.toStringAsExponential(0);
          formattedResult = formattedResult.replaceAll("+", "");
          _numberController.text = formattedResult;
        } else {
          formattedResult = value.toStringAsExponential(4);
          formattedResult = formattedResult.replaceAll("+", "");
          _numberController.text = formattedResult;
        }
      } else {
        formattedResult = numberFormat.format(double.parse(tempResult));
        _numberController.text = formattedResult;
      }
      firstNumber = double.parse(tempResult);
      secondNumber = 0;
      indicator = true;
    } else {
      firstNumber = double.parse(tempReplace);
      currentOperator = "*";
      indicator = true;
    }
  }

  void divide() {
    final double check;
    tempReplace = _numberController.text;
    tempReplace = tempReplace.replaceAll(",", "");
    if (currentOperator == "/" && indicator == false) {
      secondNumber = double.parse(tempReplace);
      tempResult = (firstNumber / secondNumber).toString();
      check = double.parse(tempResult);
      if (check >= 1000000000) {
        final value = double.parse(tempResult);
        if (value.toString().indexOf('0') == 1) {
          formattedResult = value.toStringAsExponential(0);
          formattedResult = formattedResult.replaceAll("+", "");
          _numberController.text = formattedResult;
        } else {
          formattedResult = value.toStringAsExponential(4);
          formattedResult = formattedResult.replaceAll("+", "");
          _numberController.text = formattedResult;
        }
      } else {
        formattedResult = numberFormat.format(double.parse(tempResult));
        _numberController.text = formattedResult;
      }
      firstNumber = double.parse(tempResult);
      secondNumber = 0;
      indicator = true;
    } else {
      firstNumber = double.parse(tempReplace);
      currentOperator = "/";
      indicator = true;
    }
  }

  void clear() {
    _numberController.text = '0';
    tempNumber = "";
    indicator = false;
  }

  void allClear() {
    indicator = false;
    firstNumber = 0;
    secondNumber = 0;
    currentOperator = "";
    tempResult = "";
  }

  void percent() {
    if (firstNumber != 0) {
      tempReplace = _numberController.text;
      tempReplace = tempReplace.replaceAll(",", "");
      secondNumber = double.parse(tempReplace);
      secondNumber = secondNumber / 100;
      formattedResult = numberFormat.format(secondNumber);
      _numberController.text = formattedResult;
    } else {
      tempReplace = _numberController.text;
      tempReplace = tempReplace.replaceAll(",", "");
      firstNumber = double.parse(tempReplace);
      firstNumber = firstNumber / 100;
      formattedResult = numberFormat.format(firstNumber);
      _numberController.text = formattedResult;
    }
  }

  void comma() {
    // tempNumber += ".";
    if (_numberController.text.contains(".")) {
      null;
    } else {
      _numberController.text += ".";
    }
  }

  void plusMinus() {
    String currentNumber = _numberController.text;
    if (currentNumber.startsWith("-")) {
      _numberController.text = currentNumber.substring(1);
    } else if (currentNumber != "0") {
      _numberController.text = "-$currentNumber";
    }
  }
}
