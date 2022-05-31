import 'dart:ui';

import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/page_view_wallet_screen_old.dart';
import 'package:flutter/material.dart';

class IntroScreenFirst extends StatefulWidget {
  PageController controller;
  IntroScreenFirst(this.controller);

  @override
  _IntroScreenFirstState createState() => _IntroScreenFirstState();
}

class _IntroScreenFirstState extends State<IntroScreenFirst> {
  double screenWidth = 0;
  double screenHeight = 0;
  late MediaQueryData _mediaQueryData;
  static const _pageDuration = const Duration(milliseconds: 200);
  static const _pageCurve = Curves.ease;

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
                "Secure place to",
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
                "store and trade",
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
                /*Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PageViewImportWalletScreen()));*/
                widget.controller.nextPage(
                    duration: _pageDuration, curve: _pageCurve);
                print("Import Wallet");
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
                  "Import Wallet",
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
              margin: EdgeInsets.only(
                  left: screenHeight * 0.04, right: screenHeight * 0.04),
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
                    builder: (context) => PageViewWalletScreen()));
                      },
                      child: Container(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.45,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.03),
                          color: MyColor.purpleColor.withOpacity(0.3),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Create a wallet",
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
