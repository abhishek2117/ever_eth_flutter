// ignore_for_file: empty_catches, prefer_const_constructors

import 'dart:convert';

import 'package:ever_eth_flutter/Api/Api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common_methods/shared_pref.dart';
import '../navigation_screen.dart';
import 'api_path.dart';

class AfterSwapApi {
  String? hash;

  getAddress() async {
    return await CommonSharePref.getData('address');
  }

  getprivetKey() async {
    return await CommonSharePref.getData('privateKey');
  }

  Map<String, dynamic> allData = {};
  String? errorMessage;
  Future<void> afterSwap() async {
    try {
      var address = await getAddress();
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST',
          Uri.parse('http://13.127.64.68:7003/api/swap/approveTokenForSwap'));
      request.body = json.encode({
        "accounts": address,
        "privateKey":
            "0x74736956eb016fc0b5d3cd2ae9e3cd17dfb7a1eedc2cfa1263fb3d93f8ded8d6",
        "amount": 2000,
        "contractAddress": "0xf999Dc75e3Cb1273386f33C1e04bA44A61eF5d50",
        "coin": "ETH",
        "getFee": true
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responsejson = await response.stream.bytesToString();
        dynamic responseDecode = json.decode(responsejson);
        allData = responseDecode;
        print(responseDecode);
      } else {
        errorMessage = 'Insufficient Balance';
        print("@@@@@@@@@@@@@@" + response.reasonPhrase.toString());
      }
    } catch (e) {}
  }

  /////////////////////////////////////////// CONFIRM ////////////////////////////////////////////////////////////

