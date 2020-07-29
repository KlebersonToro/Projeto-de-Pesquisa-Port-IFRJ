import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_port/base.dart';
import 'package:test_port/models/page_manager.dart';
import 'package:test_port/screens/exercises/exercises_screen.dart';
import 'package:test_port/screens/lessons/lessons_screen.dart';
import 'package:test_port/screens/login/login_screen.dart';
import 'package:test_port/screens/signup/signup_screen.dart';
import 'models/user_manager.dart';

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
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
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
        //home: HomeScreen(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignupScreen());
            case '/exercises':
              return MaterialPageRoute(builder: (_) => ExercisesScreen());
            
            case '/base': return MaterialPageRoute(builder: (_) => BaseScreen(), settings: settings);

            case '/lessons': 
              return MaterialPageRoute(builder: (_) => LessonScreen());

            default:
              return MaterialPageRoute(builder: (_) => BaseScreen(), settings: settings);
          }
        },
      ),
    );
  }
}
