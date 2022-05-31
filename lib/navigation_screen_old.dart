import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/security_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  Widget generalOpt(String optName) {
    return Padding(
      padding: EdgeInsets.only(left:screenHeight * 0.015,right: screenHeight * 0.015,top: screenHeight * 0.010),
      child: Container(
        margin: EdgeInsets.only(
            left: screenHeight * 0.015,
            right: screenHeight * 0.015),
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

  Widget generalOptNoBorder(String optName) {
    return Padding(
      padding: EdgeInsets.only(left:screenHeight * 0.015,right: screenHeight * 0.015,top: screenHeight * 0.010),
      child: Container(
        margin: EdgeInsets.only(
            left: screenHeight * 0.015,
            right: screenHeight * 0.015),
        height: screenHeight * 0.06,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: Colors.transparent,
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

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.primaryColor,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.menu_outlined),
              onPressed: () => Navigator.of(context).pop(null),
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.notifications_none),
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
                        padding: EdgeInsets.only(left:screenHeight * 0.015,right: screenHeight * 0.015,top: screenHeight * 0.010),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: screenHeight * 0.015,
                              right: screenHeight * 0.015),
                          child: Text(
                            "General",
                            style: TextStyle(
                              color: Colors.white.withOpacity(.5),
                              fontSize: screenHeight * 0.025,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("Notifications");
                        },
                        child: generalOpt("Notifications"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SecurityScreen()));
                          print("Security");
                        },
                        child: generalOpt("Security"),
                      ),
                      InkWell(
                        onTap: () {
                          print("");
                        },
                        child: generalOpt("Support"),
                      ),
                      InkWell(
                        onTap: () {
                          print("");
                        },
                        child: generalOpt("2FA"),
                      ),
                      InkWell(
                        onTap: () {
                          print("");
                        },
                        child: generalOptNoBorder("Help"),
                      ),

                    ],
                  ),
                ),
              ),

              Card(
                elevation: 10,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(screenHeight * 0.02),
                  width: screenWidth,
                  height: screenHeight * 0.21,
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
                        padding: EdgeInsets.only(left:screenHeight * 0.015,right: screenHeight * 0.015,top: screenHeight * 0.010),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: screenHeight * 0.015,
                              right: screenHeight * 0.015),
                          child: Text(
                            "Account",
                            style: TextStyle(
                              color: Colors.white.withOpacity(.5),
                              fontSize: screenHeight * 0.025,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("");
                        },
                        child: generalOpt("User Profile"),
                      ),
                      InkWell(
                        onTap: () {
                          print("");
                        },
                        child: generalOptNoBorder("Change PIN-Code"),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(screenHeight * 0.02),
                  width: screenWidth,
                  height: screenHeight * 0.08,
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
                      InkWell(
                        onTap: () {
                          print("");
                        },
                        child: generalOptNoBorder("Logout"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }

}
