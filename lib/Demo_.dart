import 'package:ever_eth_flutter/costom_color.dart';
import 'package:flutter/material.dart';

class DemoS extends StatefulWidget {
  const DemoS({Key? key}) : super(key: key);

  @override
  _DemoSState createState() => _DemoSState();
}

class _DemoSState extends State<DemoS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.navItemColor,
    );
  }
}
