import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/column_builder.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class OrderStatus extends StatefulWidget {
  final String orderId;
  OrderStatus({this.orderId});
  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  String orderId;
  String time = "6:45 PM";
  String oStatus = "Preparing";
  String total = "\$ 550";
  @override
  void initState() {
    super.initState();
    // orderId = widget.orderId;
    orderId = "#2343GHI1";
  }

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
  ];

  mealCard(name, producer, rating, price, image) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
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

  // After Receiving the order ID the order details needs to be streamed
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerGeneral("Order Details"),
      backgroundColor: kolor("e1e2e1"),
      body: ListView(
        padding: EdgeInsets.only(top: 10, bottom: 100, left: 10, right: 10),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ListTile(
              title: Text(
                "Order ID : $orderId",
                style: TextStyle(fontSize: 17),
              ),
              trailing: Text(
                "Total  : $total",
                style: TextStyle(fontSize: 17),
              ),
              subtitle: Text(
                "Ordered at : $time",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Text(
              "Ordered Items",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            indent: 10,
            endIndent: MediaQuery.of(context).size.width * 0.4,
            color: Colors.black38,
            thickness: 1,
          ),
          // it needs to  be streamed what were ordered through the order id
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
}
