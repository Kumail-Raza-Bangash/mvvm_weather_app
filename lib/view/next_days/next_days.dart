import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/resourses/color/colors.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
