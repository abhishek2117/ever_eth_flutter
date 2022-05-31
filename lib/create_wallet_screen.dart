import 'dart:convert';

import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/secret_wallet_phares_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/Api.dart';
import 'Api/api_path.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({Key? key}) : super(key: key);

  @override
  _CreateWalletScreenState createState() => _CreateWalletScreenState();

  void set setList(List<String> phrases) {}
}

class _CreateWalletScreenState extends State<CreateWalletScreen>
    with AutomaticKeepAliveClientMixin {
  double screenWidth = 0;
  double screenHeight = 0;
  List<String> phrases = [];
  List<String> phrases1 = [];

// manage state of modal progress HUD widget
  bool _isInAsyncCall = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // readyDataList();
    getSeedPhrase();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: ModalProgressHUD(
        inAsyncCall: _isInAsyncCall,
        color: Colors.transparent,
        opacity: 0.9,
        progressIndicator: CircularProgressIndicator(
          color: Colors.white,
        ),

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
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: phrases.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
      ),
    );
  }

  Widget getItem(String secertKey, int index) {
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
    var res = await ApiProvider().get(ApiPath.getSeedPharse);
    Map data = json.decode(res.body);
    if (data.isNotEmpty) {
      setState(() {
        _isInAsyncCall = false;
      });
      String mapData = data["mnemonic"];
      final splitted = mapData.split(' ');
      print(splitted);
      splitted.forEach((element) {
        phrases.add(element);
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList("list", phrases);

      print(phrases);
      print("SeedPhrase" + res.toString());
      print("SeedPhraseData :: " + mapData.toString());
    }
  }

  @override
  bool get wantKeepAlive => true;

  List<String> getList() {
    return phrases;
  }
}
