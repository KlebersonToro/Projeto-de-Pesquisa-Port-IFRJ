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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //?Se tiver algum usuário logado, exibir o CustomDrawerHeader, senao, exibir um botão de login

                context.watch<UserManager>().isLoggedIn
                    ? CustomDrawerHeader()
                    : GestureDetector(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                          child: Text(
                            'Log In or Sign Up >',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).pushNamed('/login');
                        },
                      ),

                Divider(),

                DrawerTile(
                  title: "Home",
                  iconData: Icons.home,
                  page: 0,
                ),
              
                DrawerTile(
                  title: "Optios",
                  iconData: Icons.settings,
                  page: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
