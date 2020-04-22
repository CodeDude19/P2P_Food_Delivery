import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color kolor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}

thatBlueColor() {
  return kolor("#282860");
}

barkolor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
  ));
}

mainKolor() {
  return kolor("#2FE388");
}
