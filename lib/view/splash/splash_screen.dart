
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_weather_app/resourses/color/colors.dart';
import 'package:mvvm_weather_app/resourses/images/image_assets.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';
import 'package:mvvm_weather_app/view_model/services/splash_screen/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this, 
      duration: const Duration(seconds: 4))..forward();
    
    animation = CurvedAnimation(
      parent: controller, 
      curve: Curves.linear);

      Timer(
      const Duration(seconds: 5),
      () {
        SplashServices.getApiData();
      });

      

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradiantBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                ImageAssets.nightStarRain,
                width: Dimensions.splashImg,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
