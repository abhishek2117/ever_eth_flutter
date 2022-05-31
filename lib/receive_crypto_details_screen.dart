// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'common_methods/shared_pref.dart';
import 'costom_color.dart';

class ReceiveCryptoDetailsScreen extends StatefulWidget {
  const ReceiveCryptoDetailsScreen({Key? key}) : super(key: key);

  @override
  _ReceiveCryptoDetailsScreenState createState() =>
      _ReceiveCryptoDetailsScreenState();
}

class _ReceiveCryptoDetailsScreenState
    extends State<ReceiveCryptoDetailsScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  String address = '';

  Widget _buildButtonColumn(Color color, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: address)).then((value) {
          Get.showSnackbar(
            GetSnackBar(
              duration: Duration(seconds: 2),
              messageText: Text(
                "Copied",
                style: TextStyle(color: Colors.white,fontSize: 16 , fontWeight: FontWeight.w500),
              ),
            ),
          );
        });
      },
      child: Column(
        children: [
          Container(
            height: screenHeight * 0.14,
            width: screenWidth * 0.2,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: screenHeight * 0.02,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    CommonSharePref.getData('address').then((value) {
      setState(() {
        address = value;
      });
    });
    // TODO: implement initState
    super.initState();
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
          "Receive",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.03,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.search_rounded,
          //     size: screenHeight * 0.04,
          //   ),
          //   onPressed: () => Navigator.of(context).pop(null),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.15,
            ),
            Center(
              child: QrImage(
                data: address,
                version: QrVersions.auto,
                backgroundColor: Colors.white,
                size: 240,
                gapless: true,
              ),
            ),
            // Center(
            //   child: Image.asset(
            //     'assets/images/qr_code.png',
            //   ),
            // ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Center(
              child: Text(
                "Only send EETH-20 token to this address. ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.018,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Center(
              child: Text(
                "Sending any other coins may result in permanent loss.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.018,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: _buildButtonColumn(
                      MyColor.navItemColor, Icons.copy, 'Copy'),
                ),
                // InkWell(
                //   onTap: () {},
                //   child: _buildButtonColumn(
                //       MyColor.navItemColor, Icons.share, 'Share'),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
