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
            expandedHeight: 200,
            backgroundColor: Colors.lightGreen[700]!,
            flexibleSpace: FlexibleSpaceBar(
              title: Center(child: Text("SOB Bank")),
              titlePadding: EdgeInsets.all(0),
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