  Future<void> confirmSwap(amount1, amount2, path, first_symbol, second_symbol,
      first_c_address, second_c_address) async {
    try {
      var address = await getAddress();
      var key = await getprivetKey();
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse(ApiProvider().url + ApiPath.approvTokenSwap));
      request.body = json.encode({
        "accounts": address,
        "privateKey": key,
        "amount": amount1.toString(),
        "contractAddress": first_c_address,
        "coin": first_symbol,
        "getFee": false
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var jsonresponse = await response.stream.bytesToString();
      Map<String, dynamic> jsonDecode = json.decode(jsonresponse);
      if (response.statusCode == 200) {
        print('&&&&&&&&&&&WWWWWWWWWWW' + jsonDecode.toString());
        if (jsonDecode['status']) {
          hash = jsonDecode['hash'];
          print('&&&&&&&&&&&WWWWWWWWWWWFFFFFFFFFFFF' + jsonDecode.toString());
          await verify_hash(hash, amount1, amount2, path, first_symbol,
              second_symbol, first_c_address, second_c_address);
        } else {
          Get.back();
          Get.showSnackbar(GetSnackBar(
            // message: ,
            messageText: Text(jsonDecode['message'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.GROUNDED,

            backgroundColor: Color(0xffFF0000),
          ));
        }
      } else {
        Get.back();
        Get.showSnackbar(GetSnackBar(
          // message: ,
          messageText: Text(jsonDecode['message'],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          duration: Duration(seconds: 3),
          snackStyle: SnackStyle.GROUNDED,

          backgroundColor: Color(0xffFF0000),
        ));
        print('!!!!!!!!' + response.reasonPhrase.toString());
      }
    } catch (e) {
      print('EEEEEEEEEEEEE' + e.toString());
    }
  }

  //////////////////////////////////////////////////  HASH SEND API ////////////////////////////////////////////////

  Future<void> verify_hash(hash, amount1, amount2, path, first_symbol,
      second_symbol, first_c_address, second_c_address) async {
    try {
      print("HASHHHHHHHHHH" + hash.toString());
      var request = http.Request(
          'GET', Uri.parse(ApiProvider().url + ApiPath.gestTransiction + hash));

      http.StreamedResponse response = await request.send();
      var responseJson = await response.stream.bytesToString();
      Map<String, dynamic> responseDecode = json.decode(responseJson);
      if (response.statusCode == 200) {
        print('!!!!!!!!!! @@@@@@@@@@@@@' + responseDecode.toString());
        if (responseDecode['status']) {
          if (responseDecode['confirmation'].toString().toLowerCase() == '1') {
            await finalApuTokenSwap(amount1, amount2, path, first_symbol,
                second_symbol, first_c_address, second_c_address);
          } else if (responseDecode['confirmation'].toString().toLowerCase() ==
              '2') {
            Get.back();
            Get.showSnackbar(GetSnackBar(
              // message: ,
              messageText: Text(responseDecode['message'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              duration: Duration(seconds: 3),
              snackStyle: SnackStyle.GROUNDED,

              backgroundColor: Color(0xffFF0000),
            ));
          } else {
            await verify_hash(hash, amount1, amount2, path, first_symbol,
                second_symbol, first_c_address, second_c_address);
          }
        } else {
          Get.back();
          Get.showSnackbar(GetSnackBar(
            // message: ,
            messageText: Text(responseDecode['message'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.GROUNDED,

            backgroundColor: Color(0xffFF0000),
          ));
          // Get.showSnackbar(GetSnackBar(message: responseDecode['message']));
        }
      } else {
        Get.back();
        Get.showSnackbar(GetSnackBar(
          // message: ,
          messageText: Text(responseDecode['message'],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          duration: Duration(seconds: 3),
          snackStyle: SnackStyle.GROUNDED,

          backgroundColor: Color(0xffFF0000),
        ));
        print("**************" + response.reasonPhrase.toString());
      }
    } catch (e) {
      print("^^^^^^^^^^^^^^^^" + e.toString());
    }
  }

  /////////////////////////////////////////////////////////  TOKEN SWAP ////////////////////////////////////////////
  Future finalApuTokenSwap(amount1, amount2, path, first_symbol, second_symbol,
      first_c_address, second_c_address) async {
    print("*****************");
    try {
      var address = await getAddress();
      var key = await getprivetKey();
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse(ApiProvider().url + ApiPath.swap));
      request.body = json.encode({
        "accounts": address,
        "privateKey": key,
        "amount1": amount1.toString(),
        "amount2": amount2.toString(),
        "path": path,
        "enterSecondAmount": false,
        "firstSymbol": first_symbol.toString(),
        "secondSymbol": second_symbol,
        "firstContractAddress": path[0],
        "secondContractAddress": path[1],
        "getFee": false
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseJson = await response.stream.bytesToString();
      var responseDecode = json.decode(responseJson);
      print("++++++++++++++++++++++++++" + responseDecode.toString());
      if (response.statusCode == 200) {
        print(responseDecode);
        if (responseDecode['status']) {
          Get.showSnackbar(GetSnackBar(
            // message: ,
            messageText: Text(responseDecode['message'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.GROUNDED,

            backgroundColor: Colors.green,
          ));

          Get.offAll(() => NavigationScreen());
        }
      } else {
        Get.back();
        // Get.showSnackbar(GetSnackBar(message: responseDecode['message']));
        Get.showSnackbar(GetSnackBar(
          // message: ,
          messageText: Text(responseDecode['message'],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          duration: Duration(seconds: 3),
          snackStyle: SnackStyle.GROUNDED,

          backgroundColor: Color(0xffFF0000),
        ));
        print('444444' + response.reasonPhrase.toString());
      }
    } catch (e) {}
  }

  ///////////////////////////////////////////////////////////////// FOR FIRST BNB API ///////////////////////
  Future firstBNBapi(amount1, amount2, path, first_symbol, second_symbol,
      first_c_address, second_c_address) async {
    try {
      var address = await getAddress();
      print("amount1 " + amount1.toString());
      print("amount2 " + amount2.toString());
      print("path " + path.toString());

      print("symbol1 " + first_symbol);
      print('symbol2 ' + second_symbol);
      print('1_c_add ' + first_c_address);
      print('1_2_address ' + second_c_address);
      var key = await getprivetKey();
      print('address ' + address);
      print('p_key ' + key);
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse(ApiProvider().url + ApiPath.swap));
      request.body = json.encode({
        "accounts": address,
        "privateKey": key,
        "amount1": amount1.toString(),
        "amount2": amount2 ?? '0.0',
        "path": path,
        "enterSecondAmount": false,
        "firstSymbol": first_symbol.toString(),
        "secondSymbol": second_symbol,
        "firstContractAddress": path[0],
        "secondContractAddress": path[1],
        "getFee": true
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseJson = await response.stream.bytesToString();
      Map<String, dynamic> responseDecode = json.decode(responseJson);
      if (response.statusCode == 200) {
        print("SSSSSSSSSSSSSSSSSSSSSS" + responseDecode['status'].toString());
        if (responseDecode['status']) {
          print("TTTTTTTTTTTTTTTTTTTTTTTT");
          allData = responseDecode;
        } else {
          print("VVVVVVVVVVVVVVVVVVVVVVVVV");
          Get.back();
          // Get.showSnackbar(GetSnackBar(message: responseDecode['message']));
          Get.showSnackbar(GetSnackBar(
            // message: ,
            messageText: Text(responseDecode['message'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            duration: Duration(seconds: 3),
            snackStyle: SnackStyle.GROUNDED,

            backgroundColor: Color(0xffFF0000),
          ));
        }
        print('#################@@@@@@@@@@@@@@@@' + responseJson);
      } else {
        print('EEEEEEEEEEEEEEEEEEEEEEEEEE');
        Get.back();
        // Get.showSnackbar(GetSnackBar(message: responseDecode['message']));
        Get.showSnackbar(GetSnackBar(
          // message: ,
          messageText: Text(responseDecode['message'],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          duration: Duration(seconds: 3),
          snackStyle: SnackStyle.GROUNDED,

          backgroundColor: Color(0xffFF0000),
        ));
        print('----------------' +
            response.reasonPhrase.toString() +
            responseDecode.toString());
      }
      return responseDecode['status'];
    } catch (e) {
      print("!!!!!!!!!!!!!!!" + e.toString());
    }
  }
}
