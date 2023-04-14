import 'package:fintechdemo/src/resources/home_page.dart';
import 'package:flutter/material.dart';
import './resources/login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/login',
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/login': (BuildContext context) => LoginPage(),
    },
    );
  }
}
