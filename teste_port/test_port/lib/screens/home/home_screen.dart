
import 'package:flutter/material.dart';
import 'package:test_port/widgets/CustomDrawer/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, 
      child:Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(text: 'Exercicios',), Tab(text: 'lições')
          ]),
          title: Text('App pt'),
        ),
        body: TabBarView(
          children: [
            Container(),
            Container(),
          ],
        )
      )
    );
  }
}