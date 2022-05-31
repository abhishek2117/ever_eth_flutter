import 'package:ever_eth_flutter/costom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PurchaseTokenScreen extends StatefulWidget {
  const PurchaseTokenScreen({Key? key}) : super(key: key);

  @override
  _PurchaseTokenScreenState createState() => _PurchaseTokenScreenState();
}

class TimeType {
  int? id;
  String? name;

  TimeType({this.id, this.name});
}

class _PurchaseTokenScreenState extends State<PurchaseTokenScreen> {
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
                      height: screenHeight * 0.08,
                    ),
                    Container(
                      width: screenWidth,
                      margin: EdgeInsets.only(
                          left: screenHeight * 0.03, right: screenHeight * 0.03),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            MyColor.gradientColor1.withOpacity(.15),
                            MyColor.gradientColor1.withOpacity(.1),
                            MyColor.gradientColor1.withOpacity(.05),
                          ],
                          begin: Alignment.topCenter,
                          //begin of the gradient color
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
                                left: screenHeight * 0.03,
                                right: screenHeight * 0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/eth.png',
                                      color: MyColor.purpleColor,
                                      height: screenHeight * 0.05,
                                      width: screenWidth * 0.05,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "EverETH",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenHeight * 0.03,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            radius: screenHeight * 0.005,
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.01,
                                          ),
                                          Text(
                                            "Includes Platform Fess",
                                            style: TextStyle(
                                              color: Colors.white.withOpacity(.5),
                                              fontSize: screenHeight * 0.016,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                Text(
                                  "Purchase multiple cryptocurrenciesfrom",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.02,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ),
                                Text(
                                  "BNB-20 to EETH-20",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.02,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.05,
                                ),
                                InkWell(
                                  onTap: () {
                                  },
                                  child: Container(
                                    height: screenHeight * 0.08,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            screenHeight * 0.03),
                                        color:
                                            MyColor.purpleColor.withOpacity(.3)),
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.only(left: screenHeight*0.03,right: screenHeight*0.02),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Purchase",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenHeight * 0.025,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.04,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Container(
                      width: screenWidth,
                      margin: EdgeInsets.only(
                          left: screenHeight * 0.03, right: screenHeight * 0.03),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            MyColor.gradientColor1.withOpacity(.15),
                            MyColor.gradientColor1.withOpacity(.1),
                            MyColor.gradientColor1.withOpacity(.05),
                          ],
                          begin: Alignment.topCenter,
                          //begin of the gradient color
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
                                left: screenHeight * 0.03,
                                right: screenHeight * 0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/wyre.png',
                                      height: screenHeight * 0.05,
                                      width: screenWidth * 0.05,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Wyre",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenHeight * 0.03,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            radius: screenHeight * 0.005,
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.01,
                                          ),
                                          Text(
                                            "Includes Platform Fess",
                                            style: TextStyle(
                                              color: Colors.white.withOpacity(.5),
                                              fontSize: screenHeight * 0.016,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                Text(
                                  "Buy Ethereum.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.02,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.02,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.05,
                                ),
                                InkWell(
                                  onTap: () {
                                  },
                                  child: Container(
                                    height: screenHeight * 0.08,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            screenHeight * 0.03),
                                        color:
                                        MyColor.purpleColor.withOpacity(.3)),
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.only(left: screenHeight*0.03,right: screenHeight*0.02),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Purchase",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenHeight * 0.025,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.04,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
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
