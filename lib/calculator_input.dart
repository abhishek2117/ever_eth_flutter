import 'package:ever_eth_flutter/costom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// enum NumberType { one, two, three, four, five, six, seven, eight, nine, zero }

class CalculatorInput extends StatefulWidget {
  @override
  _CalculatorInputState createState() => _CalculatorInputState();
}

class _CalculatorInputState extends State<CalculatorInput> {
  double screenWidth = 0;
  double screenHeight = 0;
  dynamic selected = "";
  dynamic num = "";
  dynamic numOne = 0;
  dynamic numTwo = 0;
  dynamic symbol = "";
  dynamic result = "";
  dynamic output = "";

  List selectedList = <String>[];
  String selectedString = "";

  bool onTap = false;

  receiveTap(onTap, String no) {
    if (onTap = true) {
      print('yes, i was clicked!');
      selectedList.add(no);
      if (no == "=") {
        selectedList.removeWhere((element) => element.contains("="));
      }

      print({selectedList.join(''), 'checks'});

      num = selectedList.join('');

      if (no == 'AC') {
        num = '';
        numOne = 0;
        numTwo = 0;
        output = '';
        result = "";
        symbol = "";
        selectedList = [];
        print('$num, checking empty');
      } else if (no == '+' || no == "-" || no == "÷" || no == "x") {
        numOne = double.parse(result);
        print('$numOne, checking number one');
        symbol = no;
        output = "";
      } else if (no == ".") {
        if (output.contains(".")) {
          print('Already contains');
          return;
        } else {
          output = output + no;
        }
      } else if (no == "=") {
        numTwo = double.parse(result);
        print('$numTwo, checking number two');
        // num.remove("=");

        if (symbol == "+") {
          output = (numOne + numTwo).toString();
        }
        if (symbol == "-") {
          output = (numOne - numTwo).toString();
        }
        if (symbol == "x") {
          output = (numOne * numTwo).toString();
        }
        if (symbol == "÷") {
          output = (numOne / numTwo).toString();
        }

        numOne = 0;
        numTwo = 0;
        symbol = "";
      } else if (no == "%") {
        dynamic percent;
        percent = num.split('%');
        output = int.parse(percent[0]) / 100;
      } else {
        output = output + no;
      }

      String containDecimal(dynamic out) {
        if (out.toString().contains('.')) {
          List<String> splitDecimal = out.toString().split('.');

          if (!(int.parse(splitDecimal[1]) > 0)) {
            out = splitDecimal[0].toString();
          }
          if (!(int.parse(splitDecimal[1]) > 0 &&
              (int.parse(splitDecimal[2])) > 0)) {
            out = splitDecimal[0].toString();
            print('$out with the stuff1');
          }

          output = out;
        }
        return output;
      }

      print('$output kilo shele');
      // containDecimal(output);

      setState(() {
        result = output;
      });

      print(output.runtimeType);

      // if (output.contains('.') && output.lastIndexOf('0')) {
      //   print('$output, amebo');
      // }
    }
  }

  Future<List<Types>> prepareList() async {
    List<Types> list = [];
    list.add(Types(name: "Tokens"));
    list.add(Types(name: "Calculate"));
    list.add(Types(name: "Reflection"));
    return list;
  }

  Widget securityOptNoBorder(
      String optName, String reveal, Color transparentOpt) {
    return Container(
      height: screenHeight * 0.04,
      width: screenWidth * 0.22,
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          left: screenHeight * 0.005, right: screenHeight * 0.005),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenHeight * 0.03),
        color: MyColor.navItemColor.withOpacity(.2),
      ),
      child: Text(
        reveal,
        style: TextStyle(
          color: Colors.white,
          fontSize: screenHeight * 0.022,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
        elevation: 8,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(null),
        ),
        title: Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.03,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: screenHeight * 0.035),
                                  child: Text(
                                    num.toString(),
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.03,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: screenHeight * 0.03),
                                child: Text(
                                  result.toString(),
                                  style: TextStyle(
                                      fontSize: screenHeight * 0.07,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                      // color: Colors.blue,
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 5.0, top: 10.0, end: 5.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0XFF292D36).withOpacity(0.3),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: screenHeight * 0.05,
                              width: screenWidth * 0.28,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.015),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  'Mil',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.02,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '1');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.05,
                              width: screenWidth * 0.28,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.015),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  'Bil',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.02,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '2');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.05,
                              width: screenWidth * 0.28,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.015),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  'Tril',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.02,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '3');
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg,
                              ),
                              child: TextButton(
                                child: Text(
                                  'C',
                                  style: TextStyle(
                                      fontSize: 30.0, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                // style: ButtonStyle(sha),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, "AC");
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg,
                              ),
                              child: TextButton(
                                child: Text(
                                  '+/-',
                                  style: TextStyle(
                                      fontSize: 30.0, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  // print('+/-');
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '+/-');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg,
                              ),
                              child: TextButton(
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                      fontSize: 30.0, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  // print('%');
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '%');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: Colors.blue,
                              ),
                              child: TextButton(
                                child: Text(
                                  '÷',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  // print('÷');
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '÷');
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  '7',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  setState(() {
                                    // calc(8, 7);
                                    // print(arr);
                                    // selected = NumberType.seven;
                                    onTap = !onTap;
                                    receiveTap(onTap, '7');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  '8',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  // print('8');
                                  setState(() {
                                    // selected = NumberType.eight;
                                    onTap = !onTap;
                                    receiveTap(onTap, '8');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  '9',
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '9');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: Colors.blue,
                              ),
                              child: TextButton(
                                child: Text(
                                  'x',
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, 'x');
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 20.0,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  '4',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '4');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  '5',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '5');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  '6',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '6');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: Colors.blue,
                              ),
                              child: TextButton(
                                child: Text(
                                  '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '-');
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  '1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '1');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  '2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '2');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  '3',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '3');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: Colors.blue,
                              ),
                              child: TextButton(
                                child: Text(
                                  '+',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '+');
                                    // add(selected);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 20.0,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //TODO: clean up the code, make the text button resuable
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  '.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '.');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                child: Text(
                                  '0',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    receiveTap(onTap, '0');
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: MyColor.calItemBg.withOpacity(.3),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: ImageIcon(
                                  AssetImage(
                                    'assets/images/back_cross.png',
                                  ),
                                  size: screenHeight * 0.03,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: Colors.blue,
                              ),
                              child: TextButton(
                                child: Text(
                                  '=',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  setState(() {
                                    onTap = !onTap;
                                    // receiveTap(onTap, '=');
                                    receiveTap(onTap, "=");
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}

class Types {
  String? name;

  Types({this.name});
}
