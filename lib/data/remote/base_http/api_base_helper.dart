import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:weather_app_flutter/data/remote/base_http/http_exceptions.dart';

class ApiBaseHelper {
  final String baseUrl;

  ApiBaseHelper(this.baseUrl);

  Future get(String url) async {
    var responseJson;
    try {
      final response = await get(baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body);
      case 404:
        throw NoResultsException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
