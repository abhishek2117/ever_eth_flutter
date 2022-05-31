import 'dart:convert';

import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/page_view_import_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/Api.dart';
import 'Api/api_path.dart';
import 'navigation_screen.dart';

class PageViewImportWalletScreen extends StatefulWidget {
  const PageViewImportWalletScreen({Key? key}) : super(key: key);

  @override
  _PageViewImportWalletScreenState createState() =>
      _PageViewImportWalletScreenState();
}

class _PageViewImportWalletScreenState
    extends State<PageViewImportWalletScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  bool boolNext = false;
  List<String> phrases = [];
  List<String> phrases1 = [];
  List<String> phrasesOrgData = [];
  List<String> phrasesItems = [];
  bool loader = false;
  bool _isInAsyncCall = false;
  final _editTextController1 = TextEditingController(text: "");
  final _editTextController2 = TextEditingController(text: "");
  final _editTextController3 = TextEditingController(text: "");
  final _editTextController4 = TextEditingController(text: "");
  final _editTextController5 = TextEditingController(text: "");
  final _editTextController6 = TextEditingController(text: "");
  final _editTextController7 = TextEditingController(text: "");
  final _editTextController8 = TextEditingController(text: "");
  final _editTextController9 = TextEditingController(text: "");
  final _editTextController10 = TextEditingController(text: "");
  final _editTextController11 = TextEditingController(text: "");
  final _editTextController12 = TextEditingController(text: "");
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  underLineInput() {
    return UnderlineInputBorder(
      borderSide:
          BorderSide(color: Colors.transparent, width: screenHeight * 0.007),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      body: ModalProgressHUD(
        color: Colors.transparent,
        inAsyncCall: _isInAsyncCall,
        opacity: 0.9,
        progressIndicator: CircularProgressIndicator(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.92,
                  child: _uiFirstStepScreen(),
                ),
                Container(
                  height: screenHeight * 0.08,
                  color: MyColor.purpleColor.withOpacity(.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_editTextController1.text == "" ||
                              _editTextController2.text == "" ||
                              _editTextController3.text == "" ||
                              _editTextController4.text == "" ||
                              _editTextController5.text == "" ||
                              _editTextController6.text == "" ||
                              _editTextController7.text == "" ||
                              _editTextController8.text == "" ||
                              _editTextController9.text == "" ||
                              _editTextController10.text == "" ||
                              _editTextController11.text == "" ||
                              _editTextController12.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please fill all fields!! "),
                            ));
                          } else {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            phrases.add(_editTextController1.text);
                            phrases.add(_editTextController2.text);
                            phrases.add(_editTextController3.text);
                            phrases.add(_editTextController4.text);
                            phrases.add(_editTextController5.text);
                            phrases.add(_editTextController6.text);
                            phrases.add(_editTextController7.text);
                            phrases.add(_editTextController8.text);
                            phrases.add(_editTextController9.text);
                            phrases.add(_editTextController10.text);
                            phrases.add(_editTextController11.text);
                            phrases.add(_editTextController12.text);
                            print("Recovery Phrases  :::: $phrases");
                            setState(() {
                              _isInAsyncCall = true;
                            });
                            getRecover(phrases);
                          }
                        },
                        child: Container(
                          height: screenHeight * 0.08,
                          alignment: Alignment.center,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _uiFirstStepScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenHeight * 0.08,
        ),
        Container(
          margin: EdgeInsets.only(left: screenHeight * 0.04),
          child: Text(
            "Enter your recovery",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.04,
                      left: screenHeight * 0.02,
                      right: screenHeight * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.black.withOpacity(.2),
                              border: Border.all(
                                color: Colors.white38,
                                width: screenHeight * 0.002,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: _editTextController1,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                enabledBorder: underLineInput(),
                                focusedBorder: underLineInput(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.black.withOpacity(.2),
                              border: Border.all(
                                color: Colors.white38,
                                //                   <--- border color
                                width: screenHeight * 0.002,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: _editTextController2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                enabledBorder: underLineInput(),
                                focusedBorder: underLineInput(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      left: screenHeight * 0.02,
                      right: screenHeight * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.black.withOpacity(.2),
                              border: Border.all(
                                color: Colors.white38,
                                width: screenHeight * 0.002,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: _editTextController3,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                enabledBorder: underLineInput(),
                                focusedBorder: underLineInput(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.black.withOpacity(.2),
                              border: Border.all(
                                color: Colors.white38,
                                //                   <--- border color
                                width: screenHeight * 0.002,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: _editTextController4,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                enabledBorder: underLineInput(),
                                focusedBorder: underLineInput(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      left: screenHeight * 0.02,
                      right: screenHeight * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.black.withOpacity(.2),
                              border: Border.all(
                                color: Colors.white38,
                                width: screenHeight * 0.002,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: _editTextController5,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                enabledBorder: underLineInput(),
                                focusedBorder: underLineInput(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.black.withOpacity(.2),
                              border: Border.all(
                                color: Colors.white38,
                                //                   <--- border color
                                width: screenHeight * 0.002,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: _editTextController6,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                enabledBorder: underLineInput(),
                                focusedBorder: underLineInput(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      left: screenHeight * 0.02,
                      right: screenHeight * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.black.withOpacity(.2),
                              border: Border.all(
                                color: Colors.white38,
                                width: screenHeight * 0.002,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: _editTextController7,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                enabledBorder: underLineInput(),
                                focusedBorder: underLineInput(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.black.withOpacity(.2),
                              border: Border.all(
                                color: Colors.white38,
                                //                   <--- border color
                                width: screenHeight * 0.002,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: _editTextController8,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                enabledBorder: underLineInput(),
                                focusedBorder: underLineInput(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      left: screenHeight * 0.02,
                      right: screenHeight * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.black.withOpacity(.2),
                              border: Border.all(
                                color: Colors.white38,
                                width: screenHeight * 0.002,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: _editTextController9,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                enabledBorder: underLineInput(),
                                focusedBorder: underLineInput(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.black.withOpacity(.2),
                              border: Border.all(
                                color: Colors.white38,
                                //                   <--- border color
                                width: screenHeight * 0.002,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: _editTextController10,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                enabledBorder: underLineInput(),
                                focusedBorder: underLineInput(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      left: screenHeight * 0.02,
                      right: screenHeight * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.black.withOpacity(.2),
                              border: Border.all(
                                color: Colors.white38,
                                width: screenHeight * 0.002,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: _editTextController11,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                enabledBorder: underLineInput(),
                                focusedBorder: underLineInput(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.black.withOpacity(.2),
                              border: Border.all(
                                color: Colors.white38,
                                //                   <--- border color
                                width: screenHeight * 0.002,
                              ),
                            ),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: _editTextController12,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                enabledBorder: underLineInput(),
                                focusedBorder: underLineInput(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget getItem(String secertKey, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenHeight * 0.015),
        color: Colors.black.withOpacity(.2),
        border: Border.all(
          color: Colors.white38,
          //                   <--- border color
          width: screenHeight * 0.002,
        ),
      ),
      child: Text("Text"),
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

  Future<void> getRecover(List<String> phrases) async {
    var stringList = phrases.join(" ");
    print(stringList);
    var data = {
      "mnemonic": "$stringList",
    };
    var res = await ApiProvider().post(data, ApiPath.generatePrivateKey);
    Map body = json.decode(res.body);
    print("Response  $body");
    setState(() {
      _isInAsyncCall = false;
    });
    if (body.isNotEmpty) {
      String address = body["address"];
      String privateKey = body["privateKey"];

      print("SeedAddress :: " + address);
      print("SeedPrivateKey :: " + privateKey);
      storeData(address, privateKey);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${body.toString()}"),
      ));
    }
  }

  Future<void> storeData(String address, String privateKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("address", address);
    prefs.setString("privateKey", privateKey);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NavigationScreen()));
  }
}
