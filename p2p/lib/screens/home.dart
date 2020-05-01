import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:p2p/screens/productDetail.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/column_builder.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerHome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool lowTohigh = true;
  List<int> nos = [0, 1, 2];
  List<String> carouselData = [
    "10% discount on your First Order!",
    "Exclusive deals on Plaform Launch!",
    "Find your Favourite Home Chef Now!"
  ];
  List<String> links = [
    "https://github.com/CodeDude19/P2P_Food_Delivery/blob/master/p2p/assets/images/food_delivery.png?raw=true",
    "https://github.com/CodeDude19/P2P_Food_Delivery/blob/master/p2p/assets/images/exclusive.png?raw=true",
    "https://github.com/CodeDude19/P2P_Food_Delivery/blob/master/p2p/assets/images/chef.png?raw=true",
  ];

  List<List<String>> foodItems = [
    [
      "Special Maggi",
      "Usha Chauhan",
      "4.7",
      "200",
      "https://m.media-amazon.com/images/S/aplus-media/vc/139791f0-ce66-4154-9893-9aee9754331c._CR0,0,626,626_PT0_SX300__.jpg"
    ],
    [
      "Fish Curry",
      "Richa Chakraborty",
      "4.1",
      "350",
      "https://www.whiskaffair.com/wp-content/uploads/2018/05/Kerala-Fish-Curry-1.jpg"
    ],
    [
      "Chicken Curry",
      "Meghna Das",
      "3.9",
      "300",
      "https://www.seriouseats.com/recipes/images/2011/12/20111227-indian-curry-610.jpg"
    ],
    [
      "Dal Rice",
      "Richa Chakraborty",
      "4.6",
      "170",
      "https://40aprons.com/wp-content/uploads/2019/08/instant-pot-dal-6-500x500.jpg"
    ],
    [
      "Gulab Zamun",
      "Komal Das",
      "4.9",
      "90",
      "https://smedia2.intoday.in/aajtak/images/stories/102015/gulam-jamun-pakwangali_520_102815120718.jpg"
    ],
  ];

  thatCarousel() {
    return CarouselSlider(
      aspectRatio: 16 / 9,
      initialPage: 0,
      height: MediaQuery.of(context).size.height * 0.25,
      items: nos.map((i) {
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
                      carouselData[i],
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: links[i],
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

  mealCard(name, producer, rating, price, image) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ProductDetail(
              name: name,
              imageUrl: image,
              price: price,
              rating: rating,
              producer: producer,
            );
          }));
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        isThreeLine: true,
        leading: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
        ),
        title: Text(name, style: TextStyle(fontSize: 17)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(producer),
            Row(
              children: <Widget>[
                Text(rating),
                SizedBox(width: 10),
                Icon(
                  EvaIcons.star,
                  color: Colors.amber,
                )
              ],
            )
          ],
        ),
        trailing: Text(
          "\$ $price",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  "Choose your Meal",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                  alignment: Alignment.bottomCenter,
                  icon: Icon(
                    EvaIcons.menu2Outline,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _settingModalBottomSheet(context);
                  }),
            ],
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.black38,
            thickness: 1,
          ),
          ColumnBuilder(
              itemBuilder: (context, index) {
                return mealCard(
                    foodItems[index][0],
                    foodItems[index][1],
                    foodItems[index][2],
                    foodItems[index][3],
                    foodItems[index][4]);
              },
              itemCount: foodItems.length)
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.all(20),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    "Price Low to High",
                    style: TextStyle(
                        color: lowTohigh == true ? Colors.green : Colors.black,
                        fontSize: 20),
                  ),
                  onTap: () {
                    setState(() {
                      lowTohigh = true;
                      Navigator.of(context).pop();
                    });
                  },
                ),
                Divider(
                  color: Colors.black45,
                  height: 40,
                ),
                GestureDetector(
                  child: Text(
                    "Price High to Low",
                    style: TextStyle(
                        color: lowTohigh == true ? Colors.black : Colors.green,
                        fontSize: 20),
                  ),
                  onTap: () {
                    setState(() {
                      lowTohigh = false;
                      Navigator.of(context).pop();
                    });
                  },
                )
              ],
            ),
          );
        });
  }
}
