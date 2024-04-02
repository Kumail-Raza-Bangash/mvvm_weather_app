import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/resourses/color/colors.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
import 'package:mvvm_weather_app/view/home/components/app_bar.dart';
import 'package:mvvm_weather_app/view/home/components/container_list.dart';
import 'package:mvvm_weather_app/view/home/components/info_card.dart';
import 'package:mvvm_weather_app/view/home/components/location.dart';
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
                Hero(
                  tag: 'Tag', 
                  child: Material(
                    color: Colors.transparent,
                    child: InfoCard(),
                  )
                ),
                ContainerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
