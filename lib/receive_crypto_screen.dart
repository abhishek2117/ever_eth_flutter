import 'package:ever_eth_flutter/receive_crypto_details_screen.dart';
import 'package:flutter/material.dart';

import 'costom_color.dart';

class ReceiveCryptoScreen extends StatefulWidget {
  const ReceiveCryptoScreen({Key? key}) : super(key: key);

  @override
  _ReceiveCryptoScreenState createState() => _ReceiveCryptoScreenState();
}

class _ReceiveCryptoScreenState extends State<ReceiveCryptoScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

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
          "Receive",
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
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
                  bottomRight: Radius.circular(screenHeight * 0.06),
                  bottomLeft: Radius.circular(screenHeight * 0.06),
                ), //border corner radius
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenHeight * .01),
                    child: Text(
                      "Current Wallet Value",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                        fontSize: screenHeight * 0.022,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenHeight * .006),
                    child: Text(
                      "\$3,293.46",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.06,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ReceiveCryptoDetailsScreen()));
              },
              child: Container(
                margin: EdgeInsets.only(left:screenHeight*0.025,right: screenHeight*0.025),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              height: screenHeight * 0.03,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ReceiveCryptoDetailsScreen()));
              },
              child: Container(
                margin: EdgeInsets.only(left:screenHeight*0.025,right: screenHeight*0.025),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/eth_small.png',
                                  height: 20,
                                  width: 20,
                                ),
                                Text(
                                  " \$518.1",
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
    );
  }
}
