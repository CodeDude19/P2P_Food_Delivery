import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class Favourites extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Favourites> {
  List<String> chefs = [
    "Yasser Arafat Sayani",
    "Vatsalya Singh Rajputh",
    "Arnab Biswas"
  ];
  deleteDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("NO")),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("YES")),
              ],
              title: Text("Delete Favourite Chef"),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
        barrierDismissible: false);
  }

  cardItem(name) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.3,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: CachedNetworkImageProvider(
              "https://avatars0.githubusercontent.com/u/44332739?s=400&u=6548a3e31dda13a8d0601e67e1f2a837b04db5e1&v=4"),
        ),
        dense: true,
        title: Text(
          name,
          softWrap: true,
          style: TextStyle(
            color: thatBlueColor(),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: InkWell(
            child: Icon(
              EvaIcons.personDelete,
              color: Colors.red,
            ),
            onTap: () {
              deleteDialog();
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kolor("e1e2e1"),
      appBar: headerGeneral("Favourites"),
      drawer: drawerNav(context),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return cardItem(chefs[index]);
        },
        itemCount: chefs.length,
        padding: EdgeInsets.only(top: 10, bottom: 100, right: 10, left: 10),
      ),
    );
  }
}
