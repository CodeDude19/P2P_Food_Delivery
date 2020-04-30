import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:p2p/screens/order_status.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/column_builder.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class Orders extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Orders> {
  List<List<String>> ordersList = [
    ["live", "Caramel Milk Sambhar", "200", "26th March 2018"],
    [
      "previous",
      "Caramel Milk Sambhar & Biscoot & Peanut Cake & Your Nuts and Balls",
      "200",
      "26th March 2018"
    ],
    ["previous", "Caramel Milk Sambhar", "200", "26th March 2018"],
    ["previous", "Caramel Milk Sambhar", "200", "26th March 2018"],
  ];

  List<List<String>> _onGoing = [];
  List<List<String>> _previous = [];

  orderCard(name, money, date) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OrderStatus();
          }));
        },
        dense: true,
        contentPadding: EdgeInsets.all(0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            imageUrl:
                "https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1928&q=80",
            width: MediaQuery.of(context).size.width * 0.2,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 15),
        ),
        subtitle: Text(
          date,
          style: TextStyle(fontSize: 12),
        ),
        trailing: Text(
          "\$ " + money,
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    ordersList.forEach((x) {
      if (x[0] == "live") _onGoing.add(x);
      if (x[0] == "previous") _previous.add(x);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kolor("#e1e2e1"),
      appBar: headerGeneral("Orders"),
      drawer: drawerNav(context),
      body: ListView(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 100),
        children: <Widget>[
          // Container(
          //   padding: EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     color: kolor("#95a5a6").withOpacity(0.8),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Text(
          //     "On Going",
          //     style: TextStyle(fontSize: 30, color: Colors.white),
          //   ),
          // ),
          // SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Text(
              "Ongoing ",
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
          ColumnBuilder(
            itemBuilder: (context, index) {
              return orderCard(
                  _onGoing[index][1], _onGoing[index][2], _onGoing[index][3]);
            },
            itemCount: _onGoing.length,
          ),
          SizedBox(height: 10),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     color: kolor("#95a5a6").withOpacity(0.8),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Text(
          //     "Previous",
          //     style: TextStyle(fontSize: 30, color: Colors.white),
          //   ),
          // ),
          // SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Text(
              "Previous",
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
          ColumnBuilder(
            itemBuilder: (context, index) {
              return orderCard(_previous[index][1], _previous[index][2],
                  _previous[index][3]);
            },
            itemCount: _previous.length,
          ),
        ],
      ),
    );
  }
}
