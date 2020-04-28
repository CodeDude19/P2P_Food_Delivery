import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerHome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Appbar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kolor("e1e2e1"),
      drawer: drawerNav(context), // navigation Drawer Widget in Widgets Library
      appBar: homeAppBar(context),
      body: ListView(
        children: <Widget>[
          // CarouselSlider(
          //   enlargeCenterPage: true,
          //   aspectRatio: 16 / 9,
          //   initialPage: 0,
          //   height: MediaQuery.of(context).size.height * 0.3,
          //   items: urls.map((i) {
          //     return Builder(
          //       builder: (BuildContext context) {
          //         return;
          //       },
          //     );
          //   }).toList(),
          // )
        ],
      ),
    );
  }
}
