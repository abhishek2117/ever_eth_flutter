import 'package:ever_eth_flutter/costom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  var _switchValue = false;
  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  underLineInput() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: screenHeight * 0.007),
    );
  }
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Change Password",
            style: TextStyle(
              color: Colors.white,
              fontSize: screenHeight * 0.03,
              fontWeight: FontWeight.w400,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
        backgroundColor: MyColor.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: screenHeight * 0.05,
                    left: screenHeight * 0.04,
                    right: screenHeight * 0.04),
                child: Column(
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
                          color: Colors.white38, //                   <--- border color
                          width: screenHeight* 0.002,
                        ),
                      ),
                      child: TextFormField(
                        autofocus: false,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: 'New Password',
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
                      margin: EdgeInsets.only(left: screenHeight * 0.01,right: screenHeight * 0.01),
                      child: Text(
                        "*Must be at least 8 characters, 1 Special Character,\n1 Capital Character, 1 Number",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.017,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.1,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(screenHeight * 0.015),
                        color: Colors.black.withOpacity(.2),
                        border: Border.all(
                          color: Colors.white38, //                   <--- border color
                          width: screenHeight* 0.002,
                        ),
                      ),
                      child: TextFormField(
                        autofocus: false,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.text,
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
                      height: screenHeight * 0.1,
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: screenHeight * 0.015, right: screenHeight * 0.015),
                        height: screenHeight * 0.06,
                        /*decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.white38.withOpacity(.2),
                                width: screenHeight * 0.001,
                                style: BorderStyle.solid),
                          ),
                        ),*/
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sign in with Face ID?',
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
                    SizedBox(
                      height: screenHeight * 0.1,
                    ),
                    InkWell(
                      onTap: () {
                        print("Change Password");
                      },
                      child: Container(
                        height: screenHeight * 0.08,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(screenHeight * 0.03),
                          gradient: LinearGradient(
                            colors: [
                              MyColor.purpleColor.withOpacity(.3),
                              MyColor.purpleColor.withOpacity(.3),
                              MyColor.purpleColor.withOpacity(.3),
                              MyColor.purpleColor.withOpacity(.3),
                              MyColor.purpleColor.withOpacity(0),
                            ],
                            /*stops: [0.6,0.8,],*/
                            begin: Alignment.topLeft, //begin of the gradient color
                            end: Alignment.topRight, //end of the gradient color
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.022,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
