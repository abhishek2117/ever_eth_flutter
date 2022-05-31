// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:ever_eth_flutter/calculator_input.dart';
import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/gainers_loser_screen.dart';
import 'package:ever_eth_flutter/reflection_screen.dart';
import 'package:ever_eth_flutter/setting_screen.dart';
import 'package:ever_eth_flutter/swap_screen.dart';
import 'package:ever_eth_flutter/wallet_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'dashboard_screen/dashBoard_Screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static List<Widget> _widgetOptions = <Widget>[
    DashBoardScreen(),
    // ignore: prefer_const_constructors
    SwapScreen(),
    WalletScreen(),
    SettingScreen(),
    GainersLooserScreen(),
    CalculatorInput(),
    ReflectionScreen()
  ];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Container(
            color: MyColor.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: MyColor.navItemColor,
              tabBorderRadius: screenHeight * 0.015,
              color: MyColor.navItemColor,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.swap_horiz,
                  text: 'Swap',
                ),
                GButton(
                  icon: Icons.account_balance_wallet_outlined,
                  text: 'Wallet',
                ),
                GButton(
                  icon: Icons.settings_outlined,
                  text: 'Setting',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
