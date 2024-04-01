import 'package:flutter/material.dart';

class AppColors {
  static BoxDecoration buildGradiantBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.white60,
          Colors.greenAccent,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
    );
  }
}
