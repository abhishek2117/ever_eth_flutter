import 'package:ever_eth_flutter/costom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TokenScreen extends StatefulWidget {
  const TokenScreen({Key? key}) : super(key: key);

  @override
  _TokenScreenState createState() => _TokenScreenState();
}

class TimeType {
  int? id;
  String? name;

  TimeType({this.id, this.name});
}

class _TokenScreenState extends State<TokenScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  String idType = "0";
  String idOnTap = "1H";


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
          "",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.03,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).padding.top), //this
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      MyColor.gradientColor1.withOpacity(.15),
                      MyColor.gradientColor2,
                    ],
                    begin: Alignment.topCenter, //begin of the gradient color
                    end: Alignment.bottomCenter, //end of the gradient color
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(screenHeight * 0.06),
                    topLeft: Radius.circular(screenHeight * 0.06),
                  ), //
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(5, 5),
                      blurRadius: 10,
                    )
                  ], // border corner radius
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Center(
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                        size: screenHeight * 0.05,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: screenHeight * 0.03,
                          right: screenHeight * 0.03),
                      child: Text(
                        "Bitcoin(BTC)",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.5),
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: screenHeight * 0.03,
                          right: screenHeight * 0.03),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            MyColor.gradientColor1.withOpacity(.15),
                            MyColor.gradientColor1.withOpacity(.1),
                            MyColor.gradientColor1.withOpacity(.05),
                          ],
                          begin: Alignment.topCenter,
                          //begin of the gradient color
                          end: Alignment
                              .bottomCenter, //end of the gradient color
                        ),
                        borderRadius: BorderRadius.circular(
                            screenHeight * 0.03), //border corner radius
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenHeight * .002),
                            child: Center(
                              child: Text(
                                "\$1.00",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.08,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenHeight * .002),
                            child: Center(
                              child: Text(
                                "+12.90(20%)",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.025,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenHeight * .002),
                            child: Center(
                              child: Text(
                                "\$1.00",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.016,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/graph_one.png',
                            width: screenWidth,
                            fit: BoxFit.fill,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: screenHeight * 0.02,
                                right: screenHeight * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(screenHeight * .01),
                                  child: Text(
                                    "\$1.00",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.016,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Row(
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
                                    idOnTap = "1D";
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color:idOnTap == "1D"
                                              ? Colors.blue
                                              : Colors.white,
                                          width: screenWidth * 0.005,
                                          style: BorderStyle.solid),
                                    ),
                                  ),
                                  child: Text(
                                    "1D",
                                    style: TextStyle(
                                      color: idOnTap == "1D"
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
                                    idOnTap = "1W";
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: idOnTap == "1W"
                                              ? Colors.blue
                                              : Colors.white,
                                          width: screenWidth * 0.005,
                                          style: BorderStyle.solid),
                                    ),
                                  ),
                                  child: Text(
                                    "1W",
                                    style: TextStyle(
                                      color: idOnTap == "1W"
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
                                    idOnTap = "1M";
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color:idOnTap == "1M"
                                              ? Colors.blue
                                              : Colors.white,
                                          width: screenWidth * 0.005,
                                          style: BorderStyle.solid),
                                    ),
                                  ),
                                  child: Text(
                                    "1M",
                                    style: TextStyle(
                                      color: idOnTap == "1M"
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
                                    idOnTap = "1Y";
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: idOnTap == "1Y"
                                              ? Colors.blue
                                              : Colors.white,
                                          width: screenWidth * 0.005,
                                          style: BorderStyle.solid),
                                    ),
                                  ),
                                  child: Text(
                                    "1Y",
                                    style: TextStyle(
                                      color: idOnTap == "1Y"
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
                                    idOnTap = "All";
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color:idOnTap == "All"
                                              ? Colors.blue
                                              : Colors.white,
                                          width: screenWidth * 0.005,
                                          style: BorderStyle.solid),
                                    ),
                                  ),
                                  child: Text(
                                    "All",
                                    style: TextStyle(
                                      color: idOnTap == "All"
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
                          SizedBox(
                            height: screenHeight * 0.04,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void printData(String idType) {
    print("Time Type $idType");
  }
}
