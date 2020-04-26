import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';
import 'package:p2p/widgets/loading.dart';

class Address extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Address> {
  TextEditingController addressName, address;
  bool showDialog = false;
  bool loader = false;
  List<List<String>> addresses = [
    [
      "Address Name 1",
      "36B Stillwater St.Hopkinsville, KY 42240, KY 42240, KY 42240"
    ],
    ["Address Name 2", "457 Newcastle Ave.Monroe, NY 10950, NY 10950, NY 10950"]
  ];

  nameRows(x, controllerX) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          style: TextStyle(fontSize: 16),
          controller: controllerX,
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            hintText: x,
            hintStyle: TextStyle(fontSize: 16),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }

  dialogView(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.6),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  nameRows("Address Name", addressName),
                  SizedBox(height: 10),
                  nameRows("Address", address),
                  SizedBox(height: 5),
                  submitButton("Cancel", Colors.red),
                  submitButton("Submit", Colors.green),
                ],
              )),
        ],
      ),
    );
  }

  submitButton(name, MaterialColor color) {
    return FlatButton(
      padding: EdgeInsets.all(5),
      color: color.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: () {
        setState(() {
          showDialog = false;
          // loader = true;
        });
      },
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }

  addressCard(x, y) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            x,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          SizedBox(height: 5),
          Divider(
            height: 10,
            thickness: 2,
            color: kolor("F0F1F0"),
          ),
          SizedBox(height: 5),
          Text(
            y,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.all(5),
                color: Colors.red.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {},
                child: Center(
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kolor("#E2E2E2"),
      appBar: headerGeneral("Address"),
      drawer: drawerNav(context),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 100,
              left: 10,
              right: 10,
            ),
            children: <Widget>[
              addressCard(addresses[0][0], addresses[0][1]),
              addressCard(addresses[1][0], addresses[1][1]),
            ],
          ),
          loader ? loading(context) : Text(""),
          showDialog ? dialogView(context) : Text(""),
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
          onPressed: () {
            setState(() {
              showDialog = true;
              loader = false;
            });
          },
        ),
      ),
    );
  }
}
