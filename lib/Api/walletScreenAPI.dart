import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import '../common_methods/shared_pref.dart';

import 'Api.dart';
import 'api_path.dart';

class GraphDataApi {
  String? errorMessage;
  List<dynamic>? coinList;
  List<dynamic>? sendCoinListPrice;
  List<Double>? coinPrices;

  Future<void> getYourTokenData() async {
    try {
      var request =
          http.Request('GET', Uri.parse(ApiProvider().url + ApiPath.graphData));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseConvert = json.decode(responseJson);
        coinList = responseConvert['data'];
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  Future<void> getCoinListWithPrice() async {
    try {
      var address = await CommonSharePref.getData('address');
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse(ApiProvider().url + ApiPath.coinlistWithPrice));
      request.body = json.encode({"accounts": address});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseConvert = json.decode(responseJson);
        sendCoinListPrice = responseConvert['coinList'];
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }
}
