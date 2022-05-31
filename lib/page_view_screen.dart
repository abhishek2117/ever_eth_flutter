import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/intro_screen_first.dart';
import 'package:ever_eth_flutter/intro_screen_second.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  PageController controller = PageController();
  List<Widget> _list =[];
  int _curr = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = <Widget>[
      IntroScreenFirst(controller),
      IntroScreenSecond(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 12,
            child: PageView(
              children: _list,
              scrollDirection: Axis.horizontal,
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  _curr = value;
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: screenWidth,
              color: MyColor.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: screenHeight * 0.04),
                    color: MyColor.primaryColor,
                    child: SmoothPageIndicator(
                        controller: controller,
                        count: _list.length,
                        effect: ScrollingDotsEffect(
                          activeStrokeWidth: screenWidth*0.02,
                          activeDotScale: 1.3,
                          maxVisibleDots: 5,
                          radius: 8,
                          spacing: 10,
                          dotHeight: screenHeight*0.01,
                          dotWidth: screenWidth*0.02,
                          activeDotColor: Colors.white
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: screenHeight * 0.04),
                    child: Text(
                      "Terms & Privacy Policy",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.018,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
