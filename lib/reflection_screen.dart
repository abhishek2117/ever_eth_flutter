import 'package:ever_eth_flutter/receive_crypto_screen.dart';
import 'package:ever_eth_flutter/send_crypto_screen.dart';
import 'package:flutter/material.dart';
import 'costom_color.dart';

class ReflectionScreen extends StatefulWidget {
  const ReflectionScreen({Key? key}) : super(key: key);

  @override
  _ReflectionScreenState createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends State<ReflectionScreen> {
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
        elevation: 8,
        /*actions: [
          Padding(
            padding: EdgeInsets.all(screenHeight*0.01),
            child: Container(
              margin: EdgeInsets.only(right: screenHeight*0.02),
              child: ImageIcon(
                AssetImage('assets/images/menu.png',),
                size: screenHeight*0.03,
              ),
            ),
          ),
        ],
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: screenWidth * 0.03,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: screenHeight * 0.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenHeight * 0.03),
                    color: MyColor.navItemColor.withOpacity(.2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight * 0.012),
                    child: Text(
                      "Token",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.018,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight * 0.012),
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.018,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight * 0.012),
                    child: Text(
                      "Reflection",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.018,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),*/
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
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

                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(screenHeight * 0.06),
                  bottomLeft: Radius.circular(screenHeight * 0.06),
                ), //border corner radius
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenHeight * .006),
                    child: Text(
                      "My Tokens",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.06,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: screenHeight * 0.005,
                      ),
                      SizedBox(
                        width: screenWidth * 0.01,
                      ),
                      Text(
                        "Smart Chain BEP - 20",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.5),
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white.withOpacity(.5),
                        size: screenHeight * 0.025,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SendCryptoScreen()));
                        },
                        child: _buildButtonColumn(MyColor.navItemColor,
                            'assets/images/send.png', 'Send'),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ReceiveCryptoScreen()));
                        },
                        child: _buildButtonColumn(MyColor.navItemColor,
                            'assets/images/receive.png', 'Recieve'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                ],
              ),
            ),
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
                            "Ethereum",
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
                            "Balance",
                            style: TextStyle(
                              color: MyColor.yellowColor,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .002),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/eth_small.png',
                                height: 20,
                                width: 20,
                              ),
                              Text(
                                " \$4,112",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.022,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "+12.90(20%)",
                            style: TextStyle(
                              color: MyColor.yellowColor,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
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
                            "Ethereum",
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
                            "Balance",
                            style: TextStyle(
                              color: MyColor.yellowColor,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .002),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/eth_small.png',
                                height: 20,
                                width: 20,
                              ),
                              Text(
                                " \$518.1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.022,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenHeight * .01),
                          child: Text(
                            "+12.90(20%)",
                            style: TextStyle(
                              color: MyColor.yellowColor,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildButtonColumn(Color color, String imgPath, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(screenHeight * 0.025),
            child: Image.asset(
              imgPath,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: screenHeight*0.02,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: screenHeight * 0.02,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
