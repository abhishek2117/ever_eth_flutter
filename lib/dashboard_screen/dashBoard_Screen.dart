import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Api/dashBoardApi.dart';
import '../common_methods/commonIndicator.dart';
import '../costom_color.dart';
import '../transfer_module/transfer_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  bool isLoading = true;
  final _cont = DashBoardApi();
  void initState() {
    _cont.getDashBoardData().then((value) {
      isLoading = false;
      setState(() {});
    });
    _cont.getAccountValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      body: isLoading
          ? CommonIndicator()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.width * 0.14),
                    cardOne(size, "EverETH Balance", _cont.everEth + ' EverETH',
                        'walletplus.png', 1.2, _cont.everEthUsd),
                    SizedBox(height: size.width * 0.08),
                    cardTwo(size),
                    SizedBox(height: size.width * 0.08),
                    cardOne(
                        size,
                        'Total ETH Reward',
                        _cont.totalReward + ' ETH',
                        'eth.png',
                        5.8,
                        _cont.totalRewardUsd)
                  ],
                ),
              ),
            ),
    );
  }

  Widget cardTwo(size) {
    return Card(
      color: Color(0xff272640),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.048),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.transparent)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Claimable ETH Rewards",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w400)),
            SizedBox(height: size.width * 0.02),
            Text(_cont.reward + " EverETH",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),
            // SizedBox(height: size.width * 0.02),
            Text(
              "=",
              style: TextStyle(
                  color: Color(0xff85818b),
                  fontSize: 34,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text("\$ " + _cont.rewardUsd,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
                Spacer(),
                claimButton()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget claimButton() {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        backgroundColor: MaterialStateProperty.all(
          Color(0xff24195f),
        ),
      ),
      onPressed: () {
        Get.to(() => TransferScreen());
      },
      child: Text("CLAIM", style: TextStyle(fontWeight: FontWeight.w400)),
    );
  }

  Widget cardOne(size, text_one, text_two, imagePath, scale, text_usd) {
    return Card(
      color: Color(0xff272640),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.048),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.transparent)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Row(
          children: [
            commonColumn(size, text_one, text_two, text_usd),
            Spacer(),
            Image.asset('assets/images/$imagePath', scale: scale)
          ],
        ),
      ),
    );
  }

  Widget commonColumn(size, text_one, text_two, text_usd) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text_one,
            style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w400)),
        SizedBox(height: size.width * 0.02),
        Container(
          width: size.width * 0.66,
          child: Text(text_two,
              maxLines: 3,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700)),
        ),
        // SizedBox(height: size.width * 0.02),
        Text(
          "=",
          style: TextStyle(
              color: Color(0xff85818b),
              fontSize: 34,
              fontWeight: FontWeight.w600),
        ),
        Text("\$ " + text_usd,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400)),
      ],
    );
  }
}
