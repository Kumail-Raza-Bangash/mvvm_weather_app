import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/resourses/images/image_assets.dart';
import 'package:mvvm_weather_app/view/home/components/small_container.dart';
import 'package:mvvm_weather_app/view_model/controllers/days_controller.dart';
import 'package:mvvm_weather_app/view_model/controllers/home_controller.dart';

class SmallContainerList extends StatelessWidget {
  SmallContainerList({super.key});

  final homeController = Get.put(HomeController());
  final daysController = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Obx(
          () => SmallContainer(
            text: '${daysController.day.value.precipprob.toInt().toString()}%',
            image: ImageAssets.heavyRain,
            color: Colors.white38,
            textColor: Colors.white,
          ),
        ),
        const Spacer(),
        Obx(
          () => SmallContainer(
            text:
                '${daysController.day.value.windspeed.toInt().toString()}km/h',
            image: ImageAssets.wind,
            color: Colors.white38,
            textColor: Colors.white,
          ),
        ),
        const Spacer(),
        Obx(
          () => SmallContainer(
            text: '${daysController.day.value.humidity.toInt().toString()}%',
            image: ImageAssets.sun,
            color: Colors.white38,
            textColor: Colors.white,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
