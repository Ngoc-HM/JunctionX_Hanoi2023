import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexHome(),
    );
  }
}
class IndexHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        titleTextStyle: TextStyle(
            color: Colors.lightGreen,
            fontSize: 24,
        ),
        iconTheme: IconThemeData(
          color: Colors.lightGreen,
        ),
        leading: Icon(Icons.menu),
        leadingWidth: 40,
        title: Text("SOB EBANK"),
        centerTitle: true,
        backgroundColor: Color(0x00000000),
        elevation: 0,
      ),
      body: Center(
          child:
          Text(
            'Hello World',
          )
      ),
    );
  }
}