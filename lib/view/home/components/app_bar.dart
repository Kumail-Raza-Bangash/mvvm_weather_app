import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_weather_app/resourses/images/image_assets.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(Dimensions.radius15/2),
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        SizedBox(width: Dimensions.width10),

        Padding(
          padding: EdgeInsets.all(Dimensions.radius15/2),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.white,
          ),
        ),

        const Spacer(),

        Padding(
          padding: EdgeInsets.all(Dimensions.radius15/2),
          child: Image.asset(
            ImageAssets.nightRain,
            height: Dimensions.height45,
            width: Dimensions.width45,
          ),
        ),  

      ],
    );
  }
}