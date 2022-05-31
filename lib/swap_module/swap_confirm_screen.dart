// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Api/after_swap_api.dart';
import '../Api/claim_api.dart';
import '../common_methods/commonIndicator.dart';
import '../common_methods/shared_pref.dart';
import '../costom_color.dart';
import '../navigation_screen.dart';

class SwapConfirmScreen extends StatefulWidget {
  dynamic coinName;
  dynamic list_path;
  dynamic coin_f_address;
  dynamic coin_s_address;
  dynamic amount_one;
  dynamic amount_two;
  dynamic first_symbol;
  dynamic second_symbol;

  SwapConfirmScreen(
      {Key? key,
      required this.coinName,
      required this.first_symbol,
      required this.second_symbol,
      required this.amount_one,
      required this.coin_s_address,
      required this.coin_f_address,
      required this.amount_two,
      required this.list_path})
      : super(key: key);

  @override
  State<SwapConfirmScreen> createState() => _SwapConfirmScreenState();
}

class _SwapConfirmScreenState extends State<SwapConfirmScreen> {
  final _cont = AfterSwapApi();
  bool isLoading = true;
  bool isConfirm = false;
  // bool isConfirmLoading  = false ;
  String address = '';
  dynamic path;
  @override
  void initState() {
    CommonSharePref.getData('address').then((value) {
      address = value;
    });
            print(widget.amount_two+'@@@@@@@@@@@@@@@@');
        print(widget.amount_two+ '<<<<<<<<<<<<<');
    print("NAMEEEEEEEEEEE" + widget.first_symbol);
    if (widget.first_symbol.toString().toLowerCase() == 'bnb') {
      print("BNBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      _cont
          .firstBNBapi(
        widget.amount_one,
        widget.amount_two,
        widget.list_path,
        widget.first_symbol,
        widget.second_symbol,
        widget.coin_f_address,
        widget.coin_s_address,
      )
          .then((value) {
            print("%%%%%%%%%%");
            print("@@@@@@@@@@@"+ value.toString());
            if(value){
                 setState(() {
          isLoading = false;
        });
            }
            else{}
     
      });
    } else {

      _cont.afterSwap().then((value) {
        path = _cont.allData['path'];
        setState(() {
          isLoading = false;
        });
      });
    }
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
                if (_cont.errorMessage == null) {
                  return mainWidget(size);
                } else {
                  return Center(
                      child: Text(
                    _cont.errorMessage.toString(),
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
              address,
              'To',
              _cont.allData['to_address'].toString(),
            ),
            SizedBox(height: size.height * 0.04),
            cardOne(
                size,
                'Gass Price     ',
                _cont.allData['gasPrice'],
                'Network Fee',
                _cont.allData['gasPrice'],
                'Max Total',
                _cont.allData['TotalFee'].toString() +
                    '  (' +
                    _cont.allData['TotalFeeInUsd'].toString() +
                    ')'),
            SizedBox(height: size.height * 0.06),
            isConfirm
                ? CommonIndicator()
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
   print('SSSSSSSSSSSSSSSSSSSSSSSSS' +widget.first_symbol.toString().toLowerCase() );
        if (widget.first_symbol.toString().toLowerCase() == 'bnb') {
          await _cont.finalApuTokenSwap(
              widget.amount_one,
              widget.amount_two,
              widget.list_path,
              widget.first_symbol,
              widget.second_symbol,
              widget.coin_f_address,
              widget.coin_s_address);
        } else {
          await _cont.confirmSwap(
              widget.amount_one,
              widget.amount_two,
              widget.list_path,
              widget.first_symbol,
              widget.second_symbol,
              widget.coin_f_address,
              widget.coin_s_address);
        }

        setState(() {
          isConfirm = false;
        });
        // setState(() {
        //   isConfirm = true;
        // });
        // await _cont.conFirmTransiction();
        // if (_cont.transictionError != null) {
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     backgroundColor: Colors.red,
        //     content: Text(_cont.transictionError ?? ''),
        //   ));
        // } else {
        //   Get.offAll(() => NavigationScreen());
        // }
        // setState(() {
        //   isConfirm = false;
        // });
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
      _cont.allData['BNB_Balance'].toString() + ' BNB',
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
        text: ' \$ ' + _cont.allData['BNB_BalanceInUsd'].toString(),
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
