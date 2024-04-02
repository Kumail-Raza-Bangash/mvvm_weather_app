import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
import 'package:mvvm_weather_app/view_model/controllers/home_controller.dart';

class HoursList extends StatelessWidget {
  HoursList({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height20 * 8,
      width: Dimensions.screenWidth,
      child: ListView.builder(
        itemCount: controller.model.value!.days![0].hours!.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: Dimensions.radius20 / 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.setHour(index),
            child: Column(
              children: [
                Obx(
                  () => Card(
                    elevation: 10,
                    margin:
                        EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    shadowColor: controller.compareIndex(index)
                        ? Colors.blue
                        : Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius15 * 3),
                    ),
                    child: Obx(
                      () => Container(
                        height: Dimensions.height20 * 7,
                        width: Dimensions.width20 * 4,
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensions.height10),
                        decoration: BoxDecoration(
                          color: controller.compareIndex(index)
                              ? Colors.blue
                              : Colors.white70,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15 * 3),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                controller.getHour(index),
                                style: TextStyle(
                                  color: controller.compareIndex(index)
                                      ? Colors.white
                                      : Colors.grey,
                                    fontSize: Dimensions.font16,
                                ),
                              ),
                            ),
                            Obx(
                              () => Image.asset(
                                controller.getImage(index),
                                height: Dimensions.height10 * 5,
                                width: Dimensions.width10 * 5,
                              ),
                            ),
                            Text(
                              '${controller.model.value!.days![0].hours![index].temp.toInt()}\u00B0',
                              style: TextStyle(
                                color: controller.compareIndex(index)
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.font20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
