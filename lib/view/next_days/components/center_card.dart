import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/resourses/images/image_assets.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
import 'package:mvvm_weather_app/utils/utils.dart';
import 'package:mvvm_weather_app/view/next_days/components/small_container_list.dart';
import 'package:mvvm_weather_app/view_model/controllers/days_controller.dart';
import 'package:mvvm_weather_app/view_model/controllers/home_controller.dart';

class CenterCard extends StatelessWidget {
  CenterCard({super.key});

  final homeController = Get.put(HomeController());
  final daysController = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height45 * 9,
      width: Dimensions.screenWidth,
      margin: EdgeInsets.only(top: Dimensions.height10 / 2),
      child: Stack(
        children: [
          Positioned(
            top: Dimensions.height10,
            bottom: Dimensions.height10,
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
                          Obx(
                            () => Text(
                              'Feel like ${daysController.day.value.feelslike}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.6),
                                height: 0,
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimensions.width30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Obx(
                            () => Text(
                              '${daysController.day.value.conditions}',
                              style: TextStyle(
                                color: Colors.white,
                                height: 0,
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height10 / 2,
                          ),
                          Text(
                            Utils.currentTime(DateTime.now()),
                            style: TextStyle(
                              color: Colors.white.withOpacity(.6),
                              height: 0,
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),

                  //
                  Align(
                    alignment: Alignment.centerRight,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.white.withOpacity(.5)],
                        ).createShader(bounds);
                      },
                      child: Image.asset(
                        ImageAssets.windWave,
                        height: Dimensions.height10 * 12,
                        width: Dimensions.width20 * 10,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //
                  Positioned(
                    bottom: Dimensions.height30,
                    child: SizedBox(
                      width: Dimensions.screenWidth - 60,
                      child: SmallContainerList(),
                    ),
                  ),
                  Positioned(
                    left: Dimensions.width10,
                    child: Obx(
                      () => Image.asset(
                        daysController
                            .getImage(daysController.currentDay.value),
                        height: Dimensions.height20 * 8,
                        width: Dimensions.width20 * 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
