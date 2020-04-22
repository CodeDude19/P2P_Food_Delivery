import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "P2P",
          style: TextStyle(
            color: kolor("#283060"),
          ),
        ),
      ),
      body: Center(
        child: Text("Ola!"),
      ),
    );
  }
}
