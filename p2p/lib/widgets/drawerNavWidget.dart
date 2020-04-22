import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';

navRowsText(x) {
  return ListTile(
    leading: Text(
      x,
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
          color: thatBlueColor(), fontSize: 18, fontWeight: FontWeight.w300),
    ),
  );
}

navRows(x, y) {
  return ListTile(
    leading: Icon(
      x,
      color: thatBlueColor(),
      size: 25,
    ),
    title: Text(
      y,
      softWrap: true,
      style: TextStyle(
          color: thatBlueColor(), fontSize: 18, fontWeight: FontWeight.w300),
    ),
  );
}

// App Drawer (Side)
drawerNav(BuildContext context) {
  return SizedBox(
    child: Drawer(
      child: Container(
        color: kolor("#F2F5FB"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 50),
                Container(
                  child: Center(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(
                          "https://avatars0.githubusercontent.com/u/44332739?s=400&u=6548a3e31dda13a8d0601e67e1f2a837b04db5e1&v=4"),
                    ), // This is where the Profile image comes in !
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Yasser Arafat",
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                      color: thatBlueColor(),
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                // Following Rows Display Text and Column
                navRows(Icons.airplay, "Home"),
                navRows(Icons.favorite, "Favourites"),
                navRows(Icons.event_note, "Orders"),
                navRows(Icons.person, "Account"),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Divider(thickness: 1),
                ),
                GestureDetector(
                  child: navRowsText("SETTINGS"),
                  onTap: () {},
                ),
                GestureDetector(
                  child: navRowsText("CONTACT US"),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    ),
    width: MediaQuery.of(context).size.width * 0.65,
    // using a sizedbox to limit width of Drawer
  );
}
