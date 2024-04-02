import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';

class DaysAppBar extends StatelessWidget {
  const DaysAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: Dimensions.height20 * 2,
              width: Dimensions.width20 * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.blue,
                size: Dimensions.font20,
              ),
            ),
          ),
          Text(
            'Next 14 Days',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.font26,
            ),
          )
        ],
      ),
    );
  }
}
