// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_weather_app/data/app_exceptions.dart';
import 'package:mvvm_weather_app/data/network/base_api_services.dart';

class ApiServices extends BaseApiServices
{
  dynamic jsonResponse(http.Response response)
  {
    switch(response.statusCode)
    {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      case 400:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      default:
        throw FetchDataException(
          'Error while communication ${response.statusCode}'
        ); 
    }
  }


  @override
  Future getApi (String url) async 
  {
    var jsonData;
    try
    {
      var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonData = jsonResponse(response);
    } on RequestTimeOut 
    {
      throw RequestTimeOut('Request TimeOut');
    } on SocketException 
    {
      throw RequestTimeOut('No Internet');
    }

    return jsonData;
  }



}