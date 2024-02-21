import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/Button.dart';
import 'Button2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  final _numberController = TextEditingController(text: '0');
  String clearButtonText = '';
  double firstNumber = 0;
  double secondNumber = 0;
  String currentOperator = "";
  String tempResult = "";
  String tempReplace = "";
  bool indicator = false;

  @override
  void initState() {
    super.initState();
    clearButtonText = 'AC'; // Or again here for clarity
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
                  child: CupertinoTextField(
                    controller: _numberController,
                    maxLength: 11,
                    showCursor: false,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.end,
                    textAlignVertical: const TextAlignVertical(y: 1),
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w300,
                    ),
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
                              tap: clear,
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
                              operator: ",",
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
    }
    _numberController.text += "0";
  }

  void numberOne() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
    }
    _numberController.text += "1";
  }

  void numberTwo() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
    }
    _numberController.text += "2";
  }

  void numberThree() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
    }
    _numberController.text += "3";
  }

  void numberFour() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
    }
    _numberController.text += "4";
  }

  void numberFive() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
    }
    _numberController.text += "5";
  }

  void numberSix() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
    }
    _numberController.text += "6";
  }

  void numberSeven() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
    }
    _numberController.text += "7";
  }

  void numberEight() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
    }
    _numberController.text += "8";
  }

  void numberNine() {
    if (_numberController.text == '0') {
      _numberController.clear();
    } else if (indicator == true) {
      indicator = false;
      _numberController.clear();
    }
    _numberController.text += "9";
  }

  void equal() {
    tempReplace = _numberController.text;
    tempReplace = tempReplace.replaceAll(",", ".");
    secondNumber = double.parse(tempReplace);
    switch (currentOperator) {
      case "+":
        tempResult = (firstNumber + secondNumber).toString();
        break;
      case "-":
        tempResult = (firstNumber - secondNumber).toString();
        break;
      case "*":
        tempResult = (firstNumber * secondNumber).toString();
        break;
      case "/":
        tempResult = (firstNumber / secondNumber).toString();
        break;
      case "%":
        tempResult = (firstNumber * (secondNumber / 100)).toString();
        break;
    }
    firstNumber = 0;
    secondNumber = 0;
    currentOperator = "";
    indicator = true;
    _numberController.text = tempResult;
  }

  void plus() {
    tempReplace = _numberController.text;
    tempReplace = tempReplace.replaceAll(",", ".");
    firstNumber = double.parse(tempReplace);
    currentOperator = "+";
    _numberController.text = "0";
    indicator = false;
  }

  void minus() {
    tempReplace = _numberController.text;
    tempReplace = tempReplace.replaceAll(",", ".");
    firstNumber = double.parse(tempReplace);
    currentOperator = "-";
    _numberController.text = "0";
    indicator = false;
  }

  void multiply() {
    tempReplace = _numberController.text;
    tempReplace = tempReplace.replaceAll(",", ".");
    firstNumber = double.parse(tempReplace);
    currentOperator = "*";
    _numberController.text = "0";
    indicator = false;
  }

  void divide() {
    tempReplace = _numberController.text;
    tempReplace = tempReplace.replaceAll(",", ".");
    firstNumber = double.parse(tempReplace);
    currentOperator = "/";
    _numberController.text = "0";
    indicator = false;
  }

  void clear() {
    firstNumber = 0;
    secondNumber = 0;
    currentOperator = "";
    tempResult = "";
    _numberController.text = '0';
    indicator = false;
  }

  void percent() {
    tempReplace = _numberController.text;
    tempReplace = tempReplace.replaceAll(",", ".");
    firstNumber = double.parse(tempReplace);
    currentOperator = "%";
    _numberController.text = "0";
    indicator = false;
  }

  void comma() {
    _numberController.text += ",";
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
