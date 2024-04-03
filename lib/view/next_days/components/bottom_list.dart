import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
import 'package:mvvm_weather_app/view_model/controllers/days_controller.dart';
import 'package:mvvm_weather_app/view_model/controllers/home_controller.dart';

class BottomList extends StatelessWidget {
  BottomList({super.key});

  final homeController = Get.put(HomeController());
  final dayController = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 1,
      child: SizedBox(
        height: Dimensions.screenHieght / 5,
        width: Dimensions.screenWidth,
        child: ListView.builder(
          itemCount: homeController.model.value!.days!.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white38,
              margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top:
                    index == 0 ? Dimensions.height10 * 23 : Dimensions.height10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
              ),
              child: Container(
                height: Dimensions.height20 * 4,
                width: Dimensions.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.white38,
                ),
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      dayController.getDate(index),
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font16,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: dayController.getMinTemp(index),
                            style: TextStyle(
                              color: Colors.grey.withOpacity(.5),
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font26,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '/',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font26,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: dayController.getMaxTemp(index),
                            style: TextStyle(
                              color: Colors.grey.withOpacity(.5),
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font26,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      dayController.getImage(index),
                      height: Dimensions.height10 * 7,
                      width: Dimensions.width10 * 7,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
