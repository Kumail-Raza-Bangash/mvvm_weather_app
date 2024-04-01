import 'package:mvvm_weather_app/data/network/api_services.dart';
import 'package:mvvm_weather_app/resourses/app_url/app_url.dart';

class HomeRepo 
{
  static Future<dynamic> hitApi() async 
  {
    var response = await ApiServices().getApi(AppUrl.url);
    return response;
  }
}