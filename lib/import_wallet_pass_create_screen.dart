import 'package:ever_eth_flutter/password_screen.dart';
import 'package:ever_eth_flutter/sharedPreferences/shared_preferences_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/custom_colors.dart';
import 'costom_color.dart';

class ImportWalletPassCreateScreen extends StatefulWidget {
  const ImportWalletPassCreateScreen({Key? key}) : super(key: key);

  @override
  _ImportWalletPassCreateScreenState createState() =>
      _ImportWalletPassCreateScreenState();
}

class _ImportWalletPassCreateScreenState
    extends State<ImportWalletPassCreateScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  bool _obscureText = true;
  bool isPwdShown = true;
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
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Container(
              margin: EdgeInsets.only(left: screenHeight * 0.04),
              child: Text(
                "Create your",
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
                "Wallet",
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
                "Keep your passwords private",
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
                "& never share a password with",
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
                "anyone else",
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
            Flexible(
              fit: FlexFit.loose,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
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
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Enter Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.028,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              /*Image.asset(
                                  'assets/images/show.png',
                                  color: Colors.white,
                                  height: screenHeight * 0.04,
                                  width: screenHeight * 0.04,
                                )*/
                              /*Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.white,
                                ),*/
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.06,
                          ),
                          Text(
                            "•  At least 8 characters—the more characters, the better",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.017,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.006,
                          ),
                          Text(
                            "•   A mixture of both uppercase and lowercase letters",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.017,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.006,
                          ),
                          Text(
                            "•    A mixture of letters and numbers",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.017,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.006,
                          ),
                          Text(
                            "•    Inclusion of at least one special character, e.g., ! @ # ? ]",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.017,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.06,
                          ),
                          Container(
                            child: TextFormField(
                              autofocus: false,
                              obscureText: _obscureText,
                              onChanged: (val){
                                print("&&&&&&&&&&&&&&&&&&&"+ val);
                              },
                              keyboardType: TextInputType.text,
                              enableIMEPersonalizedLearning: true,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: screenHeight * 0.02,
                              ),
                              controller: _passwordTextController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password is required";
                                } else if (!validateMyInput(value)) {
                                  return "Please enter valid password";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                /*hintText: 'Enter Password',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.02,
                                    fontWeight: FontWeight.w500,
                                  ),*/
                                labelText: 'Enter Password',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white38,
                                  fontSize: screenHeight * 0.019,
                                ),
                                floatingLabelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white38,
                                  fontSize: screenHeight * 0.019,
                                ),
                                // hintText: hint,
                                // hintStyle: GoogleFonts.poppins(
                                //   fontWeight: FontWeight.w500,
                                //   color: Colors.grey,
                                //   fontSize: _height * 0.019,
                                // ),
                                alignLabelWithHint: true,
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
                                    size: screenHeight * 0.025,
                                  ),
                                ),
                                /*CupertinoButton(
                                    minSize: 0,
                                    padding: EdgeInsets.zero,
                                    borderRadius:
                                        BorderRadius.circular(screenWidth),
                                    child: Icon(
                                      _obscureText
                                          ? CupertinoIcons.eye_slash
                                          : CupertinoIcons.eye,
                                      color: Colors.white,
                                      size: screenHeight * 0.025,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),*/

                                border: _buildTextFieldBorder(),
                                disabledBorder: _buildTextFieldBorder(),
                                enabledBorder: _buildTextFieldBorder(),
                                focusedBorder: _buildTextFieldBorder(),
                                errorBorder: _buildTextFieldBorder(Colors.red),
                                focusedErrorBorder:
                                    _buildTextFieldBorder(Colors.red),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.017,
                                  horizontal: screenWidth * 0.06,
                                ),
                              ),
                            ),

                            /*TextFormField(
                                autofocus: false,
                                obscureText: _obscureText,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w400,
                                ),
                                */ /*inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@\$!%*?&])[A-Za-z\d@\$!%*?&]{8,}\$")),
                                ],*/ /*
                                decoration: InputDecoration(
                                  hintText: 'Enter Password',
                                  hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                  enabledBorder: underLineInput(),
                                  focusedBorder: underLineInput(),
                                  */ /*suffixIconConstraints: BoxConstraints(
                                    maxHeight: screenHeight * 0.02,
                                    maxWidth: screenHeight * 0.02,
                                    minHeight: screenHeight * 0.02,
                                    minWidth: screenHeight * 0.02,
                                  ),*/ /*
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
                              ),*/
                          ),
                          SizedBox(
                            height: screenHeight * 0.05,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                storePassword(
                                    _passwordTextController.text.trim());
                              }
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

  bool validateMyInput(String value) {
    RegExp regExp = RegExp(
        r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d][A-Za-z\d!@#$%^&*()_+]{7,20}$');
    if (regExp.hasMatch(value)) {
      print("Valid");
      return true;
    } else {
      print("InValid");
      return false;
    }
  }

  OutlineInputBorder _buildTextFieldBorder([Color? color]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.035),
        borderSide: BorderSide(
          color: color ?? Colors.white38,
          width: screenWidth * 0.0035,
        ),
      );

  Future<void> storePassword(String pass) async {
    SharedPreferences preferences =
        await SharedPreferencesUtil.getSharedPreferences();
    preferences.setString("password", pass);
  var showpassword =  preferences.setString("decrepted_password", pass);
  Get.to(()=>PasswordScreen(),arguments:showpassword );
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => PasswordScreen(pass:_passwordTextController.text)));
  }
}


