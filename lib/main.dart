import 'package:ever_eth_flutter/navigation_screen.dart';
import 'package:ever_eth_flutter/page_view_create_wallet_password_screen.dart';
import 'package:ever_eth_flutter/page_view_screen.dart';
import 'package:ever_eth_flutter/page_view_wallet_screen_old.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common_methods/shared_pref.dart';
import 'enterpassword_screen/enter_password_screen.dart';
import 'import_wallet_pass_create_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var isLogin = await getLogin();
  var privateKey = await CommonSharePref.getData('privateKey');
  var password = await CommonSharePref.getData('password');
  runApp(Example(isLogin: isLogin, p_key: privateKey, pass: password));
}

getLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // setState(() {
  var isLogin = prefs.getString("IsLogin") ?? "0";
  // });
  print(isLogin);
  return isLogin;
}

class Example extends StatefulWidget {
  String? isLogin;
  String? pass;
  String? p_key;
  Example(
      {Key? key,
      required this.isLogin,
      required this.p_key,
      required this.pass})
      : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  String _isLogin = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Main Init Call");
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'EverETH',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Builder(builder: (context) {
          if (widget.isLogin == '0') {
            return PageViewScreen();
          } else if (widget.isLogin == '1' && widget.pass != null) {
            return EnterpasswordScreen();
          } else if (widget.isLogin == '1' && widget.p_key != null) {
            return NavigationScreen();
          }else{
            return PageViewScreen();
          }
        })

        //  _isLogin == "1" ? EnterpasswordScreen() : PageViewScreen(),
        );
  }
}
