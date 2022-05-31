import 'dart:ui';

import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/import_wallet_pass_create_screen.dart';
import 'package:ever_eth_flutter/page_view_import_screen.dart';
import 'package:ever_eth_flutter/page_view_import_wallet_screen.dart';
import 'package:ever_eth_flutter/page_view_privatekey_screen.dart';
import 'package:ever_eth_flutter/page_view_wallet_screen.dart';
import 'package:flutter/material.dart';

class IntroScreenSecond extends StatefulWidget {
  const IntroScreenSecond({Key? key}) : super(key: key);

  @override
  _IntroScreenSecondState createState() => _IntroScreenSecondState();
}

class _IntroScreenSecondState extends State<IntroScreenSecond> {
  double screenWidth = 0;
  double screenHeight = 0;
  late MediaQueryData _mediaQueryData;

  @override
  Widget build(BuildContext context) {
    // _mediaQueryData = MediaQuery.of(context);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.06,
            ),
            Center(
              child: Image.asset(
                'assets/images/eth.png',
                height: screenHeight * 0.35,
                width: screenWidth * 0.35,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Container(
              margin: EdgeInsets.only(left: screenHeight * 0.04),
              child: Text(
                "Choose your",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.05,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            Container(
              margin: EdgeInsets.only(left: screenHeight * 0.04),
              child: Text(
                "import method",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.05,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PageViewImportWalletScreen()));
                print("Recovery Phrase");
              },
              child: Container(
                height: screenHeight * 0.1,
                width: screenWidth * 0.45,
                margin: EdgeInsets.only(left: screenHeight * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenHeight * 0.03),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Recovery Phrase",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenHeight * 0.022,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            Container(
              margin: EdgeInsets.only(left: screenHeight * 0.04,right: screenHeight * 0.04),
              child: Row(

                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.45,
                      alignment: Alignment.center,
                      child: Text(
                        "Or",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.022,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PageViewPrivateKeyScreen()));
                        print("Private Key");
                      },
                      child: Container(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenHeight * 0.03),
                          color: MyColor.purpleColor.withOpacity(0.3),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Private Key",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.022,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
