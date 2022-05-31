import 'package:ever_eth_flutter/receive_crypto_details_screen.dart';
import 'package:flutter/material.dart';

import 'costom_color.dart';

class SendCryptoDetailsScreen extends StatefulWidget {
  const SendCryptoDetailsScreen({Key? key}) : super(key: key);

  @override
  _SendCryptoDetailsScreenState createState() =>
      _SendCryptoDetailsScreenState();
}

class _SendCryptoDetailsScreenState extends State<SendCryptoDetailsScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  underLineInput() {
    return UnderlineInputBorder(
      borderSide:
          BorderSide(color: Colors.transparent, width: screenHeight * 0.007),
    );
  }

  Widget securityOptNoBorder(String optName, Color transparentOpt) {
    return Container(
      margin: EdgeInsets.only(
          left: screenHeight * 0.003, right: screenHeight * 0.003),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenHeight * 0.01),
        color: MyColor.navItemColor.withOpacity(.2),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenHeight * 0.01),
        child: Text(
          optName,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.018,
            fontWeight: FontWeight.w300,
          ),
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
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(null),
        ),
        title: Text(
          "Send",
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
                      "BNB Balance",
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
                      "0.00",
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
            Container(
              margin: EdgeInsets.only(
                  left: screenHeight * 0.05, bottom: screenHeight * 0.008),
              child: Text(
                "Send to",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: screenHeight * 0.02, right: screenHeight * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight * 0.015),
                color: Colors.black.withOpacity(.2),
                border: Border.all(
                  color: Colors.white38,
                  //                   <--- border color
                  width: screenHeight * 0.002,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    child: Flexible(
                      child: TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Recipient Address',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.02,
                            fontWeight: FontWeight.w300,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          enabledBorder: underLineInput(),
                          focusedBorder: underLineInput(),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ), //flexible
                  ), //co
                  Padding(
                    padding: EdgeInsets.all(screenHeight * .01),
                    child: Row(
                      children: [
                        Text(
                          "Paste",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: screenHeight * 0.018,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenHeight * 0.006),
                          child: ImageIcon(
                            AssetImage(
                              'assets/images/qr_scanner.png',
                            ),
                            color: Colors.white.withOpacity(.8),
                            size: screenHeight * 0.025,
                          ),
                        ),
                      ],
                    ),
                  ), // ntainer
                ], //widget
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: screenHeight * 0.02, right: screenHeight * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight * 0.015),
                color: Colors.black.withOpacity(.2),
                border: Border.all(
                  color: Colors.white38,
                  //                   <--- border color
                  width: screenHeight * 0.002,
                ),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Flexible(
                      child: TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Smart Chain Amount',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.02,
                            fontWeight: FontWeight.w300,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          enabledBorder: underLineInput(),
                          focusedBorder: underLineInput(),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ), //flexible
                  ), //co
                  Padding(
                    padding: EdgeInsets.all(screenHeight * .01),
                    child: Row(
                      children: [
                        securityOptNoBorder(
                            "Quarter", Colors.white38.withOpacity(.2)),
                        securityOptNoBorder(
                            "Half", Colors.white38.withOpacity(.2)),
                        securityOptNoBorder(
                            "Max", Colors.white38.withOpacity(.2)),
                      ],
                    ),
                  ), // ntainer
                ], //widget
              ),

              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenHeight * .015),
                    child: Text(
                      "0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenHeight * .01),
                    child:Row(
                      children: [
                        Icon(
                          Icons.list,
                          color: Colors.white.withOpacity(.8),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Text(
                          "BUSD",
                          style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: screenHeight * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white.withOpacity(.5),
                          size: screenHeight * 0.03,
                        )
                      ],
                    ),
                  ),
                ],
              ),*/
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: screenHeight * 0.05, bottom: screenHeight * 0.008),
              child: Text(
                "=\$0.00",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: screenHeight * 0.02, right: screenHeight * 0.02),
              child: Text(
                "Note: In the correct order, type your secret wallet recovery phrase to import your wallet",
                style: TextStyle(
                  color: Colors.white.withOpacity(.3),
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            InkWell(
              onTap: () {
                print("Confirm");
              },
              child: Container(
                height: screenHeight * 0.08,
                margin: EdgeInsets.only(
                    left: screenHeight * 0.02, right: screenHeight * 0.02),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(screenHeight * 0.03),
                  gradient: LinearGradient(
                    colors: [
                      MyColor.purpleColor.withOpacity(.3),
                      MyColor.purpleColor.withOpacity(.3),
                      MyColor.purpleColor.withOpacity(.3),
                      MyColor.purpleColor.withOpacity(.3),
                      MyColor.purpleColor.withOpacity(0),
                    ],
                    /*stops: [0.6,0.8,],*/
                    begin: Alignment.topLeft, //begin of the gradient color
                    end: Alignment.topRight, //end of the gradient color
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.022,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
