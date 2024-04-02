import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/resourses/images/image_assets.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
import 'package:mvvm_weather_app/utils/utils.dart';
import 'package:mvvm_weather_app/view_model/controllers/home_controller.dart';

class InfoCard extends StatelessWidget {
  InfoCard({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height10*23,
      width: Dimensions.screenWidth,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: Dimensions.height10*20,
            margin: EdgeInsets.only(bottom: Dimensions.height30),
            width: Dimensions.screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.withOpacity(.3),
                  Colors.blue.withOpacity(.4),
                  Colors.blue.withOpacity(.3),
                ]
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height10,
            left: Dimensions.width20,
            child: Obx(() => Image.asset(
              controller.getImage(controller.currentIndex.value),
              height: Dimensions.height10*12,
              width: Dimensions.width10*10,
              fit: BoxFit.cover,
            ),),
          ),
          Positioned(
            bottom: Dimensions.height10*5,
            left: Dimensions.width20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text(
                  controller.getCondition(),
                  style: TextStyle(
                    height: 0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.font26,
                  ),
                ),
                ),

                SizedBox(height: Dimensions.height10/5,),

                Text(
                  Utils.currentTime(DateTime.now()),
                  style: TextStyle(
                    height: 0,
                    color: Colors.white.withOpacity(.8),
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.font16,
                  ),
                )
              ],
            ),
          ),

          Positioned(
            top: Dimensions.height10,
            right: Dimensions.width20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(.1),
                      ]
                    ).createShader(bounds);
                  },
                  child: Obx(() => Text(
                    controller.getCurrentTemp(),
                    style: TextStyle(
                    height: 0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.font20 * 4,
                  ),
                  ),),
                ),

                Obx(() => Text(
                    "Feel like ${controller.getFeelLike()}",
                    style: TextStyle(
                    height: 0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.font20,
                  ),
                  ),),
              ],
            )
          ),

          Positioned(
            bottom: Dimensions.height10*2,
            right: Dimensions.width10-35,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(.1),
                  ]
                ).createShader(bounds);
              },
              child: Image.asset(ImageAssets.windWave, height: Dimensions.height20*5, width: Dimensions.width20*10,),
            )
          ),
        ],
      ),
    );
  }
}