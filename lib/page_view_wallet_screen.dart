import 'package:ever_eth_flutter/costom_color.dart';
import 'package:ever_eth_flutter/create_wallet_screen.dart';
import 'package:ever_eth_flutter/page_view_import_screen.dart';
import 'package:ever_eth_flutter/secret_wallet_phares_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageViewWalletScreen extends StatefulWidget {
  const PageViewWalletScreen({Key? key}) : super(key: key);

  @override
  _PageViewWalletScreenState createState() => _PageViewWalletScreenState();
}

class _PageViewWalletScreenState extends State<PageViewWalletScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  PageController controller = PageController(keepPage: true);
  Duration _pageDuration = const Duration(milliseconds: 300);
  Curve _pageCurve = Curves.ease;
  bool boolNext = false;

  final List<Widget> _list = <Widget>[
    CreateWalletScreen(),
    SecretWalletPhraseScreen(),
  ];
  int _curr = 0;




  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 12,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: _list.length,
              onPageChanged: (value) {
                setState(() {
                  _curr = value;
                  print("Current Page: " + _curr.toString());
                });
              },
              itemBuilder: (context,index)=>_list[index],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: screenWidth,
              color: MyColor.purpleColor.withOpacity(.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (_curr == 1) {
                          boolNext = false;
                        }
                      });
                      controller.previousPage(
                          duration: _pageDuration, curve: _pageCurve);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: screenHeight * 0.04),
                      child: Visibility(
                        visible: boolNext,
                        child: Text(
                          "Back",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.022,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      controller.nextPage(
                          duration: _pageDuration, curve: _pageCurve);
                      setState(()  {
                        boolNext = true;
                        if (_curr == 1) {
                          print(prefs.getBool("equal"));
                          /*Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PageViewImportScreen()));*/
                        }
                      });
                    },
                    child: Container(
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
          ),
        ],
      ),
    );
  }
}
