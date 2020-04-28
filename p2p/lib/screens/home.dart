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
  List<String> carouselData = [
    "10% discount on your First Order!",
    "Exclusive deals on Plaform Launch!",
    "Find your Favourite Home Chef Now!"
  ];

  thatCarousel() {
    return CarouselSlider(
      aspectRatio: 16 / 9,
      initialPage: 0,
      height: MediaQuery.of(context).size.height * 0.25,
      items: carouselData.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      i,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        "https://github.com/CodeDude19/P2P_Food_Delivery/blob/master/p2p/assets/images/food_delivery.png?raw=true",
                    fit: BoxFit.cover,
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kolor("e1e2e1"),
      drawer: drawerNav(context), // navigation Drawer Widget in Widgets Library
      appBar: homeAppBar(context),
      body: ListView(
        padding: EdgeInsets.only(top: 10, bottom: 100),
        children: <Widget>[
          thatCarousel(),
        ],
      ),
    );
  }
}
