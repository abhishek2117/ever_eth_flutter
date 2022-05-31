import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common_methods/shared_pref.dart';
import '../model/calculator_model.dart';
import 'Api.dart';
import 'api_path.dart';

class CalculatorApi {
  MainCalculatorModel? allData;
  String? errorMessage;
  Future calculator_api(firstInpuet, secondInput) async {
    print("TEXT ONE" + firstInpuet);
    print("TEXT TWo" + secondInput);
    try {
      var address = await CommonSharePref.getData('address');
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse(ApiProvider().url + ApiPath.calculator));
      request.body = json.encode({
        "accounts": address,
        "firstInput": firstInpuet,
        "secondInput": secondInput
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = await response.stream.bytesToString();
        Map<String, dynamic> responseDecode = json.decode(jsonResponse);
        if (responseDecode['status']) {
          allData = MainCalculatorFromJson(jsonResponse);
        } else {
          print("FIRST ELSEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE " + responseDecode.toString());
          errorMessage = 'Something went wrong';
        }
        print('#########' + responseDecode.toString());
      } else {
            print("SECOND ELSEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE " + response.reasonPhrase.toString());
            Get.back();
        // errorMessage = 'Something went wrong';
        print(response.reasonPhrase);
      }
    } catch (e) {
      errorMessage = 'Check Your Internet Connection';
      print("CALCULATOR API" + e.toString());
    }
  }
}
