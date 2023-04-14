import 'package:fintechdemo/src/resources/home_page.dart';
import 'package:flutter/material.dart';
import './resources/login_page.dart';

Map<String, int> map = {
  "/": 0,
  "/contacts": 1,
  "/transfer": 2,
  "/history": 3,
  "/settings": 4,
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/login',
      routes: {
        '/': (BuildContext context) => HomePage(pageIndex: map['/']!),
        '/login': (BuildContext context) => LoginPage(),
        "/contacts": (BuildContext context) => HomePage(pageIndex: map['/contacts']!),
        "/transfer": (BuildContext context) => HomePage(pageIndex: map['/transfer']!),
        "/history": (BuildContext context) => HomePage(pageIndex: map['/history']!),
        "/settings": (BuildContext context) => HomePage(pageIndex: map['/settings']!),
    },
    );
  }
}
