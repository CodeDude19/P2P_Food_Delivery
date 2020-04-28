import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:p2p/screens/cart.dart';
import 'package:p2p/screens/search.dart';
import 'package:p2p/utils/utils.dart';

homeAppBar(BuildContext context) {
  return AppBar(
    brightness: Brightness.light,
    elevation: 0,
    titleSpacing: 0,
    // centerTitle: true,
    iconTheme: new IconThemeData(
      color:
          thatBlueColor(), // using our primary color, can be found in utils class
    ),
    backgroundColor: Colors.white,
    title: Text(
      "Ghar se Ghar Tak",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: thatBlueColor(),
      ),
    ),
    actions: <Widget>[
      // Search Icon Navigates to Search Page
      IconButton(
        icon: Icon(
          EvaIcons.searchOutline,
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Search();
          }));
        },
      ),
      IconButton(
        icon: Icon(
          EvaIcons.shoppingCartOutline,
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Cart();
          }));
        },
      ),
    ],
  );
}
