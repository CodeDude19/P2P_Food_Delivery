import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class Profile extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Profile> {
  TextEditingController tcName, tcGender, tcMobile, tcEmail;

  fieldRows(x, controllerX) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: TextField(
          controller: controllerX,
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            hintText: x,
            hintStyle: TextStyle(fontSize: 20),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    barkolor();
    return Scaffold(
      backgroundColor: kolor("#F2F5FB"),
      appBar: headerGeneral("Profile"),
      drawer: drawerNav(context),
      body: ListView(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 16, right: 16),
        children: <Widget>[
          fieldRows(
            "Name",
            tcName,
          ),
          SizedBox(height: 16),
          fieldRows(
            "Gender",
            tcGender,
          ),
          SizedBox(height: 16),
          fieldRows(
            "Mobile",
            tcMobile,
          ),
          SizedBox(height: 16),
          fieldRows(
            "Email",
            tcEmail,
          ),
        ],
      ),
    );
  }
}
