import 'package:flutter/material.dart';

import 'costom_color.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(null),
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.03,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
           IconButton(
            icon: Icon(
              Icons.search_rounded,
              size: screenHeight * 0.04,
            ),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Container(
              margin: EdgeInsets.only(left:screenHeight*0.025,right: screenHeight*0.025),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    MyColor.gradientColor1.withOpacity(.15),
                    MyColor.gradientColor1.withOpacity(.1),
                    MyColor.gradientColor1.withOpacity(.05),
                  ],
                  begin: Alignment.topCenter, //begin of the gradient color
                  end: Alignment.bottomCenter, //end of the gradient color
                ),
                borderRadius: BorderRadius.circular(
                    screenHeight * 0.03), //border corner radius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "Oct 02 2021",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "-\$43,40",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02),
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * .01),
                      child: Text(
                        "fnwlnwk924298yrgfhgwsnfg782yo39u01uhr2hbfuv29",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.016,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(left:screenHeight*0.025,right: screenHeight*0.025),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    MyColor.gradientColor1.withOpacity(.15),
                    MyColor.gradientColor1.withOpacity(.1),
                    MyColor.gradientColor1.withOpacity(.05),
                  ],
                  begin: Alignment.topCenter, //begin of the gradient color
                  end: Alignment.bottomCenter, //end of the gradient color
                ),
                borderRadius: BorderRadius.circular(
                    screenHeight * 0.03), //border corner radius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "Oct 02 2021",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "-\$43,40",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02),
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * .01),
                      child: Text(
                        "fnwlnwk924298yrgfhgwsnfg782yo39u01uhr2hbfuv29",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.016,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(left:screenHeight*0.025,right: screenHeight*0.025),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    MyColor.gradientColor1.withOpacity(.15),
                    MyColor.gradientColor1.withOpacity(.1),
                    MyColor.gradientColor1.withOpacity(.05),
                  ],
                  begin: Alignment.topCenter, //begin of the gradient color
                  end: Alignment.bottomCenter, //end of the gradient color
                ),
                borderRadius: BorderRadius.circular(
                    screenHeight * 0.03), //border corner radius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "Oct 02 2021",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "-\$43,40",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02),
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * .01),
                      child: Text(
                        "fnwlnwk924298yrgfhgwsnfg782yo39u01uhr2hbfuv29",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.016,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(left:screenHeight*0.025,right: screenHeight*0.025),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    MyColor.gradientColor1.withOpacity(.15),
                    MyColor.gradientColor1.withOpacity(.1),
                    MyColor.gradientColor1.withOpacity(.05),
                  ],
                  begin: Alignment.topCenter, //begin of the gradient color
                  end: Alignment.bottomCenter, //end of the gradient color
                ),
                borderRadius: BorderRadius.circular(
                    screenHeight * 0.03), //border corner radius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "Oct 02 2021",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "-\$43,40",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02),
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * .01),
                      child: Text(
                        "fnwlnwk924298yrgfhgwsnfg782yo39u01uhr2hbfuv29",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.016,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(left:screenHeight*0.025,right: screenHeight*0.025),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    MyColor.gradientColor1.withOpacity(.15),
                    MyColor.gradientColor1.withOpacity(.1),
                    MyColor.gradientColor1.withOpacity(.05),
                  ],
                  begin: Alignment.topCenter, //begin of the gradient color
                  end: Alignment.bottomCenter, //end of the gradient color
                ),
                borderRadius: BorderRadius.circular(
                    screenHeight * 0.03), //border corner radius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "Oct 02 2021",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "-\$43,40",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02),
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * .01),
                      child: Text(
                        "fnwlnwk924298yrgfhgwsnfg782yo39u01uhr2hbfuv29",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.016,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(left:screenHeight*0.025,right: screenHeight*0.025),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    MyColor.gradientColor1.withOpacity(.15),
                    MyColor.gradientColor1.withOpacity(.1),
                    MyColor.gradientColor1.withOpacity(.05),
                  ],
                  begin: Alignment.topCenter, //begin of the gradient color
                  end: Alignment.bottomCenter, //end of the gradient color
                ),
                borderRadius: BorderRadius.circular(
                    screenHeight * 0.03), //border corner radius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "Oct 02 2021",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "-\$43,40",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02),
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * .01),
                      child: Text(
                        "fnwlnwk924298yrgfhgwsnfg782yo39u01uhr2hbfuv29",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.016,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
