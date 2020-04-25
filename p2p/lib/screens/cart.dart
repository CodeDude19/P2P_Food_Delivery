import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class Cart extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Cart> {
  itemCard(itemName, itemPrice) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl:
                  "https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1928&q=80",
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                itemName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                softWrap: true,
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.05)),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              EvaIcons.arrowCircleDownOutline,
                              color: Colors.red,
                            ),
                            onPressed: () {}),
                        SizedBox(width: 10),
                        Text(
                          "x 3",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            EvaIcons.arrowCircleUpOutline,
                            color: Colors.green,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "\$ $itemPrice",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kolor("F0F1F0"),
      appBar: headerGeneral("Cart"),
      drawer: drawerNav(context),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(top: 10, bottom: 300, left: 10, right: 10),
            children: <Widget>[
              itemCard("Margherita Pizza", 649),
              itemCard("Burger", 127),
              itemCard("Pasta", 223),
              itemCard("Butterscotch", 367),
              itemCard("Choco Lava Cake", 270),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "TOTAL",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: thatBlueColor()),
                            softWrap: true,
                          ),
                          Text(
                            "\$ 1267",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: thatBlueColor()),
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 20),
                      child: FlatButton(
                        padding: EdgeInsets.all(16),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
