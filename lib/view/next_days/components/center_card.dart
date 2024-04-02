import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
import 'package:mvvm_weather_app/view_model/controllers/days_controller.dart';
import 'package:mvvm_weather_app/view_model/controllers/home_controller.dart';

class CenterCard extends StatelessWidget {
  CenterCard({super.key});

  final homeController = Get.put(HomeController());
  final daysController = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height45*10,
      width: Dimensions.screenWidth,
      margin: EdgeInsets.only(top: Dimensions.height20 * 4),
      child: Stack(
        children: [
          Positioned(
            bottom: Dimensions.height10 * 5,
            left: Dimensions.width30,
            right: Dimensions.width30,
            child: Container(
              height: Dimensions.height30 * 12,
              width: Dimensions.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15 * 3),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.withOpacity(.7),
                    Colors.blue.withOpacity(.5),
                    Colors.blue.withOpacity(.7),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: Dimensions.width30,
                        top: Dimensions.height10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.white.withOpacity(.5)
                                ],
                              ).createShader(bounds);
                            },
                            child: Obx(
                              () => Text(
                                '${daysController.day.value.temp.toInt().toString()}\u00B0',
                                style: TextStyle(
                                  color: Colors.white,
                                  height: 0,
                                  fontSize: Dimensions.font20 * 4,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
