import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_port/models/page_manager.dart';
import 'package:test_port/screens/home/home_screen.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomeScreen(),
            //? Colocar aqui as Telas que serão navegadas no Drawer
          ],
        ),
    );
  }
}