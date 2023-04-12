import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.blue,
        items: [
          TabItem(
            icon: Icon(Icons.home_filled),
          ),
          TabItem(
            icon: Icon(Icons.perm_contact_cal_rounded),
          ),
          TabItem(
            icon: Icon(Icons.sync_alt),
          ),
          TabItem(
            icon: Icon(Icons.history),
          ),
          TabItem(
            icon: Icon(Icons.settings),
          ),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
