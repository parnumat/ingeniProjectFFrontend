import 'package:flutter/material.dart';
import 'package:web01/page/homePage.dart';
import 'package:web01/page/registerPage.dart';
import 'package:web01/page/showLuser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        '/home-page': (context) => HomePage(),
        '/register-page': (context) => RegisterPage(),
        '/level-page': (context) => ShowLuserPage(),
      },
    );
  }
}
