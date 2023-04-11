import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}): super(key:key);
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 400,
            backgroundColor: Colors.lightGreen[700]!,
            flexibleSpace: FlexibleSpaceBar(
              title: Center(child: Text("SOB Bank",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    background: Colors.white,
                  ),
                )
              ),
              titlePadding: EdgeInsets.all(0),
              background: FittedBox(
                child: Image.network('https://media.istockphoto.com/id/865935122/photo/freshness-spring-green-onion-background.jpg?s=612x612&w=0&k=20&c=XBvhzQCSeQoHTwOWFXGpVJRRTDA4HM0BND39SGR85iA='),
                fit: BoxFit.fill,
              ),

            ),
            actions: [],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}