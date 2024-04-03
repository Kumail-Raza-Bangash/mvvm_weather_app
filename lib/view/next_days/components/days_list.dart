import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
import 'package:mvvm_weather_app/view_model/controllers/days_controller.dart';

class DaysList extends StatelessWidget {
  DaysList({super.key});

  final controller = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height20 * 6.5,
      width: Dimensions.screenWidth,
      padding: EdgeInsets.only(
        left: Dimensions.width10,
        right: Dimensions.width10,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.homeController.model.value!.days!.length,
        itemBuilder: (context, index) {
          return Obx(
            () => GestureDetector(
              onTap: () => controller.setDay(index),
              child: Container(
                width: Dimensions.width15 * 5,
                margin: EdgeInsets.only(left: Dimensions.width20),
                decoration: BoxDecoration(
                  color: controller.currentDay.value == index
                      ? Colors.white
                      : Colors.white12,
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Dimensions.height10 * 5,
                      width: Dimensions.width10 * 5,
                      child: Image.asset(
                        controller.getImage(index),
                      ),
                    ),
                    Text(
                      controller.getMonth(index),
                      style: TextStyle(
                        color: controller.currentDay.value == index
                            ? Colors.purple
                            : Colors.white,
                        height: 0,
                        fontSize: Dimensions.font26 + 4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      controller.getMonthDay(index),
                      style: TextStyle(
                        color: controller.currentDay.value == index
                            ? Colors.purple
                            : Colors.white,
                        height: 0,
                        fontSize: Dimensions.font26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
