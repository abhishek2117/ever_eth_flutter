import 'package:ever_eth_flutter/calculator_input.dart';
import 'package:ever_eth_flutter/reflection_screen.dart';
import 'package:ever_eth_flutter/token_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'costom_color.dart';

class GainersLooserScreen extends StatefulWidget {
  const GainersLooserScreen({Key? key}) : super(key: key);

  @override
  _GainersLooserScreenState createState() => _GainersLooserScreenState();
}

class _GainersLooserScreenState extends State<GainersLooserScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  String? _selectedType;
  String idType = "0";
  String idOnTap = "1H";

  static const _listTime = [
    'Top Gainers',
    'Top Losers',
    'Recently Added',
  ];

  static const _list = [
    '1H',
    '24H',
    '7D',
  ];

  Future<List<Types>> prepareList() async {
    List<Types> list = [];
    list.add(Types(id: 0, name: "Tokens"));
    list.add(Types(id: 1, name: "Calculate"));
    list.add(Types(id: 2, name: "Reflection"));
    return list;
  }

  Future<List> prepareListTime() async {
    List _list = [
      '1H',
      '24H',
      '7D',
    ];
    return _list;
  }

  Widget securityOptNoBorder(String optName, String reveal, String id) {
    return GestureDetector(
      onTap: () {
        setState(() {
          idType = id;
          if (idType == "0") {
            /* Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BuyCryptoScreen()));*/
          } else if (idType == "1") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CalculatorInput()));
          } else if (idType == "2") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ReflectionScreen()));
          }
        });
      },
      child: Container(
        height: screenHeight * 0.04,
        width: screenWidth * 0.22,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
            left: screenHeight * 0.005, right: screenHeight * 0.005),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenHeight * 0.03),
          color: idType == id
              ? MyColor.navItemColor.withOpacity(.2)
              : Colors.transparent,
        ),
        child: Text(
          reveal,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.022,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget securityOptNoBorderTime(
      String optName, String reveal, Color transparentOpt) {
    return Container(
      width: screenWidth * 0.1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenHeight * 0.01),
        color: Colors.transparent,
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
    int currentValue = 0;

    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.12,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      MyColor.gradientColor1.withOpacity(.15),
                      MyColor.gradientColor1.withOpacity(.1),
                      MyColor.gradientColor1.withOpacity(.05),
                    ],
                    begin: Alignment.topCenter, //begin of the gradient color
                    end: Alignment.bottomCenter, //end of the gradient color
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(screenHeight * 0.05),
                    bottomLeft: Radius.circular(screenHeight * 0.05),
                  ), //border corner radius
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(null),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Row(
                children: [
                  Container(
                    height: screenHeight * 0.05,
                    margin: EdgeInsets.only(left: screenWidth * 0.05),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(screenHeight * 0.008),
                        color: Colors.transparent),
                    child: DropdownButtonHideUnderline(
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(canvasColor: MyColor.textFieldBg),
                        child: DropdownButton(
                          iconSize: 0.0,
                          hint: Row(
                            children: [
                              Text(
                                "Top Gainers",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.022,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                          // icon: Icon(Icons.keyboard_arrow_down),
                          value: _selectedType,
                          // A global variable used to keep track of the selection
                          items: _listTime.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    item,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.022,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (v) {
                            setState(() {
                              _selectedType = v as String?;
                              print(_selectedType);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              idOnTap = "1H";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: idOnTap == "1H"
                                        ? Colors.blue
                                        : Colors.white,
                                    width: screenWidth * 0.005,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: Text(
                              "1H",
                              style: TextStyle(
                                color: idOnTap == "1H"
                                    ? Colors.blue
                                    : Colors.white,
                                fontSize: screenHeight * 0.022,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              idOnTap = "24H";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: idOnTap == "24H"
                                        ? Colors.blue
                                        : Colors.white,
                                    width: screenWidth * 0.005,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: Text(
                              "24H",
                              style: TextStyle(
                                color: idOnTap == "24H"
                                    ? Colors.blue
                                    : Colors.white,
                                fontSize: screenHeight * 0.022,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              idOnTap = "7D";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: idOnTap == "7D"
                                        ? Colors.blue
                                        : Colors.white,
                                    width: screenWidth * 0.005,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: Text(
                              "7D",
                              style: TextStyle(
                                color: idOnTap == "7D"
                                    ? Colors.blue
                                    : Colors.white,
                                fontSize: screenHeight * 0.022,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: screenHeight * 0.02, right: screenHeight * 0.02),
                  alignment: Alignment.center,
                  child: TextField(
                    autocorrect: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.02,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(screenHeight * 0.005),
                      hintText: 'Search...',
                      prefixIcon: Icon(
                        Icons.search,
                        size: screenHeight * 0.045,
                        color: Colors.white38,
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: MyColor.textFieldBg.withOpacity(.3),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(screenHeight * 0.015),
                        borderSide:
                            BorderSide(color: MyColor.textFieldBg, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(screenHeight * 0.015),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2),
                      ),
                    ),
                  )),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TokenScreen()));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: screenHeight * 0.02, right: screenHeight * 0.02),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        MyColor.gradientColor1.withOpacity(.15),
                        MyColor.gradientColor1.withOpacity(.1),
                        MyColor.gradientColor1.withOpacity(.05),
                      ],
                      begin: Alignment.topCenter, //begin of the gradient color
                      end: Alignment.bottomCenter, //end of the gradient color
                    ),
                    borderRadius: BorderRadius.circular(
                        screenHeight * 0.03), //border corner radius
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: screenHeight * 0.02,
                            right: screenHeight * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(screenHeight * .01),
                              child: Text(
                                "Ethereum",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.022,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(screenHeight * .01),
                              child: Text(
                                "Balance",
                                style: TextStyle(
                                  color: MyColor.yellowColor,
                                  fontSize: screenHeight * 0.022,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: screenHeight * 0.02,
                            right: screenHeight * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(screenHeight * .002),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/images/eth_small.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  Text(
                                    " \$4,112",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.022,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(screenHeight * .01),
                              child: Text(
                                "+12.90(20%)",
                                style: TextStyle(
                                  color: MyColor.yellowColor,
                                  fontSize: screenHeight * 0.022,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TokenScreen()));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: screenHeight * 0.02, right: screenHeight * 0.02),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        MyColor.gradientColor1.withOpacity(.15),
                        MyColor.gradientColor1.withOpacity(.1),
                        MyColor.gradientColor1.withOpacity(.05),
                      ],
                      begin: Alignment.topCenter, //begin of the gradient color
                      end: Alignment.bottomCenter, //end of the gradient color
                    ),
                    borderRadius: BorderRadius.circular(
                        screenHeight * 0.03), //border corner radius
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: screenHeight * 0.02,
                            right: screenHeight * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(screenHeight * .01),
                              child: Text(
                                "Ethereum",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.022,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(screenHeight * .01),
                              child: Text(
                                "Balance",
                                style: TextStyle(
                                  color: MyColor.yellowColor,
                                  fontSize: screenHeight * 0.022,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: screenHeight * 0.02,
                            right: screenHeight * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(screenHeight * .002),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/images/eth_small.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  Text(
                                    " \$4,112",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.022,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(screenHeight * .01),
                              child: Text(
                                "+12.90(20%)",
                                style: TextStyle(
                                  color: MyColor.yellowColor,
                                  fontSize: screenHeight * 0.022,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Types {
  int? id;
  String? name;

  Types({this.id, this.name});
}
