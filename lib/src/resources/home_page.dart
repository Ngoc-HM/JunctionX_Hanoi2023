import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'sessions.dart';

class HomePage extends StatefulWidget {
  int pageIndex = 0;
  HomePage({Key? key, required this.pageIndex}): super(key: key);
  @override
  _HomePage createState() => _HomePage(pageIndex: pageIndex);
}

class _HomePage extends State<HomePage> with TickerProviderStateMixin {
  int pageIndex = 0;
  _HomePage({Key? key, required this.pageIndex});
  late TabController? _tabController;
  late List<Widget> CurrentPage = [ Credit(),
    Contact(),
    Transfer(),
    History(),
    Settings(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    if(_tabController == null) return;
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: pageIndex,
       length: 5,
      child: Scaffold(
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
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[Credit(), Contact(), Transfer(), History(), Settings(),],
      ),
      bottomNavigationBar: ConvexAppBar(
        controller: _tabController,
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
        onTap: (index) {setState(() {
          _tabController!.index = index;
        });},
      ),

    ));
  }
}
