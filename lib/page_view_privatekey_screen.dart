import 'dart:convert';

import 'package:ever_eth_flutter/Api/api_path.dart';
import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/import_wallet_pass_create_screen.dart';
import 'package:ever_eth_flutter/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Api/Api.dart';

class PageViewPrivateKeyScreen extends StatefulWidget {
  const PageViewPrivateKeyScreen({Key? key}) : super(key: key);

  @override
  _PageViewPrivateKeyScreenState createState() =>
      _PageViewPrivateKeyScreenState();
}

class _PageViewPrivateKeyScreenState extends State<PageViewPrivateKeyScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  final _passwordTextController = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String? password;
  bool _obscureText = true;
  bool _isInAsyncCall = false;

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
    getPvtKey();
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
                  child: _uiImportPrivateKeyScreen(),
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
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            setState(() {
                              _isInAsyncCall = true;
                            });
                            if(_passwordTextController.text.isNotEmpty){
                                 getAddress(_passwordTextController.text);
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
      ),
    );
  }

  Future<void> getPvtKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("privateKey"));
    if (prefs.getString("privateKey") != null) {
      _passwordTextController.text =
          prefs.getString("privateKey") ?? 'null apear';
    }
  }

  Widget _uiImportPrivateKeyScreen() {
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
            "Private Key",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenHeight * 0.015),
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
                          return "Private Key is required";
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
                        hintText: 'Private Key',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
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
                                ? Icons.visibility_off
                                : Icons.remove_red_eye_outlined,
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
                    margin: EdgeInsets.only(left: screenHeight * 0.04),
                    child: Text(
                      "Your private key is on the computer or server ",
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
                    margin: EdgeInsets.only(left: screenHeight * 0.04),
                    child: Text(
                      "where you generated the key pair and CSR.",
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
      ],
    );
  }

  Future<void> getAddress(String text) async {
    var data = {
      "private_key": text,
    };

    var res = await ApiProvider().post(data, ApiPath.importPrivateKey);
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
    }
  }

  Future<void> storeData(String address, String privateKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("address", address);
    prefs.setString("privateKey", privateKey);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ImportWalletPassCreateScreen()));
  }
}
