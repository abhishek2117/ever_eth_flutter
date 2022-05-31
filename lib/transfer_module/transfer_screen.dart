// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Api/claim_api.dart';
import '../common_methods/commonIndicator.dart';
import '../costom_color.dart';
import '../navigation_screen.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _cont = Claimapi();
  bool isLoading = true;
  bool isConfirm = false;
  @override
  void initState() {
    _cont.claimApi().then((value) {
      setState(() {
        isLoading = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MyColor.primaryColor,
        appBar: customAppBar(),
        body: isLoading
            ? CommonIndicator()
            : Builder(builder: (context) {
                if (_cont.errormessage == null) {
                  return mainWidget(size);
                } else {
                  return Center(
                      child: Text(
                    _cont.errormessage.toString(),
                    style: TextStyle(color: Colors.white),
                  ));
                }
              }));
  }

  Widget mainWidget(size) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.04),
            balanceTextWidget(),
            richText(),
            SizedBox(height: size.height * 0.08),
            cardOne(
              size,
              'Asset',
              'Smart Chain (BNB)',
              'From',
              _cont.from,
              'To',
              _cont.to.toString(),
            ),
            SizedBox(height: size.height * 0.04),
            cardOne(
                size,
                'Gass Price     ',
                _cont.gasprice,
                'Network Fee',
                _cont.network_fee,
                'Max Total',
                _cont.max_total.toString() +
                    '  (' +
                    _cont.max_totalUsd.toString() +
                    ')'),
            SizedBox(height: size.height * 0.06),
            isConfirm
                ?  CommonIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ConfirmButton(),
                      CancelButton(),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Widget CancelButton() {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(130, 52)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        backgroundColor: MaterialStateProperty.all(
          Color(0xff24195f),
        ),
      ),
      onPressed: () {
        Get.back();
        // Get.to(()=>TransferScreen());
      },
      child: Text("CANCEL",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 1)),
    );
  }

  Widget ConfirmButton() {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(130, 52)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Color(0xff251962), width: 5),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Color(0xff130d20),
        ),
      ),
      onPressed: () async {
        setState(() {
          isConfirm = true;
        });
        await _cont.conFirmTransiction();
        if (_cont.transictionError != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(_cont.transictionError ?? ''),
          ));
        } else {
          Get.offAll(() => NavigationScreen());
        }
        setState(() {
          isConfirm = false;
        });
        // Get.to(()=>TransferScreen());
      },
      child: Text("CONFIRM",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 1)),
    );
  }

  Widget cardOne(
      size, r1_title, r1_value, r2_titile, r2_value, r3_title, r3_value) {
    return Card(
      color: Color(0xff1f1b32),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
        child: Column(
          children: [
            commonCardRow(r1_title, r1_value),
            SizedBox(height: size.height * 0.018),
            commonCardRow(r2_titile, r2_value),
            SizedBox(height: size.height * 0.018),
            commonCardRow(r3_title, r3_value)
          ],
        ),
      ),
    );
  }

  Widget commonCardRow(tetxt_one, text_two) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tetxt_one.toString(),
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Spacer(),
        Expanded(
          child: Text(
            text_two.toString(),
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Color(0xffa2a1a3),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }

  Widget balanceTextWidget() {
    return Text(
      _cont.balance.toString() + ' BNB',
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget richText() {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: '= ',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: Color(0xff7f7b85),
        ),
      ),
      TextSpan(
        text: ' \$ ' + _cont.balance_usd.toString(),
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w400,
          color: Color(0xff7f7b85),
        ),
      )
    ]));
  }

  AppBar customAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: MyColor.primaryColor,
      title: Text("Transfer",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back),
      ),
    );
  }
}
