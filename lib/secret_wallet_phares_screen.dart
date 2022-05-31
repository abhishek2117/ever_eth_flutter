import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/create_wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecretWalletPhraseScreen extends StatefulWidget {
  @override
  _SecretWalletPhraseScreenState createState() =>
      _SecretWalletPhraseScreenState();
}

class _SecretWalletPhraseScreenState extends State<SecretWalletPhraseScreen>
    with AutomaticKeepAliveClientMixin {
  double screenWidth = 0;
  double screenHeight = 0;
  List<String> phrases = [];
  List<String> phrasesOrgData = [];
  List<String> phrasesItems = [];
  bool loader = true;
  bool isEqual = false;

  @override
  void initState() {
    super.initState();
    readyDataList();
  }

  Future<void> readyDataList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phrasesOrgData = prefs.getStringList("list")!;
    phrases = prefs.getStringList("list")!;
    if (phrases.isNotEmpty) {
      setState(() {
        phrases.shuffle();
        loader = false;
        print("Data Org  :: $phrasesOrgData");
        print("Data Suffle  :: $phrases");
      });
    }
    print(phrases);
  }

  Future<void> areListsEqual(var list1, var list2) async {
    bool isTrue = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // check if elements are equal
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) {
        isTrue = false;
      }
    }
    prefs.setBool("equal", isTrue);
  }

  Widget getItem(String secertKey, int index) {
    return Padding(
      padding: EdgeInsets.all(screenHeight * 0.01),
      child: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(
            left: screenHeight * 0.01, right: screenHeight * 0.01),
        child: Text(
          "$secertKey",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white,
              fontSize: screenHeight * 0.018,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget getItemOnTap(String secertKey, int index, List<String> phrasesItems) {
    print(secertKey);
    print("List Data $phrasesItems");
    print("List Size ${phrasesItems.length}");
    if (phrasesItems.isNotEmpty && phrasesItems.length == 12) {
      areListsEqual(phrasesOrgData, phrasesItems);
    }

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

  @override
  Widget build(BuildContext context) {
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
              margin: EdgeInsets.only(
                  left: screenHeight * 0.025, right: screenHeight * 0.025),
              child: loader
                  ? Center(
                      child: CircularProgressIndicator(
                        color: MyColor.purpleColor,
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: phrases.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, childAspectRatio: 3),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: getItem(phrases[index], index),
                          onTap: () {
                            print(phrases[index]);
                            setState(() {
                              String s = phrases[index];
                              phrases.removeAt(index);
                              phrases.insert(index, "");
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

  @override
  bool get wantKeepAlive => true;
}
