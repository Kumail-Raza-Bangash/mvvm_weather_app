import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/resourses/images/image_assets.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
import 'package:mvvm_weather_app/view/home/components/small_container.dart';
import 'package:mvvm_weather_app/view_model/controllers/home_controller.dart';

class ContainerList extends StatelessWidget {
  ContainerList({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.radius30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => SmallContainer(
              text: '${controller.getCloudOver()}%',
              image: ImageAssets.heavyRain,
              color: Colors.black54,
              textColor: Colors.white,
            ),
          ),
          Obx(
            () => SmallContainer(
              text: '${controller.getWindSpeed()}km/h',
              image: ImageAssets.wind,
              color: Colors.black54,
              textColor: Colors.white,
            ),
          ),
          Obx(
            () => SmallContainer(
              text: '${controller.getHumidity()}%',
              image: ImageAssets.sun,
              color: Colors.black54,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
