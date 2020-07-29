
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, 
      child:Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(text: 'Exercicios',), Tab(text: 'lições')
          ]),
          
        ),
        body: TabBarView(
          children: [
            Container(),
            Container()
          ],
        )
      )
    );
  }
}