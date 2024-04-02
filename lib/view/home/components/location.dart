import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/resourses/images/image_assets.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
import 'package:mvvm_weather_app/utils/utils.dart';
import 'package:mvvm_weather_app/view_model/controllers/home_controller.dart';

class Location extends StatelessWidget {
  Location({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.getAddress(),
              style: TextStyle(
                height: 0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.font20,
              ),
            ),
            Text(
              Utils.formateDate(DateTime.now()),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.font16,
              ),
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          height: Dimensions.height10 * 12,
          width: Dimensions.width10 * 12,
          child: Padding(
            padding: EdgeInsets.all(Dimensions.radius20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              child: Image.asset(
                ImageAssets.map,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
