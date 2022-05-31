import 'package:flutter/material.dart';

import 'costom_color.dart';

class ImportWalletScreen extends StatefulWidget {

  @override
  _ImportWalletScreenState createState() => _ImportWalletScreenState();
}

class _ImportWalletScreenState extends State<ImportWalletScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  bool _obscureText = true;

  underLineInput() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: screenHeight * 0.007),
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
                "Import your",
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.white,
                          ),
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
