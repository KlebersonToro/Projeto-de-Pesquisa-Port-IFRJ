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
            margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: <Widget>[
                  Divider(),

                  DrawerTile(
                    title: "User Screen",
                    iconData: Icons.person,
                    page: 1,
                  ),
                  
                  DrawerTile(
                    title: "Optios",
                    iconData: Icons.settings,
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