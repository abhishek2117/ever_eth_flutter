import 'package:ever_eth_flutter/costom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TokenDisScreen extends StatefulWidget {
  const TokenDisScreen({Key? key}) : super(key: key);

  @override
  _TokenDisScreenState createState() => _TokenDisScreenState();
}

class TimeType {
  int? id;
  String? name;

  TimeType({this.id, this.name});
}

class _TokenDisScreenState extends State<TokenDisScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  String idOnTap = "1H";

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(null),
        ),
        title: Text(
          "Purchase Tokens",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.03,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_rounded,
              size: screenHeight * 0.04,
            ),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ],
      ),
      body: Column(
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
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                      left: screenHeight * 0.03,
                      right: screenHeight * 0.03),
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
                        height: screenHeight * 0.06,
                      ),
                      Text(
                        "About this tracker",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.025,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Text(
                        "You did convert 0.6 ETH entire portfolio to 6533 CND",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.018,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Text(
                        "You did convert 0.6 ETH entire portfolio to 6533 CND",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.018,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Text(
                        "You did convert 0.6 ETH entire portfolio to 6533 CND",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.018,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void printData(String idType) {
    print("Time Type $idType");
  }
}
