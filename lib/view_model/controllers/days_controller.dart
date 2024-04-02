import 'package:get/get.dart';
import 'package:mvvm_weather_app/model/data_model.dart';
import 'package:mvvm_weather_app/resourses/images/image_assets.dart';
import 'package:mvvm_weather_app/utils/utils.dart';
import 'package:mvvm_weather_app/view_model/controllers/home_controller.dart';

class DaysController extends GetxController {
  Rx<int> currentDay = 0.obs;
  final homeController = Get.put(HomeController());
  late Rx<Days> day;

  DaysController() {
    day = homeController.model.value!.days![0].obs;
  }

  setDay(int index) {
    day.value = homeController.model.value!.days![index];
    currentDay.value = index;
  }

  String getImage(int index) {
    Utils utils = Utils();
    return utils.imageMap[
                homeController.model.value!.days![index].conditions] ==
            null
        ? ImageAssets.nightStarRain
        : Utils().imageMap[homeController.model.value!.days![index].conditions]!;
  }

  String getMonth(int index)
  {
    String date = homeController.model.value!.days![index].datetime.toString();
    return Utils.extractDate(date);
  }

  String getMonthDay(int index)
  {
    String date = homeController.model.value!.days![index].datetime.toString();
    return Utils.extractDay(date);
  }

  String getDate(int index)
  {
    DateTime date = DateTime.parse(homeController.model.value!.days![index].datetime.toString());
    return Utils.formateDate(date);
  }

  String getMinTemp(int index)
  {
    return "${homeController.model.value!.days![index].tempmin!.toInt().toString()}\u00B0";
  }

  String getMaxTemp(int index)
  {
    return "${homeController.model.value!.days![index].tempmax!.toInt().toString()}\u00B0";
  }

}
