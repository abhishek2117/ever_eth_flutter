// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ever_eth_flutter/common_methods/shared_pref.dart';
import 'package:ever_eth_flutter/gainers_loser_screen.dart';
import 'package:ever_eth_flutter/receive_crypto_details_screen.dart';
import 'package:ever_eth_flutter/receive_crypto_screen.dart';
import 'package:ever_eth_flutter/reflection_screen.dart';
import 'package:ever_eth_flutter/send_crypto_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'buy_crypto_screen.dart';
import 'calculator_input.dart';
import 'calculator_screen/calculater_screen.dart';
import 'costom_color.dart';

import 'Api/walletScreenAPI.dart';
import 'common_methods/commonIndicator.dart';

import 'dart:math' as math;
import 'package:flutter_sparkline/flutter_sparkline.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool isLoading = true;
  final coinDetailsResponse = GraphDataApi();

  double screenWidth = 0;
  double screenHeight = 0;
  String? idType = '1';
  String? totalBalance = "0";

  void initState() {
    coinDetailsResponse.getYourTokenData().then((value) {
      isLoading = false;
      setState(() {});
    });

    CommonSharePref.getData('totalBalance').then((value) {
      totalBalance = value;
    });

    super.initState();
  }

  Future<List<Types>> prepareList() async {
    List<Types> list = [];
    // list.add(Types(id: 0, name: "Tokens"));
    list.add(Types(id: 1, name: "Calculate"));
    // list.add(Types(id: 2, name: "Reflection"));
    return list;
  }

  math.Random random = new math.Random();

  List<double> _generateRandomData(int count) {
    List<double> result = <double>[];
    for (int i = 0; i < count; i++) {
      result.add(random.nextDouble() * 100);
    }
    return result;
  }

  Widget securityOptNoBorder(String optName, String reveal, String id) {
    return GestureDetector(
      onTap: () {
        setState(() {
          idType = id;
          if (idType == "0") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => GainersLooserScreen()));
          } else if (idType == "1") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CalculatorScreen()));
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
            color: Colors.transparent),
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

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.gradientColor1.withOpacity(.15),
        title: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text("Wallet"),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => CalculatorScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 11.0),
              child: ImageIcon(
                AssetImage(
                  'assets/images/calculator_image.png',
                ),
                size: screenHeight * 0.038,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      backgroundColor: MyColor.primaryColor,
      body: isLoading
          ? CommonIndicator()
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenHeight * 0.1,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MyColor.gradientColor1.withOpacity(.15),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(screenHeight * 0.00),
                          bottomLeft: Radius.circular(screenHeight * 0.00),
                        ), //border corner radius
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [],
                      ),
                    ),
                    SingleChildScrollView(
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
                                begin: Alignment.topCenter,
                                //begin of the gradient color
                                end: Alignment
                                    .bottomCenter, //end of the gradient color
                              ),

                              borderRadius: BorderRadius.only(
                                bottomRight:
                                    Radius.circular(screenHeight * 0.06),
                                bottomLeft:
                                    Radius.circular(screenHeight * 0.06),
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
                                    '\$$totalBalance',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.06,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.03,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SendCryptoScreen()));
                                      },
                                      child: _buildButtonColumn(
                                          MyColor.navItemColor,
                                          'assets/images/send.png',
                                          'Send'),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BuyCryptoScreen()));
                                        // BuyCryptoScreen()));
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            width: screenWidth * 0.18,
                                            decoration: BoxDecoration(
                                              color: MyColor.purpleColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenHeight * 0.035),
                                              child: Image.asset(
                                                'assets/images/add.png',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.02,
                                          ),
                                          Text(
                                            "Buy",
                                            style: TextStyle(
                                              fontSize: screenHeight * 0.02,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ReceiveCryptoDetailsScreen()));
                                        // ReceiveCryptoScreen()));
                                      },
                                      child: _buildButtonColumn(
                                          MyColor.navItemColor,
                                          'assets/images/receive.png',
                                          'Recieve'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.04,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(screenHeight * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(screenHeight * .01),
                                  child: Text(
                                    "Your Tokens",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.025,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(screenHeight * .002),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "See all",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(.5),
                                          fontSize: screenHeight * 0.022,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: screenHeight * 0.025,
                                        color: Colors.white.withOpacity(.5),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 160.0,
                            child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: coinDetailsResponse.coinList?.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  tokenCard(
                                      coinDetailsResponse.coinList?[index]),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Widget tokenCard(coin) {
    var data = _generateRandomData(100);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: screenWidth * 0.03,
        ),
        Container(
          width: screenWidth * 0.6,
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
                    left: screenHeight * 0.02, right: screenHeight * 0.02),
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
                          Container(
                            margin: EdgeInsets.only(left: screenHeight * 0.008),
                            child: Text(
                              coin["coinName"].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.022,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                width: 149.0,
                height: 40.0,
                child: Sparkline(
                  data: data,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: screenHeight * 0.02, right: screenHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(screenHeight * .01),
                        child: Text(
                          "\$" + coin["price"].toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: screenHeight * 0.015,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(screenHeight * .01),
                        child: Text(
                          coin["usd_24h_change"].toString() + "%",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: screenHeight * 0.015,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonColumn(Color color, String imgPath, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(screenHeight * 0.025),
            child: Image.asset(
              imgPath,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.02,
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
    );
  }
}

class Types {
  int? id;
  String? name;

  Types({this.id, this.name});
}
