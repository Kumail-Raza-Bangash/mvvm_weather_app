import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/resourses/color/colors.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
import 'package:mvvm_weather_app/view/next_days/components/bottom_list.dart';
import 'package:mvvm_weather_app/view/next_days/components/center_card.dart';
import 'package:mvvm_weather_app/view/next_days/components/days_app_bar.dart';
import 'package:mvvm_weather_app/view/next_days/components/days_list.dart';
import 'package:mvvm_weather_app/view_model/controllers/days_controller.dart';
import 'package:mvvm_weather_app/view_model/controllers/home_controller.dart';

class NextDays extends StatelessWidget {
  NextDays({super.key});

  final homeController = Get.put(HomeController());
  final daysController = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradiantBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SizedBox(
            height: Dimensions.screenHieght,
            width: Dimensions.screenWidth,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    const DaysAppBar(),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    DaysList(),
                  ],
                ),
                Positioned(
                  bottom: 1,
                  child: Container(
                    height: Dimensions.screenHieght / 4,
                    width: Dimensions.screenWidth,
                    padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      left: Dimensions.width10 / 2,
                      right: Dimensions.width10 / 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20 * 3),
                        topLeft: Radius.circular(Dimensions.radius20 * 3),
                      ),
                    ),
                  ),
                ),
                BottomList(),
                Hero(
                  tag: 'TAG',
                  child: Material(
                    color: Colors.transparent,
                    child: CenterCard(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
