import 'dart:convert';

import 'package:ever_eth_flutter/Api/Api.dart';
import 'package:http/http.dart' as http;

import '../common_methods/shared_pref.dart';
import 'api_path.dart';

class Claimapi {
  String? to;
  String? from;
  String? gasprice;
  String? network_fee;
  String? balance;
  String? balance_usd;
  String? max_total;
  String? max_totalUsd;
  String? errormessage;
  String address = '';
  String privateKey = '';
  String? transictionError;
  ////////////////////////////////////////// API ///////////////////////////////////////////////
  Future<dynamic> claimApi() async {
    address = await CommonSharePref.getData('address');
    privateKey = await CommonSharePref.getData('privateKey');
    print('PRIVATE KEY' + privateKey);
    print('MY ADDRESS' + address);
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse(ApiProvider().url + ApiPath.claim));
      request.body = json.encode(
          {"accounts": address, "privateKey": privateKey, "getFee": true});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = await response.stream.bytesToString();
        print("@@@@@@@@@@@@@" + jsonResponse);
        Map<String, dynamic> responseDecode = json.decode(jsonResponse);

        if (responseDecode["status"]) {
          print('!!!!!!!!!!!!!!!' + responseDecode.toString());
          to = responseDecode['to_address'].toString();
          from = address;
          gasprice = responseDecode['gasPrice'].toString();
          network_fee = responseDecode['gasFee'].toString();
          max_total = responseDecode['TotalFee'].toString();
          max_totalUsd = '\$' + responseDecode['TotalFeeInUsd'].toString();
          balance = responseDecode['BNB_Balance'].toString();
          balance_usd = responseDecode['BNB_BalanceInUsd'].toString();
        } else {
          errormessage = responseDecode['message'];
          return errormessage;
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      errormessage = e.toString();
      return errormessage;
    }
  }

  ////////////////// CONFIRM TRANSICTION //////////////
  Future<dynamic> conFirmTransiction() async {
    address = await CommonSharePref.getData('address');
    privateKey = await CommonSharePref.getData('privateKey');
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse(ApiProvider().url + ApiPath.claim));
      request.body = json.encode(
          {"accounts": address, "privateKey": privateKey, "getFee": false});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = await response.stream.bytesToString();
        var responseDecode = json.decode(jsonResponse);
        print('pppppppppppppppppp' + responseDecode);
        if (responseDecode['status']) {
        } else {
          transictionError = 'Transiction Failed';
        }
      } else {
        transictionError = 'Transiction Failed';
        print(response.reasonPhrase);
      }
    } catch (e) {
      transictionError = 'Transiction Failed';
    }
  }
}
