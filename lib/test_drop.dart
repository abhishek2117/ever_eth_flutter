import 'package:ever_eth_flutter/Demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:line_icons/line_icons.dart';

import 'Demo_.dart';

class DropDemo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth Page Indicator Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Example(),
    );
  }
}

class Example extends StatelessWidget {
  String selectval = "United Kingdom";

  @override
  Widget build(BuildContext context) {
    double itemsHeight = 30;

    Widget getTextField({String hint = 'Ingredients', Widget? suffix}) {
      // use Container to define the size of the child,
      // and reset the original inner paddings!
      return Container(
        height: itemsHeight,
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.white, width: 1)),
            hintText: hint,
            contentPadding: EdgeInsets.all(
                0), // change each value, and set 0 remainding ones.
            suffixIcon: suffix,
          ),
          expands: false,
          maxLines: 1,
          controller: TextEditingController(),
        ),
      );
    }
    return Scaffold(
      body: Container(
        color: Colors.green.withOpacity(.2),
        margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: getTextField(
                  hint: 'Ingredients',
                  suffix: Icon(
                    Icons.add,
                    size:
                    18, // option 1: reduce the size of the icon, and avoid the padding issues..
                  )),
            ),

            Flexible(
              flex: 1,
              child: getTextField(
                  hint: 'Qty',
                  // option2: trick to match the expanded height of the icon on the previous field
                  // make an icon transparent :)
                  suffix: Icon(
                    Icons.account_box,
                    color: Colors.transparent,
                  )),
            ),

            Flexible(
              flex: 1,
              child: getTextField(
                  hint: 'Qty',
                  // option2: trick to match the expanded height of the icon on the previous field
                  // make an icon transparent :)
                  suffix: Icon(
                    Icons.account_box,
                    color: Colors.transparent,
                  )),
            ),
          ],
        ),
        ),
    );
  }
}