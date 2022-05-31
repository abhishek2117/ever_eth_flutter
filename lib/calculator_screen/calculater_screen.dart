// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Api/calculator_api.dart';
import '../common_methods/commonIndicator.dart';
import '../constants/constants.dart';
import '../costom_color.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _cont = CalculatorApi();
  final TextEditingController _fieldOne = TextEditingController();

  final TextEditingController _fieldTwo = TextEditingController();
  bool isLoading = true;
  @override
  void initState() {
    _cont.calculator_api(_fieldOne.text, _fieldTwo.text).then((value) {
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
        appBar: AppBar(
          backgroundColor: MyColor.primaryColor,
          title: Text("Calculator"),
          centerTitle: true,
          leading: IconButton(onPressed: () {
            Get.back();
          }, icon: Icon(Icons.arrow_back)),
        ),
        body: isLoading
            ? CommonIndicator()
            : Builder(builder: (context) {
                print("ERRORMESSAGE" + _cont.errorMessage.toString());
                if (_cont.errorMessage == null) {
                  return mainWidget(size);
                } else {
                  return Center(
                    child: Text(_cont.errorMessage.toString(),
                        style: TextStyle(color: Colors.white)),
                  );
                }
              }));
  }

  Widget mainWidget(size) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.width * 0.04),
            CommonCard(size, Constants.calculater_first_text, _fieldOne),
            SizedBox(height: size.width * 0.02),
            CommonCard(size, Constants.calculator_textTwo, _fieldTwo),
            SizedBox(height: size.width * 0.04),
            bottomMainCard(
                'Your ${_cont.allData?.tokenBalance ?? 'N/A'} EverETH Earns',
                'Estimations are based on \$${_cont.allData?.tradingValume ?? 'N/A'} trading volume',
                _cont.allData?.data1.line1,
                _cont.allData?.data1.line2,
                _cont.allData?.data1.line3,
                _cont.allData?.data1.line4),
            SizedBox(height: size.width * 0.04),
            bottomMainCard(
                'By Reinvesting Reward Every Day, Your ${_cont.allData?.tokenBalance ?? 'N/A'} EverETH Becomes',
                ' Estimations are based on current EverETH price \$${_cont.allData?.tokenpriceInUsd ?? 'N/A'} ',
                _cont.allData?.data2.line1,
                _cont.allData?.data2.line2,
                _cont.allData?.data2.line3,
                _cont.allData?.data2.line4)
          ],
        ),
      ),
    );
  }

  Widget bottomMainCard(titleText, lastText, line1, line2, line3, line4) {
    return Container(
      width: double.maxFinite,
      child: Card(
        color: Color(0xff222036),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                titleText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
            dot_with_text_card(line1),
            SizedBox(height: 3),
            dot_with_text_card(line2),
            SizedBox(height: 3),
            dot_with_text_card(line3),
            SizedBox(height: 3),
            dot_with_text_card(line4),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6),
              child: Text(
                lastText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 4),
          ],
        ),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
      ),
    );
  }

  Widget dot_with_text_card(text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        color: Color(0xff303044),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  text,
                  // maxLines: 4,
                  // overflow: TextOverflow.clip,
                  // softWrap: true,

                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget CommonCard(size, text, cont) {
    return Card(
      color: Color(0xff20213d),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: Column(
          children: [
            SizedBox(height: size.width * 0.06),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            SizedBox(height: size.width * 0.05),
            CommonTextField(
              size: size,
              cont: cont,
              on_change: (val) async {
                print("TextFieldOne" + val);
                await _cont.calculator_api(_fieldOne.text, _fieldTwo.text);
                setState(() {});
              },
            ),
            SizedBox(height: size.width * 0.06),
          ],
        ),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  Function(String) on_change;
  final TextEditingController cont;
  CommonTextField({
    Key? key,
    required this.on_change,
    required this.cont,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      controller: cont,
      onChanged: (val) {
        on_change(val);
      },
      cursorHeight: 20.0,
      decoration: InputDecoration(
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(bottom: 3),
        constraints: BoxConstraints.tight(Size(size.width * 1, 46)),
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
