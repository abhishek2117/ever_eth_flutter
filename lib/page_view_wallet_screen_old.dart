import 'dart:convert';

import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/page_view_import_screen.dart';
import 'package:flutter/material.dart';
import 'Api/Api.dart';
import 'Api/api_path.dart';

class PageViewWalletScreen extends StatefulWidget {
  const PageViewWalletScreen({Key? key}) : super(key: key);

  @override
  _PageViewWalletScreenState createState() => _PageViewWalletScreenState();
}

class _PageViewWalletScreenState extends State<PageViewWalletScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  bool boolNext = false;
  List<String> phrases = [];
  List<String> phrases1 = [];
  List<String> phrasesOrgData = [];
  List<String> phrasesItems = [];

  bool loader = true;

  int _curr = 0;

  @override
  void initState() {
    super.initState();
    getSeedPhrase();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 12,
              child: _curr == 0 ? _uiFirstStepScreen() : _uiSecondStepScreen()),
          Expanded(
            flex: 1,
            child: Container(
              width: screenWidth,
              color: MyColor.purpleColor.withOpacity(.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_curr == 1) {
                          _curr = _curr - 1;
                          boolNext = false;
                          phrasesOrgData.addAll(phrasesItems);
                          phrasesItems.clear();
                          print(_curr);
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: screenHeight * 0.04),
                      child: Visibility(
                        visible: boolNext,
                        child: Text(
                          "Back",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.022,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        if (_curr == 0) {
                          _curr = _curr + 1;
                          boolNext = true;
                          print(_curr);
                        } else if (_curr == 1) {
                          print("Navigate");

                          print("List Data $phrasesItems");
                          print("List Size ${phrasesItems.length}");
                          if (phrasesItems.isNotEmpty &&
                              phrasesItems.length == 12) {
                            print(
                                "ABC    ***** ${areListsEqual(phrases, phrasesItems)}");
                            if (areListsEqual(phrases, phrasesItems)) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      PageViewImportScreen(phrases)));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text("Seed Pharses does not matche!! "),
                              ));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please select all Seed Pharses"),
                            ));
                          }
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: screenHeight * 0.04),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.022,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _uiFirstStepScreen() {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
        backgroundColor: MyColor.primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Container(
              margin: EdgeInsets.only(left: screenHeight * 0.04),
              child: Text(
                "Your recovery",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.05,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            Container(
              margin: EdgeInsets.only(left: screenHeight * 0.04),
              child: Text(
                "phrase",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.05,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Container(
              margin: EdgeInsets.only(left: screenHeight * 0.04),
              child: Text(
                "Keep your recovery phrase in",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.022,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            Container(
              margin: EdgeInsets.only(left: screenHeight * 0.04),
              child: Text(
                "a safe place",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.022,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.08,
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
                child: loader
                    ? Center(
                        child: const CircularProgressIndicator(
                          color: MyColor.purpleColor,
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: phrases.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 4),
                        itemBuilder: (context, index) {
                          return getItem(phrases[index], index);
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getItemSecond(String secertKey, int index) {
    return Padding(
      padding: EdgeInsets.all(screenHeight * 0.01),
      child: Container(
        margin: EdgeInsets.only(
          left: screenHeight * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              " $secertKey",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget getItem(String secertKey, int index) {
    return Padding(
      padding: EdgeInsets.all(screenHeight * 0.01),
      child: Container(
        margin: EdgeInsets.only(
          left: screenHeight * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.035,
              width: screenWidth * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight * 0.01),
                color: Colors.black.withOpacity(.2),
              ),
              child: Center(
                child: Text(
                  " ${(index + 1)}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.02,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.06,
            ),
            Text(
              " $secertKey",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getSeedPhrase() async {
    setState(() {
      loader = false;
    });
    var res = await ApiProvider().get(ApiPath.getSeedPharse);
    Map data = json.decode(res.body);
    if (data.isNotEmpty) {
      setState(() {
        loader = false;
      });
      String mapData = data["mnemonic"];
      final splitted = mapData.split(' ');
      print(splitted);
      splitted.forEach((element) {
        phrases.add(element);
        phrasesOrgData.add(element);
      });
      phrasesOrgData.shuffle();
      print(phrases);
      print("SeedPhrase" + res.toString());
      print("SeedPhraseData :: " + mapData.toString());
      print("SeedPhraseDataShuffle :: " + phrasesOrgData.toString());
    }
  }

  Widget _uiSecondStepScreen() {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
        backgroundColor: MyColor.primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Container(
              margin: EdgeInsets.only(left: screenHeight * 0.04),
              child: Text(
                "In the correct order, type your",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.022,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            Container(
              margin: EdgeInsets.only(left: screenHeight * 0.04),
              child: Text(
                "secret wallet recovery phrase",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.022,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              child: loader
                  ? Center(
                      child: CircularProgressIndicator(
                        color: MyColor.purpleColor,
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: phrasesOrgData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: (4 / 1),
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: getItemSecond(phrasesOrgData[index], index),
                          onTap: () {
                            print(phrasesOrgData[index]);
                            setState(() {
                              String s = phrasesOrgData[index];
                              phrasesOrgData.removeAt(index);
                              // phrasesOrgData.insert(index, "");
                              if (s != null) {
                                phrasesItems.add(s);
                                print(phrasesItems.toString());
                              } else {
                                print(phrases[index]);
                              }
                            });
                          },
                        );
                      },
                    ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
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
                  ), //border corner radius
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: phrasesItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 4),
                  itemBuilder: (context, index) {
                    return getItemOnTap(
                        phrasesItems[index], index, phrasesItems);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getItemOnTap(String secertKey, int index, List<String> phrasesItems) {
    return Padding(
      padding: EdgeInsets.all(screenHeight * 0.01),
      child: Container(
        margin: EdgeInsets.only(
            left: screenHeight * 0.02, right: screenHeight * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.035,
              width: screenWidth * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight * 0.01),
                color: Colors.black.withOpacity(.2),
              ),
              child: Center(
                child: Text(
                  " ${(index + 1)}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.02,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.06,
            ),
            Text(
              "$secertKey",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  bool areListsEqual(var list1, var list2) {
    bool isTrue = true;

    // check if elements are equal
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) {
        return isTrue = false;
      }
    }
    return isTrue;
  }
}
