import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/resourses/color/colors.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
import 'package:mvvm_weather_app/view/home/components/app_bar.dart';
import 'package:mvvm_weather_app/view/home/components/container_list.dart';
import 'package:mvvm_weather_app/view/home/components/hours_list.dart';
import 'package:mvvm_weather_app/view/home/components/info_card.dart';
import 'package:mvvm_weather_app/view/home/components/location.dart';
import 'package:mvvm_weather_app/view/next_days/next_days.dart';
import 'package:mvvm_weather_app/view_model/controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradiantBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.radius20),
            child: Column(
              children: [
                SizedBox(height: Dimensions.height15),
                const CustomAppBar(),
                SizedBox(height: Dimensions.height15),
                Location(),
                SizedBox(height: Dimensions.height15),
                Hero(
                  tag: 'Tag', 
                  child: Material(
                    color: Colors.transparent,
                    child: InfoCard(),
                  )
                ),
                ContainerList(),
                SizedBox(height: Dimensions.height45),
                Row(
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font26,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Get.to(() => const NextDays()),
                      child: Text(
                        'Next 14 Days >',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.font20,
                        ),
                      ),
                    ),
                  ],
                ),
                HoursList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
