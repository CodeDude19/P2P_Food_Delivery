import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class Account extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    barkolor();
    return Scaffold(
      appBar: headerGeneral("Account"),
      drawer: drawerNav(context),
      body: Center(
        child: Text("Ola!"),
      ),
    );
  }
}
