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

colorList() {
  return [
    "#fc5c65",
    "#fd9644",
    "#fed330",
    "#26de81",
    "#45aaf2",
    "#4b7bec",
    "#a55eea",
    "#778ca3",
    "#f7b731",
    "#0fb9b1",
    "#fc5c65",
    "#fd9644",
    "#fed330",
    "#26de81",
    "#45aaf2",
    "#4b7bec",
    "#a55eea",
    "#778ca3",
    "#f7b731",
    "#0fb9b1",
    "#fc5c65",
    "#fd9644",
    "#fed330",
    "#26de81",
    "#45aaf2",
    "#4b7bec",
    "#a55eea",
    "#778ca3",
    "#f7b731",
    "#0fb9b1",
    "#fc5c65",
    "#fd9644",
    "#fed330",
    "#26de81",
    "#45aaf2",
    "#4b7bec",
    "#a55eea",
    "#778ca3",
    "#f7b731",
    "#0fb9b1",
    "#fc5c65",
    "#fd9644",
    "#fed330",
    "#26de81",
    "#45aaf2",
    "#4b7bec",
    "#a55eea",
    "#778ca3",
    "#f7b731",
    "#0fb9b1",
    "#fc5c65",
    "#fd9644",
    "#fed330",
    "#26de81",
    "#45aaf2",
    "#4b7bec",
    "#a55eea",
    "#778ca3",
    "#f7b731",
    "#0fb9b1",
  ];
}
