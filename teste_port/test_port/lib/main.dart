import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_port/models/page_manager.dart';
import 'package:test_port/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return MultiProvider(
      providers: [
        Provider(
          create: (_) => PageManager(pageController),
        )
      ],
      child: MaterialApp(
        title: 'App Port', //teste III
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
