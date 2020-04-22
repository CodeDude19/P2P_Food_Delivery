import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';

homeAppBar() {
  return AppBar(
    titleSpacing: 0,
    iconTheme: new IconThemeData(
      color:
          thatBlueColor(), // using our primary color, can be found in utils class
    ),
    backgroundColor: Colors.white,
    title: Text(
      "Ghar se Ghar Tak",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: kolor("#283060"),
      ),
    ),
    actions: <Widget>[
      // Search Icon Navigates to Search Page
      IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: () {
            print("Search");
          }),
    ],
  );
}
