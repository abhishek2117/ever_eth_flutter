import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/page_view_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'EncryptData.dart';

class PageViewImportScreen extends StatefulWidget {
  List<String> phrases;
  PageViewImportScreen(this.phrases, {Key? key}) : super(key: key);

  @override
  _PageViewImportScreenState createState() => _PageViewImportScreenState();
}

class _PageViewImportScreenState extends State<PageViewImportScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  bool _obscureText = true;
  final _passwordTextController = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String? password;

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
                child: _uiCreateWalletScreen(),
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
                          print('Prehapssss ${widget.phrases}');
                          FocusScope.of(context).requestFocus(FocusNode());
                          encryptPasswordAndStore(_passwordTextController.text);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PageViewPasswordScreen(widget.phrases)));
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

  _uiCreateWalletScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            child: SingleChildScrollView(
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
                        /*inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@\$!%*?&])[A-Za-z\d@\$!%*?&]{8,}\$")),
                            ],*/
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
                      height: screenHeight * 0.05,
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

  Future<void> encryptPasswordAndStore(String text) async {
    setState(() {
      EncryptData.encryptAES(text);
    });
    print(
        "EncryptText : ${EncryptData.encrypted != null ? EncryptData.encrypted?.base64 : ''}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("password",
        "${EncryptData.encrypted != null ? EncryptData.encrypted?.base64 : ''}");
    prefs.setString("decrepted_password",text);    
  }
}
