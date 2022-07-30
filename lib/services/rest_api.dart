import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_stock_v3/utils/constants.dart';

class CallAPI {
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  postData(data, apiURL) async {
    var fullURL = baseURLAPI + apiURL;
    print(fullURL);
    return await http.post(
      Uri.parse(fullURL),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }
}
