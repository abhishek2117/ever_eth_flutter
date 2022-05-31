import 'dart:convert';

import 'package:ever_eth_flutter/Api/api_path.dart';
import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/sharedPreferences/shared_preferences_util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Api/Api.dart';
import 'EncryptData.dart';
import 'navigation_screen.dart';

class PageViewPasswordScreen extends StatefulWidget {
  List<String>? phrases;

  PageViewPasswordScreen(this.phrases, {Key? key}) : super(key: key);

  @override
  _PageViewPasswordScreenState createState() => _PageViewPasswordScreenState();
}

class _PageViewPasswordScreenState extends State<PageViewPasswordScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  bool _obscureText = true;
  final _passwordTextController = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String? password;
  List<String> phrasesOrgData = [];

  underLineInput() {
    return UnderlineInputBorder(
      borderSide:
          BorderSide(color: Colors.transparent, width: screenHeight * 0.007),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.phrases);
    decryptPasswordAndGet();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.92,
                child: _uiConfirmPasswordScreen(),
              ),
              Container(
                height: screenHeight * 0.08,
                color: MyColor.purpleColor.withOpacity(.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          if (_passwordTextController.text ==
                              "${EncryptData.decrypted != null ? EncryptData.decrypted : ''}") {
                            compareSeedPhrase(widget.phrases);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please enter correct password!! "),
                            ));
                          }
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
    );
  }

  Future<void> compareSeedPhrase(List<String>? phrases) async {
    var stringList = phrases!.join(" ");
    print(stringList);
    var data = {
      "mnemonic": "$stringList",
    };
    var res = await ApiProvider().post(data, ApiPath.generatePrivateKey);
    Map body = json.decode(res.body);
    print("Response  $body");
    if (body.isNotEmpty) {
      String address = body["address"];
      String privateKey = body["privateKey"];

      print("SeedAddress :: " + address);
      print("SeedPrivateKey :: " + privateKey);
      storeData(address, privateKey);
    }
  }

  Widget _uiConfirmPasswordScreen() {
    return Column(
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
            "Enter your",
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
            "Password",
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
            child: Container(
              margin: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenHeight * 0.04,
                  right: screenHeight * 0.04),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Container(
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
                        controller: _passwordTextController,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          password = value;
                          if (value.toString().length == 0) {
                            return "Password is required";
                          } else if (value.toString().length < 8) {
                            return "Please enter atleast 8 characters";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          enabledBorder: underLineInput(),
                          focusedBorder: underLineInput(),
                          /*suffixIconConstraints: BoxConstraints(
                                maxHeight: screenHeight * 0.02,
                                maxWidth: screenHeight * 0.02,
                                minHeight: screenHeight * 0.02,
                                minWidth: screenHeight * 0.02,
                              ),*/
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility_off,
                              semanticLabel: _obscureText
                                  ? 'show password'
                                  : 'hide password',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: screenHeight * 0.025),
                      child: Text(
                        "While passwords are stored on the cloud, data ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.018,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.001,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: screenHeight * 0.025),
                      child: Text(
                        "from your fingerprint is stored solely on your device",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.018,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> decryptPasswordAndGet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("password"));
    setState(() {
      EncryptData.decryptAES("${prefs.getString("password")}");
      print(
          "DecryptText : ${EncryptData.decrypted != null ? EncryptData.decrypted : ''}");
    });
  }

  Future<void> storeData(String address, String privateKey) async {
    SharedPreferences prefs =
        await SharedPreferencesUtil.getSharedPreferences();
    prefs.setString("address", address);
    prefs.setString("privateKey", privateKey);
    prefs.setString("IsLogin", "1");
    print(prefs.getString("IsLogin") ?? "0");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NavigationScreen()));
  }
}
