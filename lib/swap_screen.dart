// ignore_for_file: prefer_is_not_empty, unnecessary_null_comparison, prefer_const_constructors, avoid_print, unrelated_type_equality_checks

import 'dart:convert';

import 'package:ever_eth_flutter/sharedPreferences/shared_preferences_util.dart';
import 'package:ever_eth_flutter/swap_module/swap_confirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/Api.dart';
import 'Api/api_path.dart';
import 'costom_color.dart';
import 'model/coin_list_model.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({Key? key}) : super(key: key);

  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  bool _isInAsyncCall = true;
  bool _controllerType = false;
  late List<CoinListModel> coinListModel = [];
  late List<CoinListModel> coinListModelTemp = [];
  late List<CoinListModel> coinListModelDown = [];
  CoinListModel _selectedItem = CoinListModel();
  CoinListModel _selectedItemDown = CoinListModel();
  int _value = 1;
  String? _accountAddress;
  String? _amount;
  double? _bal = 0, _balDown = 0;
  dynamic path;
  bool _pair = false;
  double? _price = 0;
  dynamic _balUp = 0;
  double _priceImpact = 0;
  final _formTextController = TextEditingController(text: '');
  final _toTextController = TextEditingController(text: '');
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loader = false;

  underLineInput() {
    return UnderlineInputBorder(
      borderSide:
          BorderSide(color: Colors.transparent, width: screenHeight * 0.007),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAccountAddressPassword();
    getCoinList();
  }

  @override
  Widget build(BuildContext context) {
 
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: _isInAsyncCall,
      color: Colors.transparent,
      opacity: 0.9,
      progressIndicator: CircularProgressIndicator(
        color: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.primaryColor,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.01),
              child: Container(
                margin: EdgeInsets.only(right: screenHeight * 0.02),
                child: ImageIcon(
                  AssetImage(
                    'assets/images/menu.png',
                  ),
                  size: screenHeight * 0.03,
                ),
              ),
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
        backgroundColor: MyColor.primaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                      // Padding(
                      //   padding: EdgeInsets.all(screenHeight * .01),
                      //   child: Text(
                      //     "Current Wallet Value",
                      //     style: TextStyle(
                      //       color: Colors.white.withOpacity(.7),
                      //       fontSize: screenHeight * 0.022,
                      //       fontWeight: FontWeight.w300,
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.all(screenHeight * .006),
                      //   child: Text(
                      //     "\$" + _bal.toString(),
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: screenHeight * 0.04,
                      //       fontWeight: FontWeight.w400,
                      //     ),
                      //   ),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     CircleAvatar(
                      //       backgroundColor: Colors.blue,
                      //       radius: screenHeight * 0.005,
                      //     ),
                      //     SizedBox(
                      //       width: screenWidth * 0.01,
                      //     ),
                      //     Text(
                      //       "Smart Chain BEP - 20",
                      //       style: TextStyle(
                      //         color: Colors.white.withOpacity(.5),
                      //         fontSize: screenHeight * 0.02,
                      //         fontWeight: FontWeight.w300,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: screenWidth * 0.02,
                      //     ),
                      //     Icon(
                      //       Icons.keyboard_arrow_down_outlined,
                      //       color: Colors.white.withOpacity(.5),
                      //       size: screenHeight * 0.025,
                      //     )
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: screenHeight * 0.02,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     SizedBox(
                      //       width: screenWidth * 0.03,
                      //     ),
                      //     Expanded(
                      //       flex: 1,
                      //       child: Container(
                      //         margin: EdgeInsets.only(left: screenHeight * 0.0),
                      //         alignment: Alignment.center,
                      //         decoration: BoxDecoration(
                      //           borderRadius:
                      //               BorderRadius.circular(screenHeight * 0.03),
                      //           color: MyColor.navItemColor.withOpacity(.2),
                      //         ),
                      //         child: Padding(
                      //           padding: EdgeInsets.all(screenHeight * 0.012),
                      //           child: Text(
                      //             "12.00@ Slippage",
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: screenHeight * 0.018,
                      //               fontWeight: FontWeight.w400,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       flex: 1,
                      //       child: Container(
                      //         alignment: Alignment.center,
                      //         child: Padding(
                      //           padding: EdgeInsets.all(screenHeight * 0.012),
                      //           child: Text(
                      //             "Standard Speed",
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: screenHeight * 0.018,
                      //               fontWeight: FontWeight.w400,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       flex: 1,
                      //       child: Container(
                      //         alignment: Alignment.center,
                      //         child: Padding(
                      //           padding: EdgeInsets.all(screenHeight * 0.012),
                      //           child: Text(
                      //             "Reflection",
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: screenHeight * 0.018,
                      //               fontWeight: FontWeight.w400,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: screenHeight * 0.015,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(screenHeight * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'EverETH ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.025,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'Swap',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.5),
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              MyColor.gradientColor1.withOpacity(.15),
                              MyColor.gradientColor1.withOpacity(.1),
                              MyColor.gradientColor1.withOpacity(.05),
                            ],
                            begin: Alignment.topCenter,
                            //begin of the gradient color
                            end: Alignment
                                .bottomCenter, //end of the gradient color
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(screenHeight * .01),
                                    child: Text(
                                      "From",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(.7),
                                        fontSize: screenHeight * 0.022,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.all(screenHeight * .01),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          _balUp == 0
                                              ? "Balance: 0.0"
                                              : "Balance: ${_balUp!.toStringAsFixed(6)}",
                                          maxLines: 1,
                                          // overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(.7),
                                            fontSize: screenHeight * 0.0168,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: screenHeight * 0.02,
                                right: screenHeight * 0.02,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.015),
                                color: Colors.black.withOpacity(.2),
                                border: Border.all(
                                  color: Colors.white38,
                                  //                   <--- border color
                                  width: screenHeight * 0.002,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textFieldOne(),
                                  Container(
                                    child: Flexible(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<CoinListModel>(
                                          dropdownColor: MyColor.gradientColor1,
                                          isExpanded: true,
                                          value: _selectedItem,
                                          items: coinListModel
                                              .map((CoinListModel items) {
                                            return DropdownMenuItem(
                                                value: items,
                                                child: spinnerItem(items));
                                          }).toList(),
                                          onChanged: (value) async {
                                            print(value);
                                            _bal = 0;

                                            _balDown = 0;
                                            _pair = false;
                                            _price = 0;
                                            _priceImpact = 0;
                                            // setState(() {
                                            // _selectedItemDown = value!;

                                            _formTextController.clear();
                                            _toTextController.clear();
                                            print(value);
                                            if (_selectedItemDown.name !=
                                                value?.name) {
                                              print("NAMEEEEEEEEEEEE" +
                                                  _selectedItem.name
                                                      .toString());
                                              await getBalance(_selectedItem);
                                              generateDownList(_selectedItem);
                                              _selectedItem = value!;
                                            }
                                            // setState(() {

                                            setState(() {});

                                            // });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Center(
                              child: Image.asset(
                                'assets/images/swap.png',
                                color: Colors.white,
                                height: screenHeight * 0.04,
                                width: screenWidth * 0.08,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.005,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: screenHeight * 0.02,
                                  right: screenHeight * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(screenHeight * .01),
                                    child: Text(
                                      "To(Estimated)",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(.7),
                                        fontSize: screenHeight * 0.022,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.all(screenHeight * .01),
                                      child: Text(
                                        _balDown == 0
                                            ? "Balance: 0.0"
                                            // : 'Balance: 6456456',
                                            : "Balance: ${_balDown!.toStringAsFixed(6)}",
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(.7),
                                          fontSize: screenHeight * 0.0168,
                                          fontWeight: FontWeight.w300,
                                        ),
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
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.015),
                                color: Colors.black.withOpacity(.2),
                                border: Border.all(
                                  color: Colors.white38,
                                  //                   <--- border color
                                  width: screenHeight * 0.002,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textFieldTwo(),
                                  Container(
                                    child: Flexible(
                                      child: coinListModelDown.length > 0 &&
                                              coinListModelDown.isNotEmpty
                                          ? DropdownButtonHideUnderline(
                                              child:
                                                  DropdownButton<CoinListModel>(
                                                dropdownColor:
                                                    MyColor.gradientColor1,
                                                isExpanded: true,
                                                value: _selectedItemDown,
                                                items: coinListModelDown
                                                    .map((CoinListModel items) {
                                                  print("DROP DOWN ITEM" +
                                                      items.symbol.toString());
                                                  return DropdownMenuItem(
                                                      value: items,
                                                      child:
                                                          spinnerItem(items));
                                                }).toList(),
                                                onChanged: (value) async {
                                                  print(value);
                                                  _bal = 0;

                                                  _balDown = 0;
                                                  _pair = false;
                                                  _price = 0;
                                                  _priceImpact = 0;
                                                  _toTextController.clear();
                                                  _formTextController.clear();
                                                  // setState(() {

                                                  if (_selectedItem.name !=
                                                      value?.name) {
                                                    _selectedItemDown = value!;
                                                    await getBalanceDown(
                                                        _selectedItem);
                                                  }

                                                  setState(() {});
                                                  // });
                                                },
                                              ),
                                            )
                                          : Container(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: screenHeight * 0.02,
                                  right: screenHeight * 0.02),
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.all(screenHeight * .01),
                                child: Text(
                                  _price == 0
                                      ? "Price: 0.0"
                                      : "Price: ${_price!.toStringAsFixed(8)}" +
                                          " ${_selectedItemDown.symbol}",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(.7),
                                    fontSize: screenHeight * 0.022,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            InkWell(
                              onTap: _priceImpact >= 15.0 ||
                                      _toTextController.text == '' ||
                                      _formTextController.text == ''
                                  ? null
                                  : () {
                                      print('>>>>>>>>>>>>>>>>' +
                                          _toTextController.text +
                                          '<<<<<<<<<<<<<');
                                      if (_formKey.currentState!.validate()) {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());

                                        if (!_toTextController.text.isEmpty ||
                                            !_formTextController.text.isEmpty ||
                                            _formTextController.text != '0.0' ||
                                            !(_toTextController.text == '') ||
                                            !(_formTextController.text == '') ||
                                            _toTextController.text != '0.0') {
                                          print("11111111" +
                                              _formTextController.text);
                                          print('2222222222222' +
                                              _toTextController.text);
                                          Get.to(() => SwapConfirmScreen(
                                              coinName: _selectedItem.symbol,
                                              amount_one:
                                                  _formTextController.text,
                                              first_symbol:
                                                  _selectedItem.symbol,
                                              second_symbol:
                                                  _selectedItemDown.symbol,
                                              coin_f_address:
                                                  _selectedItem.address,
                                              coin_s_address:
                                                  _selectedItemDown.address,
                                              amount_two:
                                                  _toTextController.text == ''
                                                      ? '0.0'
                                                      : _toTextController.text,
                                              list_path: path));
                                        }

                                        // getSwapBalance();
                                      }
                                    },
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    left: screenHeight * 0.02,
                                    right: screenHeight * 0.02),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      screenHeight * 0.015),
                                  color: MyColor.purpleColor.withOpacity(.4),
                                  border: null,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(screenHeight * 0.02),
                                  child: Text(
                                    "Swap",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.022,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            _priceImpact >= 15.0
                                ? Text("Price impact is so high",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16))
                                : Container(),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldOne() {
    return Container(
      child: Flexible(
        child: TextFormField(
          autofocus: false,
          controller: _formTextController,
          validator: (value) {
            if (value!.isEmpty) {
              return "From amount field is empty";
            }
            return null;
          },
          onChanged: (value) async {
            print("CALLING" + value.toString());
            print('FFFFFFFF' + value);
            _amount = value;
            _controllerType = false;

            print("CLEARRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
            // _toTextController.clear();
            if (_formTextController.text.isEmpty) {
              _formTextController.clear();
              _toTextController.clear();
              setState(() {});
            } else {
              await getSwapBalance(
                _selectedItem,
                _amount,
                _controllerType,
              ).then((value) {});
              await getBalanceDown(_selectedItemDown);
              await getBalanceUp(_selectedItem);
              // getBalanceDown(_selectedItem);
              setState(() {});
            }

            // setState(() {

            // });
            // if (!_formTextController
            //     .text.isEmpty) {

            // }

            // setState(() {});
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: '0',
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: screenHeight * 0.025,
              fontWeight: FontWeight.w300,
            ),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            enabledBorder: underLineInput(),
            focusedBorder: underLineInput(),
          ),
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.025,
            fontWeight: FontWeight.w400,
          ),
        ),
      ), //flexible
    );
  }

  Widget textFieldTwo() {
    return Container(
      child: Flexible(
        child: TextFormField(
          autofocus: false,
          controller: _toTextController,
          /*validator: (value) {
                                          if (value!.isEmpty) {
                                            return "To amount field is empty";
                                          }
                                          return null;
                                        },*/
          onChanged: (value) async {
            _controllerType = true;
            _amount = value;
            if (_toTextController.text.isEmpty) {
              _toTextController.clear();
              _formTextController.clear();
              setState(() {});
            } else {
              await getBalanceDown(_selectedItemDown);
              await getBalanceUp(_selectedItem);
              await getSwapBalance(
                _selectedItem,
                _amount,
                _controllerType,
              ).then((value) {});
              setState(() {});
            }

            print(value);
            // if (!_toTextController
            //     .text.isEmpty) {

            // }
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: '0',
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: screenHeight * 0.025,
              fontWeight: FontWeight.w300,
            ),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            enabledBorder: underLineInput(),
            focusedBorder: underLineInput(),
          ),
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.025,
            fontWeight: FontWeight.w400,
          ),
        ),
      ), //flexible
    );
  }

  Future<void> getCoinList() async {
    var res = await ApiProvider().get(ApiPath.coinList);
    Map data = json.decode(res.body);
    List coinList = data["coinList"] ?? [];
    print(data);
    print(coinList.length);

    if (data.isNotEmpty) {
      for (Map d in coinList) {
        coinListModel.add(CoinListModel.fromJson(d));
      }
      print(coinListModel.length);
    }
    if (coinListModel != null && coinListModel.isNotEmpty) {
      print("%%%%%%%%%%%%%%%%%% " + coinListModel.length.toString());

      _selectedItem = coinListModel.first;
      await getBalance(_selectedItem);
      await getBalanceDown(_selectedItemDown);
      await generateDownList(_selectedItem);
      setState(() {
        _isInAsyncCall = false;
      });
    }
  }

  spinnerItem(CoinListModel items) {
    return Text(
      items.symbol ?? "",
      style: TextStyle(
        color: Colors.white.withOpacity(.8),
        fontSize: screenHeight * 0.02,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  generateDownList(CoinListModel selectedItem) async {
    coinListModelTemp.clear();
    coinListModelTemp.addAll(coinListModel);
    int i = coinListModelTemp.indexOf(selectedItem);
    print("IndexTemp :::: $i");
    coinListModelTemp.removeAt(i);
    print("IndexTemp Size ::::${coinListModelTemp.length}");
    print("Index Size ::::${coinListModel.length}");
    coinListModelDown.clear();
    coinListModelDown.addAll(coinListModelTemp);
    if (coinListModelDown != null && coinListModelDown.isNotEmpty) {
      CoinListModel item = coinListModelDown.firstWhere(
          (element) => element.symbol.toString().toLowerCase() == 'evereth');
      coinListModelDown.clear();
      coinListModelDown.add(item);
      _selectedItemDown = coinListModelDown.first;
      await getBalanceDown(_selectedItemDown);
    }
  }

  Future<void> getBalance(CoinListModel selectedItem) async {
    print("ACCOUNT ADDRESS" + _accountAddress.toString());
    var param = {
      // "accounts": _accountAddress,
      "accounts": _accountAddress,
      "coin": selectedItem.symbol,
      "contractAddress": selectedItem.address,
    };
    print("CoinBalParam :::: ${param.toString()}");
    var res = await ApiProvider().post(param, ApiPath.getBalance);
    Map data = json.decode(res.body);
    print("CoinData :::: $data");
    setState(() {
      _bal = (double.tryParse("${data["balance"]}") ??
              int.tryParse("${data["balance"]}") ??
              0)
          .toDouble();
    });
    print("CoinBal :::: $_bal");
  }

  Future<void> getBalanceDown(CoinListModel selectedItem) async {
    var param = {
      // "accounts": _accountAddress,
      "accounts": '0x9CEE00358Da45Eb0F8E47a8fA0dcf275D8E031B9',
      "coin": selectedItem.symbol,
      "contractAddress": selectedItem.address,
    };
    print("CoinBalParam :::: ${param.toString()}");
    var res = await ApiProvider().post(param, ApiPath.getBalance);
    Map data = json.decode(res.body);
    print("CoinDataDownXXXXXXXXX :::: $data");
    // setState(() {
    _balDown = (double.tryParse("${data["balance"]}") ??
            int.tryParse("${data["balance"]}") ??
            0)
        .toDouble();
    // });
    print("CoinBalDown :::: $_balDown");
  }

  Future<void> getBalanceUp(CoinListModel selectedItem) async {
    var param = {
      // "accounts": _accountAddress,
      "accounts": '0x9CEE00358Da45Eb0F8E47a8fA0dcf275D8E031B9',
      "coin": selectedItem.symbol,
      "contractAddress": selectedItem.address,
    };
    print("CoinBalParam :::: ${param.toString()}");
    var res = await ApiProvider().post(param, ApiPath.getBalance);
    Map data = json.decode(res.body);
    print("CoinDataDown :::: $data");
    // setState(() {
    _balUp = (double.tryParse("${data["balance"]}") ??
            int.tryParse("${data["balance"]}") ??
            0)
        .toDouble();
    // });
    print("CoinBalDown :::: $_balDown");
  }

  Future<void> getAccountAddressPassword() async {
    SharedPreferences preferences =
        await SharedPreferencesUtil.getSharedPreferences();
    _accountAddress = preferences.getString("address");
    print(_accountAddress);
  }

  Future<void> getSwapBalance(
      CoinListModel selectedItem, String? amount, bool controllerType) async {
    print("ITEMMMMMMM 1111111111" + _selectedItem.address.toString());
    print("ITEMMMMMMMMMM 2222222222222" + _selectedItemDown.address.toString());
    print("ENTEREDDDDDDDDDDDDDDDDDDDD  " + amount.toString());
    var param = {
      "accounts": _accountAddress,
      "amount":
          controllerType ? _toTextController.text : _formTextController.text,
      "enterSecondAmount": controllerType,
      "firstSymbol": _selectedItem.symbol,
      "secondSymbol": _selectedItemDown.symbol,
      "firstContractAddress": _selectedItem.address,
      "secondContractAddress": _selectedItemDown.address
      /*"firstSymbol": _selectedItem.symbol,
      "secondSymbol": _selectedItemDown.symbol,
      "firstContractAddress": _selectedItem.address,
      "secondContractAddress": _selectedItemDown.address*/
    };

    print("SwapDataParam :::: $param");

    var res = await ApiProvider().post(param, ApiPath.getAmountsOut);
    Map data = json.decode(res.body);
    print("SwapData :::: $data");

    if (data.isNotEmpty) {
      path = data['path'];
      if (controllerType) {
        if (data['amount1'] != null) {
          _formTextController.text = data["amount1"];
        }
      } else {
        if (data['amount2'] != null) {
          _toTextController.text = data['amount2'];
        }
      }
      print("APIIIIIIIIIIIIIIIIIII");
      _price = (double.tryParse("${data["swapPrice"]}") ??
              int.tryParse("${data["swapPrice"]}") ??
              0)
          .toDouble();
      _pair = data["pair"] ?? false;
      _priceImpact = (double.tryParse("${data["priceImpact"]}") ??
              int.tryParse("${data["priceImpact"]}") ??
              0)
          .toDouble();
      // setState(() {});
      print("SwapDataPrice :::: $_price");
      print("SwapDataPair :::: $_pair");
      print("SwapDataPriceI :::: $_priceImpact");
    }
  }
}
