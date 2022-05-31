import 'package:ever_eth_flutter/sharedPreferences/shared_preferences_util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'costom_color.dart';
import 'navigation_screen.dart';

class PasswordScreen extends StatefulWidget {
 
    PasswordScreen({Key? key ,}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  bool _obscureText = true;
  String? _password;
  
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _passwordTextController = TextEditingController();

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
    getWalletPassword();
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
              height: screenHeight * 0.06,
            ),
            Center(
              child: Image.asset(
                'assets/images/eth.png',
                height: screenHeight * 0.15,
                width: screenWidth * 0.15,
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
                  fontSize: screenHeight * 0.04,
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
                  fontSize: screenHeight * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Expanded(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
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
                              obscureText: _obscureText,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              controller: _passwordTextController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password is required";
                                } else if (value != _password) {
                                  return "Password not matched";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter Password',
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
                          SizedBox(
                            height: screenHeight * 0.05,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("%%%%%%%%");
                              if(_passwordTextController.text.isEmpty){}
                              else{
                            
                                setLgin();
                              }
                              // if (_formKey.currentState!.validate()) {
                              //   FocusScope.of(context)
                              //       .requestFocus(FocusNode());
                              //   setState(() {
                              //     setLgin();
                              //   });
                              // }
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: screenWidth * 1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      screenHeight * 0.02),
                                  color: MyColor.purpleColor.withOpacity(.8),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(screenHeight * 0.023),
                                  child: Text(
                                    "Next",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.022,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getWalletPassword() async {
    SharedPreferences preferences =
        await SharedPreferencesUtil.getSharedPreferences();
    _password = preferences.getString("decrepted_password");
    print(_password);
  }

  Future<void> setLgin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  print("|||||||||||||||||||||||||||||||||" +_password.toString() );
    if(_passwordTextController.text==_password){
          prefs.setString("IsLogin", "1");
          print("|||||||||||||||||||||||||||||||||");
              Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NavigationScreen()));
    }
    print(prefs.getString("IsLogin") ?? "0");

  }
}
