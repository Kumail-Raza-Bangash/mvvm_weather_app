import 'package:flutter/material.dart';
import 'package:mvvm_weather_app/resourses/color/colors.dart';
import 'package:mvvm_weather_app/resourses/images/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: AppColors.buildGradiantBoxDecoration(),
        child: Center(
          child: Image.asset(
            ImageAssets.nightStarRain,
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
