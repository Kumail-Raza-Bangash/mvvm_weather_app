import 'package:get/get.dart';
import 'package:mvvm_weather_app/view_model/controllers/home_controller.dart';

class SplashServices
{
  static void getApiData()
  {
    final controller = Get.put(HomeController());
    controller.getData();
  }
}