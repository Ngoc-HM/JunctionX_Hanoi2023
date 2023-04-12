import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'sessions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  late Map<int, Widget> CurrentPage = {
    0: Credit(),
    1: Contact(),
    2: Transfer(),
    3: History(),
    4: Settings(),
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[700],
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                ),
          ),
        ),
        elevation: 0,
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.lightGreen[700]!,
        items: [
          TabItem(
            title: 'Trang chủ',
            icon: Icon(Icons.home_filled),
          ),
          TabItem(
            title: 'Danh bạ',
            icon: Icon(Icons.perm_contact_cal_rounded),
          ),
          TabItem(
            title: 'Chuyển khoản',
            icon: Icon(Icons.sync_alt),
          ),
          TabItem(
            title: 'Lịch sử',
            icon: Icon(Icons.history),
          ),
          TabItem(
            title: 'Cài đặt',
            icon: Icon(Icons.settings),
          ),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: CurrentPage[_selectedIndex]
    );
  }
}

