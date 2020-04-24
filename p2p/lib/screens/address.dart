import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class Address extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Address> {
  List<List<String>> addresses = [
    [
      "Address Name 1",
      "36B Stillwater St.Hopkinsville, KY 42240, KY 42240, KY 42240"
    ],
    ["Address Name 2", "457 Newcastle Ave.Monroe, NY 10950, NY 10950, NY 10950"]
  ];

  addressCard(x, y) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            x,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            y,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: FlatButton(
              padding: EdgeInsets.all(5),
              color: Colors.pink.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {},
              child: Center(
                child: Text(
                  "Delete",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    barkolor();
    return Scaffold(
      backgroundColor: kolor("#F2F5FB"),
      appBar: headerGeneral("Address"),
      drawer: drawerNav(context),
      body: ListView(
        padding: EdgeInsets.only(
          top: 20,
          bottom: 100,
          left: 16,
          right: 16,
        ),
        children: <Widget>[
          addressCard(addresses[0][0], addresses[0][1]),
          addressCard(addresses[1][0], addresses[1][1]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.green,
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
