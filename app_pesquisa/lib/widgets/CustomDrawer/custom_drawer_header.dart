import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_port/models/user_manager.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //context.watch<UserManager>().signOut();

    return Container(
      child: Consumer<UserManager>(
        builder: (_, userManager, __){
          print('userManager.user.name: ${userManager.user.name}');
          print('ilsgin: ${userManager.isLoggedIn}');
          return ListTile(
            leading: CircleAvatar(
              child: Center(child: Icon(Icons.person, color: Colors.grey[600],),),
              backgroundColor: Colors.grey[350],
            ),
            title: Text(userManager.user.name, 
              style: TextStyle(fontSize: 16),
            ),
            subtitle: Text(userManager.user.email,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          );
        }
      ),
    );
  }
}