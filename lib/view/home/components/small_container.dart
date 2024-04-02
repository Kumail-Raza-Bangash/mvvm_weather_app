import 'package:flutter/material.dart';
import 'package:mvvm_weather_app/utils/dimensions.dart';

class SmallContainer extends StatefulWidget {
  final String text;
  final String image;
  final Color? color;
  final Color? textColor;

  const SmallContainer({
    super.key,
    required this.text,
    required this.image,
    required this.color,
    required this.textColor,
  });

  @override
  State<SmallContainer> createState() => _SmallContainerState();
}

class _SmallContainerState extends State<SmallContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: Dimensions.height30 * 2,
          width: Dimensions.width30 * 2,
          decoration: BoxDecoration(
            color: widget.color ?? Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.circular(Dimensions.radius20),
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.radius15 / 2),
            child: Image.asset(
              widget.image,
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height10 / 2,
        ),
        Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.textColor ?? Colors.black,
          ),
        )
      ],
    );
  }
}
