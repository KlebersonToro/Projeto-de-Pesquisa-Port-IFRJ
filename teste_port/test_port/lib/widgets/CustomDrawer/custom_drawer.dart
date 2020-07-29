import 'package:flutter/material.dart';
import 'package:test_port/widgets/CustomDrawer/custom_drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          /* Container(
            //color: Theme.of(context).primaryColor,
            height: 80,
            margin: EdgeInsets.all(15),
            child: logoSuspensom,
          ), */
          //MainDrawerHeader(),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              children: <Widget>[
                  Divider(),

                  DrawerTile(
                    title: "Lições",
                    iconData: Icons.note,
                    page: 1,
                  ),
                  
                  DrawerTile(
                    title: "Mensagens",
                    iconData: Icons.chat_bubble,
                    page: 2,
                  ),

              ],
            ),
          )

        ],
      ),
    );
  }
}