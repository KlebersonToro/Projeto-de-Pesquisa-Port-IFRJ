import 'package:flutter/material.dart';
import 'package:test_port/screens/stage_screen/stage_screen.dart';
import 'package:test_port/widgets/CustomDrawer/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, 
      child:Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.chat_bubble),), //Feed
            Tab(icon: Icon(Icons.translate)), //modulos
            Tab(icon: Icon(Icons.category),)
          ]),
          title: Text('App pt'),
        ),
        body: TabBarView(
          children: [
            Container(),
            Container(child: ModuleScreen(),),
            Container(),

          ],
        )
      )
    );
  }
}