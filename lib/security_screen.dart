// ignore_for_file: prefer_const_constructors

import 'package:ever_eth_flutter/common_methods/shared_pref.dart';
import 'package:ever_eth_flutter/costom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'change_password_screen.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  _SecurityScreenState createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  int _selectedIndex = 0;
  double screenWidth = 0;
  double screenHeight = 0;
  TextEditingController _textFieldController = TextEditingController();
  var _switchValue = false;
  bool _validate = false;
  bool isShow = false;
  String p_key = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget securityOptWithSwitch(String optName) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenHeight * 0.015,
          right: screenHeight * 0.015,
          top: screenHeight * 0.010),
      child: Container(
        margin: EdgeInsets.only(
            left: screenHeight * 0.015, right: screenHeight * 0.015),
        height: screenHeight * 0.06,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: Colors.white38.withOpacity(.2),
                width: screenHeight * 0.001,
                style: BorderStyle.solid),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              optName,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight * 0.022,
                fontWeight: FontWeight.w400,
              ),
            ),
            Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                activeColor: Colors.blue,
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget securityOpt(String optName) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenHeight * 0.015,
          right: screenHeight * 0.015,
          top: screenHeight * 0.010),
      child: Container(
        margin: EdgeInsets.only(
            left: screenHeight * 0.015, right: screenHeight * 0.015),
        height: screenHeight * 0.06,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: Colors.white38.withOpacity(.2),
                width: screenHeight * 0.001,
                style: BorderStyle.solid),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              optName,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight * 0.022,
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white38.withOpacity(.2),
              size: screenHeight * 0.025,
            )
          ],
        ),
      ),
    );
  }

  Widget securityOptNoBorder(
      String optName, String reveal, Color transparentOpt, bool isTrue) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenHeight * 0.015,
          right: screenHeight * 0.015,
          top: screenHeight * 0.010),
      child: Container(
        margin: EdgeInsets.only(
            left: screenHeight * 0.015, right: screenHeight * 0.015),
        height: screenHeight * 0.06,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: transparentOpt,
                width: screenHeight * 0.001,
                style: BorderStyle.solid),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              optName,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight * 0.022,
                fontWeight: FontWeight.w400,
              ),
            ),
            isTrue
                ? Container()
                : Container(
                    height: screenHeight * 0.04,
                    width: screenWidth * 0.22,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenHeight * 0.03),
                      color: MyColor.navItemColor.withOpacity(.2),
                    ),
                    child: Text(
                      reveal,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.022,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.primaryColor,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.01),
              child: Container(
                margin: EdgeInsets.only(right: screenHeight * 0.02),
                child: ImageIcon(
                  AssetImage(
                    'assets/images/menu.png',
                  ),
                  size: screenHeight * 0.03,
                ),
              ),
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
        backgroundColor: MyColor.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 10,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(screenHeight * 0.02),
                  width: screenWidth,
                  height: screenHeight * 0.41,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                      colors: [
                        MyColor.gradientColor2.withOpacity(0),
                        MyColor.gradientColor1.withOpacity(.15),
                      ],
                      begin: Alignment.topCenter, //begin of the gradient color
                      end: Alignment.bottomCenter, //end of the gradient color
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenHeight * 0.015,
                            right: screenHeight * 0.015,
                            top: screenHeight * 0.010),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: screenHeight * 0.015,
                              right: screenHeight * 0.015),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white38.withOpacity(.5),
                                size: screenHeight * 0.025,
                              ),
                              Text(
                                "Security",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.5),
                                  fontSize: screenHeight * 0.025,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {},
                      //   child: securityOptWithSwitch("Require Device Passcode"),
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     print("Security");
                      //   },
                      //   child: securityOptWithSwitch(
                      //       "Enable Google Autherticator"),
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) => ChangePasswordScreen()));
                      //   },
                      //   child: securityOpt("Change Password"),
                      // ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: isShow
                            ? null
                            : () {
                                setState(() {
                                  _validate = false;
                                  _textFieldController.clear();
                                });
                                myDialog();
                                print("");
                              },
                        child: securityOptNoBorder("Private Key", "Reveal",
                            Colors.white38.withOpacity(.2), isShow),
                      ),

                      isShow
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: Text(
                                p_key,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          : Container(),
                      if (isShow)
                        Center(
                            child: _buildButtonColumn(MyColor.navItemColor,
                                Icons.copy, 'Copy', p_key))
                      else
                        Container(),
                      // InkWell(
                      //   onTap: () {
                      //     print("");
                      //   },
                      //   child: securityOptNoBorder(
                      //       "Passphrase", "Reveal", Colors.transparent, false),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _buildButtonColumn(Color color, IconData icon, String label, key) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: key)).then((value) {
          Get.showSnackbar(
            GetSnackBar(
              duration: Duration(seconds: 2),
              messageText: Text(
                "Copied",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
        });
      },
      child: Column(
        children: [
          Container(
            height: screenHeight * 0.05,
            width: screenWidth * 0.1,
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

  myDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setstate) {
            return AlertDialog(
              actions: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  color: MyColor.primaryColor,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4)),
                  textColor: Colors.white,
                  child: Text('Submit'),
                  onPressed: () {
                    // setState(() {
                    //  codeDialog = valueText;

                    _submit(setstate);
                  },
                ),
              ],
              title: Text('Enter Password'),
              content: TextField(
                controller: _textFieldController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  errorText: _validate ? _errorText : null,
                ),
              ),
            );
          });
        });
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text

    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (_textFieldController.text.isEmpty) {
      return 'Enter password';
    }

    // return null if the text is valid
    return null;
  }

  getkey() async {
    var pass = await CommonSharePref.getData('decrepted_password');
    print('////////////////////////' + pass.toString());
    if (pass == _textFieldController.text) {
      p_key = await CommonSharePref.getData('privateKey');
      print('KEYYYYvvvvvvvvvvvvvvvvvv' + p_key.toString());
      isShow = true;

      setState(() {});
    } else {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.red,
          message: 'Wrong password',
          messageText: Text("Wrong passsword",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _submit(setstate) async {
    setstate(() {});
    print('EEEEEEEEEEEEEEEEEE' + _errorText.toString());
    _validate = true;

    // if there is no error text
    if (_errorText == null) {
      await getkey();

      Navigator.pop(context);
      // notify the parent widget via the onSubmit callback

    }
  }
}
