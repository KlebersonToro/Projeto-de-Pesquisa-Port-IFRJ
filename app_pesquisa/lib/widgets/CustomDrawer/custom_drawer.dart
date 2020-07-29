import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_port/models/user_manager.dart';
import 'package:test_port/widgets/CustomDrawer/custom_drawer_header.dart';
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
                  //?Se tiver algum usuário logado, exibir o CustomDrawerHeader, senao, exibir um botão de login

                  context.watch<UserManager>().isLoggedIn ? 
                  CustomDrawerHeader() : 
                  Text('Login or Signup'), //? Um card falando para fazer o login

                  Divider(),

                  DrawerTile(
                    title: "/",
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