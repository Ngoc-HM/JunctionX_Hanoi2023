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
      appBar: AppBar(
        leading: Icon(Icons.menu),
        leadingWidth: 20,
        title: Text("SOB EBANK"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,

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