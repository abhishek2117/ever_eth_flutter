import 'dart:convert';

import 'package:http/http.dart' as http;

import '../common_methods/shared_pref.dart';
import 'Api.dart';
import 'api_path.dart';

class DashBoardApi {
  String everEth = '0';
  String reward = '0';
  String totalReward = '0';
  String everEthUsd = '0';
  String rewardUsd = '0';
  String totalRewardUsd = '0';

  String? errorMessage;
  Future<void> getDashBoardData() async {
    try {
      var address = await CommonSharePref.getData('address');
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse(ApiProvider().url + ApiPath.getDashboardData));
      request.body = json.encode({"accounts": address});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseConvert = json.decode(responseJson);
        everEth = responseConvert['EverETH'].toString();
        totalReward = responseConvert['TotalReward'].toString();
        reward = responseConvert['Reward'].toString();
        everEthUsd = responseConvert['EverETHinUSD'].toString();
        rewardUsd = responseConvert['RewardinUSD'].toString();
        totalRewardUsd = responseConvert['TotalRewardinUSD'].toString();
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  Future<void> getAccountValue() async {
    try {
      var address = await CommonSharePref.getData('address');
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse(ApiProvider().url + ApiPath.currentAccountValue));
      request.body = json.encode({"accounts": address});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseConvert = json.decode(responseJson);
        if (responseConvert['status']) {
          CommonSharePref.setData(
              'totalBalance', responseConvert['balance'].toString());
        }
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }
}
