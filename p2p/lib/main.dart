import 'package:flutter/material.dart';
import 'package:p2p/screens/home.dart';
import 'package:p2p/utils/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kolor("#283060"),
      ),
      home: Home(),
    );
  }
}
