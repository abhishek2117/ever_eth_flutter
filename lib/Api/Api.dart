import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiProvider {
  final String url = 'http://13.127.64.68:7003/api/';


  post(data, apiUrl) async {
    var fullUrl = url + apiUrl; //+_getToken();
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  get(apiUrl) async {
    var fullUrl = url + apiUrl; //
    print(fullUrl);// + _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}

class MESSAGES {
  static const String INTERNET_ERROR = "No Internet Connection";
  static const String INTERNET_ERROR_RETRY =
      "No Internet Connection.\nPlease Retry";
}
class StaticImage {
  static String ImageUrl = 'https://espsofttech.tech/swapfull/';
}