import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerHome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Appbar

  @override
  Widget build(BuildContext context) {
    barkolor(); // Barkolor can be found in Utils Class , it makes color of status bar White
    return Scaffold(
      drawer: drawerNav(context), // navigation Drawer Widget in Widgets Library
      appBar: homeAppBar(context),
      body: Center(
        child: Text("Hello!"),
      ),
    );
  }
}
