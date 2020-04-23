import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  searchbar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 1, color: Colors.black12),
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            color: Colors.green,
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  hintText: "Search..."),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    barkolor();
    return Scaffold(
      backgroundColor: kolor("#F2F5FB"),
      drawer: drawerNav(context),
      appBar: headerGeneral("What to eat?"),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: searchbar(),
          ),
        ],
      ),
    );
  }
}
