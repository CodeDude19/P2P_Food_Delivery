import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:p2p/screens/cart.dart';

class ProductDetail extends StatefulWidget {
  final String name, imageUrl, price, rating, producer;
  ProductDetail(
      {this.name, this.imageUrl, this.price, this.producer, this.rating});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    backAndCart() {
      return Container(
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(EvaIcons.arrowBackOutline),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 30,
            ),
            IconButton(
              icon: Icon(EvaIcons.shoppingCartOutline),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Cart(); // send it to cart
                }));
              },
              iconSize: 30,
            )
          ],
        ),
      );
    }

    namePrice(name, price) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              name.length > 25 ? name.substring(0, 20) + "...." : name,
              softWrap: true,
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "\$ $price",
              softWrap: true,
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Builder(builder: (context) {
        return Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.only(top: 20, bottom: 100),
              children: <Widget>[
                CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                  imageUrl: widget.imageUrl,
                ),
                SizedBox(height: 20),
                namePrice(widget.name, widget.price),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.producer,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                widget.rating,
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                EvaIcons.star,
                                color: Colors.amber,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "\"A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. ... A hamburger topped with cheese is called a cheeseburger.\"",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                backAndCart(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Cart(); // send it to cart
                            }));
                          },
                          child: Text(
                            "Add to Cart",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.all(10),
                          onPressed: () {
                            // Add logic Function Here
                            final snackBar = SnackBar(
                                content: Text(
                              'Chef Added to Favourites!',
                              style: TextStyle(fontFamily: 'varela'),
                            ));

                            Scaffold.of(context).showSnackBar(snackBar);
                          },
                          child: Text(
                            "Favourite Chef",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
